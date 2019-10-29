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
    Date: 29-10-2019 */

// Converts 4bpp object data from an eight pixel packed format
// to a four pixel format

`timescale 1ns/1ps

module jtgng_obj32(
    input                clk,
    input                rst,
    input                downloading,
    input      [31:0]    sdram_dout,

    output reg           convert,
    output reg [21:0]    prog_addr,
    output reg [ 7:0]    prog_data,
    output reg [ 1:0]    prog_mask, // active low
    output reg           prog_we,
    output reg           prom_we
);

parameter [21:0] OBJ_START=22'h20_0000;
parameter [21:0] OBJ_END  =22'h22_0000;

reg [31:0] obj_data;
reg [7:0]  sdram_wait;
reg last_down;
reg [7:0]  state;

always @(posedge clk, posedge rst) begin
    if( rst ) begin
        prog_addr <= 22'd0;
        prog_data <= 8'd0;
        prog_mask <= 2'd0;
        prog_we   <= 1'b0;
        prom_we   <= 1'b0;
    end else begin
        last_down <= downloading;
        prog_we  <= 1'b0;
        if( !downloading && last_down ) begin
            read_addr <= OBJ_START;
            convert   <= 1'b1;
        end
        if( convert && prog_addr < OBJ_END ) begin
            if( !sdram_wait[7] ) begin
                sdram_wait <= { sdram_wait[6:0], 1'b1 };
            end else begin
                state <= state<<1;
                prog_addr[21:1] <= read_addr[21:1];
                case( state )
                    8'd1: begin
                        prog_mask <= 2'b11;
                        prog_we   <= 1'b0;
                        sdram_wait <= 8'd0;
                    end
                    8'd2: begin
                        obj_data <= sdram_dout;
                    end
                    8'd4: begin
                        prog_addr[0] <= 1'b0;
                        prog_data <= { obj_data[2*7:2*4], obj_data[1*7,1*4]};
                        prog_mask <= 2'b01;
                        prog_we   <= 1'b1;
                        sdram_wait <= 8'd0;
                    end
                    8'd8: begin
                        prog_addr[0] <= 1'b0;
                        prog_data <= { obj_data[4*7:4*4], obj_data[3*7,3*4]};
                        prog_mask <= 2'b10;
                        prog_we   <= 1'b1;
                        sdram_wait <= 8'd0;
                    end
                    8'h10: begin
                        prog_addr[0] <= 1'b1;
                        prog_data <= { obj_data[2*7:2*4], obj_data[1*7,1*4]};
                        prog_mask <= 2'b01;
                        prog_we   <= 1'b1;
                        sdram_wait <= 8'd0;
                    end
                    8'h20: begin
                        prog_addr[0] <= 1'b1;
                        prog_data <= { obj_data[4*7:4*4], obj_data[3*7,3*4]};
                        prog_mask <= 2'b10;
                        prog_we   <= 1'b1;
                        sdram_wait <= 8'd0;
                    end
                    8'h40: begin
                        read_addr <= read_addr+22'h2;
                        state     <= 8'h1;
                    end
                endcase
                end
            end
        end else convert<=1'b0;
    end
end

endmodule