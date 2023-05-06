/*  This file is part of JTCORES.
    JTCORES program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTCORES program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTCORES.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 6-5-2023 */

module jtaliens_sound(
    input           rst,
    input           clk,        // 24 MHz
    input           cen_fm,
    input           cen_fm2,
    input   [ 1:0]  fxlevel,
    // communication with main CPU
    input           snd_irq,
    input   [ 7:0]  snd_latch,
    // ROM
    output  [14:0]  rom_addr,
    output  reg     rom_cs,
    input   [ 7:0]  rom_data,
    input           rom_ok,
    // ADPCM ROM
    output   [17:0] pcma_addr,
    input    [ 7:0] pcma_dout,
    output          pcma_cs,
    input           pcma_ok,

    output   [17:0] pcmb_addr,
    input    [ 7:0] pcmb_dout,
    output          pcmb_cs,
    input           pcmb_ok,

    // Sound output
    output signed [15:0] snd,
    output               sample,
    output               peak,
    // Debug
    input    [ 7:0] debug_bus,
    output   [ 7:0] st_dout
);
`ifndef NOSOUND

localparam [7:0] FMGAIN=8'h10;

wire        [ 7:0]  cpu_dout, ram_dout, fm_dout;
wire        [15:0]  A;
reg         [ 7:0]  cpu_din;
wire                m1_n, mreq_n, rd_n, wr_n, iorq_n, rfsh_n,
                    pcma_msb, pcmb_msb;
reg                 ram_cs, latch_cs, fm_cs, dac_cs, iock;
wire signed [15:0]  fm_left, fm_right;
wire                cpu_cen;
reg                 mem_acc, mem_upper;
wire signed [11:0]  pcm_snd;

assign rom_addr = A[14:0];
assign st_dout  = { 6'd0, pcmb_msb, pcma_msb };

// This connection is done through the NE output
// of the 007232 on the board by using a latch
// I can simplify it here:
assign pcma_addr[17] = pcma_msb;
assign pcmb_addr[17] = pcmb_msb;

always @(*) begin
    mem_acc  = !mreq_n && rfsh_n;
    rom_cs   = mem_acc && !A[15] && !rd_n;
    // Devices
    mem_upper = mem_acc && A[15];
    // the schematics show an IOCK output which
    // isn't connected on the real PCB
    ram_cs    = mem_upper && A[14:13]==0; // 8/9xxx
    fm_cs     = mem_upper && A[14:13]==1; // A/Bxxx
    latch_cs  = mem_upper && A[14:13]==2; // C/Dxxx
    dac_cs    = mem_upper && A[14:13]==3; // E/Fxxx
end

always @(*) begin
    case(1'b1)
        rom_cs:      cpu_din = rom_data;
        ram_cs:      cpu_din = ram_dout;
        latch_cs:    cpu_din = snd_latch;
        fm_cs:       cpu_din = fm_dout;
        default:     cpu_din = 8'hff;
    endcase
end

reg [7:0] fxgain;

always @(*) begin
    case( fxlevel )
        0: fxgain = 8'h02;
        1: fxgain = 8'h04;
        2: fxgain = 8'h08;
        3: fxgain = 8'h10;
    endcase
end

jtframe_mixer #(.W0(16),.W1(16),.W2(12)) u_mixer(
    .rst    ( rst        ),
    .clk    ( clk        ),
    .cen    ( cen_fm     ),
    .ch0    ( fm_left    ),
    .ch1    ( fm_right   ),
    .ch2    ( pcm_snd    ),
    .ch3    ( 16'd0      ),
    .gain0  ( FMGAIN     ),
    .gain1  ( FMGAIN     ),
    .gain2  ( fxgain     ),
    .gain3  ( 8'd0       ),
    .mixed  ( snd        ),
    .peak   ( peak       )
);

jtframe_sysz80 #(.RAM_AW(11),.CLR_INT(1)) u_cpu(
    .rst_n      ( ~rst      ),
    .clk        ( clk       ),
    .cen        ( cen_fm    ),
    .cpu_cen    ( cpu_cen   ),
    .int_n      ( ~snd_irq  ),
    .nmi_n      ( 1'b1      ),
    .busrq_n    ( 1'b1      ),
    .m1_n       ( m1_n      ),
    .mreq_n     ( mreq_n    ),
    .iorq_n     ( iorq_n    ),
    .rd_n       ( rd_n      ),
    .wr_n       ( wr_n      ),
    .rfsh_n     ( rfsh_n    ),
    .halt_n     (           ),
    .busak_n    (           ),
    .A          ( A         ),
    .cpu_din    ( cpu_din   ),
    .cpu_dout   ( cpu_dout  ),
    .ram_dout   ( ram_dout  ),
    // ROM access
    .ram_cs     ( ram_cs    ),
    .rom_cs     ( rom_cs    ),
    .rom_ok     ( rom_ok    )
);

jt51 u_jt51(
    .rst        ( rst       ), // reset
    .clk        ( clk       ), // main clock
    .cen        ( cen_fm    ),
    .cen_p1     ( cen_fm2   ),
    .cs_n       ( !fm_cs    ), // chip select
    .wr_n       ( wr_n      ), // write
    .a0         ( A[0]      ),
    .din        ( cpu_dout  ), // data in
    .dout       ( fm_dout   ), // data out
    .ct1        ( pcma_msb  ),
    .ct2        ( pcmb_msb  ),
    .irq_n      (           ),
    // Low resolution output (same as real chip)
    .sample     ( sample    ), // marks new output sample
    .left       (           ),
    .right      (           ),
    // Full resolution output
    .xleft      ( fm_left   ),
    .xright     ( fm_right  )
);

jt007232 #(.REG12A(0)) u_pcm(
    .rst        ( rst       ),
    .clk        ( clk       ),
    .cen        ( cen_fm    ),
    .addr       ( A[3:0]    ),
    .dacs       ( dac_cs    ), // active high
    .cen_q      (           ),
    .cen_e      (           ),
    .wr_n       ( wr_n      ),
    .din        ( cpu_dout  ),

    // External memory - the original chip
    // only had one bus
    .roma_addr  ( pcma_addr[16:0] ),
    .roma_dout  ( pcma_dout ),
    .roma_cs    ( pcma_cs   ),
    .roma_ok    ( pcma_ok   ),

    .romb_addr  ( pcmb_addr[16:0] ),
    .romb_dout  ( pcmb_dout ),
    .romb_cs    ( pcmb_cs   ),
    .romb_ok    ( pcmb_ok   ),
    // sound output - raw
    .snda       (           ),
    .sndb       (           ),
    .snd        ( pcm_snd   )
);
`else
initial rom_cs   = 0;
assign  pcma_cs  = 0;
assign  pcmb_cs  = 0;
assign  pcma_addr= 0;
assign  pcmb_addr= 0;
assign  rom_addr = 0;
assign  snd      = 0;
assign  peak     = 0;
assign  sample   = 0;
`endif
endmodule
