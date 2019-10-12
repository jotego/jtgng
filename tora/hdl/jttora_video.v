/*  This file is part of JT_GNG.
    JT_GNG program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JT_GNG program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JT_GNG.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 12-10-2019 */

module jttora_video(
    input               rst,
    input               clk,
    input               cen12,
    input               cen6,
    input               cen3,
    input               cpu_cen,
    input       [13:1]  cpu_AB,
    input       [ 7:0]  V,
    input       [ 8:0]  H,
    input               RnW,
    input               flip,
    input       [15:0]  cpu_dout,
    input               pause,
    // CHAR
    input               char_cs,
    output      [ 7:0]  char_dout,
    input               char_ok,
    output              char_busy,
    output      [12:0]  char_addr,
    input       [15:0]  char_data,
    // SCROLL
    output      [17:0]  scr_addr,
    input       [15:0]  scr_data,
    input               scr_ok,
    input       [15:0]  scr_hpos,
    input       [15:0]  scr_vpos,
    // MAP
    output      [13:0]  map1_addr,
    input       [15:0]  map1_data,
    // OBJ
    input               HINIT,
    output      [13:1]  obj_AB,
    input       [11:0]  oram_dout,   // only 12 bits are read
    input               OKOUT,
    output              bus_req, // Request bus
    input               bus_ack, // bus acknowledge
    output              blcnten,    // bus line counter enable
    output      [16:0]  obj_addr,
    input       [31:0]  obj_data,
    input               obj_ok,
    // Color Mix
    input               LVBL,
    input               LVBL_obj,
    input               LHBL,
    input               LHBL_obj,
    output              LHBL_dly,
    output              LVBL_dly,
    input               col_uw,
    input               col_lw,
    input       [3:0]   gfx_en,
    // Priority PROM
    input       [7:0]   prog_addr,
    input               prom_prio_we,
    input       [3:0]   prom_din,
    // Pixel output
    output      [3:0]   red,
    output      [3:0]   green,
    output      [3:0]   blue
);

// parameters from jtgng_colmix:
parameter SCRWIN        = 1,
          PALETTE_PROM  = 0,
          PALETTE_RED   = "",
          PALETTE_GREEN = "",
          PALETTE_BLUE  = "";
parameter [1:0] OBJ_PAL = 2'b01; // 01 for GnG, 10 for Commando
    // These two bits mark the region of the palette RAM/PROM where
    // palettes for objects are stored
    
// parameters from jtgng_obj:
parameter AVATAR_MAX    = 8;

wire [5:0] char_pxl;
wire [7:0] obj_pxl;
wire [3:0] scr_col, scr_pal;
wire [3:0] avatar_idx;

`ifndef NOCHAR

wire [7:0] char_msg_low;
wire [7:0] char_msg_high;
wire [9:0] char_scan;

jtgng_char #(.HOFFSET(0)) u_char (
    .clk        ( clk           ),
    .pxl_cen    ( cen6          ),
    .cpu_cen    ( cpu_cen       ),
    .AB         ( cpu_AB[11:1]  ),
    .V          ( V             ),
    .H          ( H[7:0]        ),
    .flip       ( flip          ),
    .din        ( cpu_dout[7:0] ),
    .dout       ( char_dout     ),
    // Bus arbitrion
    .char_cs    ( char_cs       ),
    .wr_n       ( RnW           ),
    .busy       ( char_busy     ),
    // Pause screen
    .pause      ( pause         ),
    .scan       ( char_scan     ),
    .msg_low    ( char_msg_low  ),
    .msg_high   ( char_msg_high ),
    // ROM
    .char_addr  ( char_addr     ),
    .rom_data   ( char_data     ),
    .rom_ok     ( char_ok       ),
    // Pixel output
    .char_on    ( 1'b1          ),
    .char_pxl   ( char_pxl      ),
    // unused
    .prog_addr  (               ),
    .prog_din   (               ),
    .prom_we    (               )
);

jtgng_charmsg u_msg(
    .clk         ( clk           ),
    .cen6        ( cen6          ),
    .avatar_idx  ( avatar_idx    ),
    .scan        ( char_scan     ),
    .msg_low     ( char_msg_low  ),
    .msg_high    ( char_msg_high ) 
);
`else
assign char_mrdy = 1'b1;
`endif

`ifndef NOSCR
jt1943_scroll #(
    .PALETTE    ( 0        ),
    .ROM_AW     ( 18       ),
    .HOFFSET    ( 0        ))
u_scroll (
    .rst          ( rst           ),
    .clk          ( clk           ),
    .cen6         ( cen6          ),
    .cen3         ( cen3          ),
    .V128         ( V[7:0]        ),
    .H            ( H             ),
    .LVBL         ( LVBL          ),
    .LHBL         ( LHBL          ),
    .scrposh_cs   ( scr1posh_cs   ),
    `ifndef TESTSCR1
    .SCxON        ( SC1ON         ),
    .vpos         ( scrposv       ),
    .flip         ( flip          ),
    `else // TEST:
        .SCxON        ( 1'b1          ),
        .vpos         ( 8'd0          ),
        .flip         ( 1'b0          ),
    `endif
    .din          ( cpu_dout       ),
    .wr_n         ( wr_n           ),
    .pause        ( pause          ),
    // Palette PROMs
    .prog_addr    ( prog_addr      ),
    .prom_hi_we   ( prom_scr1hi_we ),
    .prom_lo_we   ( prom_scr1lo_we ),
    .prom_din     ( prog_din       ),

    // ROM
    .map_addr     ( map_addr       ),
    .map_data     ( map_data       ),
    .scr_addr     ( scr_addr       ),
    .scrom_data   ( scr_data       ),
    .scr_pxl      ( scr_pxl        )
);

`else
assign scr_col    = 3'd0;
assign scr_pal    = 3'd0;
assign scr_addr   = 15'd0;
assign scr_dout   = 8'd0;
`endif

jtgng_obj #(
    .AVATAR_MAX ( AVATAR_MAX ),
    .LAYOUT     ( 3          ),
    .OBJMAX     ( 10'h280    ), // 160 objects max, buffer size = 640 bytes (280h)
    .OBJMAX_LINE( 5'd31      ),
    .PALW       ( 4          ),
    .ROM_AW     ( 16         ),
    .ROM_DW     ( 32         ), // total 256kBytes of object graphic data
    .DMA_AW     ( 10         ),
    .DMA_DW     ( 12         ))
u_obj (
    .rst        ( rst         ),
    .clk        ( clk         ),
    .cen6       ( cen6        ),
    .AB         ( obj_AB[10:1]),
    .DB         ( oram_dout   ),
    .OKOUT      ( OKOUT       ),
    .bus_req    ( bus_req     ),
    .bus_ack    ( bus_ack     ),
    .blen       ( blcnten     ),
    .LHBL       ( LHBL_obj    ),
    .LVBL       ( LVBL        ),
    .LVBL_obj   ( LVBL_obj    ),
    .HINIT      ( HINIT       ),
    .flip       ( flip        ),
    .V          ( V[7:0]      ),
    .H          ( H           ),
    // avatar display
    .pause      ( pause       ),
    .avatar_idx ( avatar_idx  ),
    // SDRAM interface
    .obj_addr   ( obj_addr    ),
    .obj_data   ( obj_data    ),
    .rom_ok     ( obj_ok      ),
    // pixel data
    .obj_pxl    ( obj_pxl     ),
    // unused
    .OBJON      ( 1'b1        ) // not used for non palette PROM games
);

assign obj_AB[13:11] = 3'b111;

`ifndef NOCOLMIX
jttora_colmix u_colmix (
    .rst          ( rst           ),
    .clk          ( clk           ),
    .cen6         ( cen6          ),
    .cpu_cen      ( cpu_cen       ),

    .char_pxl     ( char_pxl      ),
    .scr_pxl      ( { scr_pal, scr_col } ),
    .obj_pxl      ( obj_pxl       ),
    .LVBL         ( LVBL          ),
    .LHBL         ( LHBL          ),
    .LHBL_dly     ( LHBL_dly      ),
    .LVBL_dly     ( LVBL_dly      ),

    // PROMs
    .prog_addr    ( prog_addr     ),
    .prom_prio_we ( prom_prio_we  ),
    .prom_din     ( prom_din      ),    

    // Avatars
    // .pause        ( pause         ),
    // .avatar_idx   ( avatar_idx    ),

    // DEBUG
    .gfx_en       ( gfx_en        ),

    // CPU interface
    .AB           ( cpu_AB[10:1]  ),
    .col_uw       ( col_uw        ),
    .col_lw       ( col_lw        ),
    .DB           ( cpu_dout      ),

    // colour output
    .red          ( red           ),
    .green        ( green         ),
    .blue         ( blue          )
);
`else
assign  red = 4'd0;
assign blue = 4'd0;
assign green= 4'd0;
`endif

endmodule // jttora_video