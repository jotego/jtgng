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
    Date: 23-11-2024 */

module jtflstory_header(
    input       clk,
                header, prog_we,
    input [2:0] prog_addr,
    input [7:0] prog_data,
    output reg  mirror=0, mcu_enb=0, coinxor=0
);

localparam [2:0] MIRROR_OFFSET  = 3'd1,
                 MCUENB_OFFSET  = 3'd2,
                 COINXOR_OFFSET = 3'd3;

always @(posedge clk) begin
    if( header && prog_addr[2:0]==MIRROR_OFFSET  && prog_we ) mirror  <= prog_data[0];
    if( header && prog_addr[2:0]==MCUENB_OFFSET  && prog_we ) mcu_enb <= prog_data[0];
    if( header && prog_addr[2:0]==COINXOR_OFFSET && prog_we ) coinxor <= prog_data[0];
end

endmodule