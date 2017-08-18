## Generated SDC file "jtgng.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

<<<<<<< HEAD
## DATE    "Fri Aug 11 08:00:55 2017"
=======
## DATE    "Fri Aug 11 10:38:54 2017"
>>>>>>> ba233eb145d47306b2c76ac395651577b385fc9c

##
## DEVICE  "EP3C25E144C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_27[0]} -period 37.037 -waveform { 0.000 18.518 } [get_ports {CLOCK_27[0]}]
create_clock -name {SPI_SCK} -period 41.666 -waveform { 0.000 0.500 } [get_ports {SPI_SCK}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {clk_E} -source [get_nets {clk_gen|altpll_component|auto_generated|wire_pll1_clk[0]}] -divide_by 4 -phase 180.000 -master_clock {clk_pxl} [get_keepers {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] 
create_generated_clock -name {clk_Q} -source [get_nets {game|main|cpu|rE}] -phase 270.000 -master_clock {clk_E} [get_nets {game|main|cpu|rQ}] 
create_generated_clock -name {clk_pxl} -source [get_pins {clk_gen|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -divide_by 9 -master_clock {CLOCK_27[0]} [get_pins {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

<<<<<<< HEAD
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -rise_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -fall_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -rise_to [get_clocks {clk_Q}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -fall_to [get_clocks {clk_Q}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -rise_to [get_clocks {clk_E}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -fall_to [get_clocks {clk_E}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -rise_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -rise_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -fall_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {clk_pxl}] -fall_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -rise_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -fall_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -rise_to [get_clocks {clk_Q}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -fall_to [get_clocks {clk_Q}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -rise_to [get_clocks {clk_E}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -fall_to [get_clocks {clk_E}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -rise_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -rise_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -fall_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {clk_pxl}] -fall_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_Q}] -rise_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_Q}] -fall_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_Q}] -rise_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_Q}] -fall_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_Q}] -rise_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_Q}] -fall_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_Q}] -rise_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_Q}] -fall_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -rise_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -fall_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -rise_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -fall_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -rise_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -rise_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -fall_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {clk_E}] -fall_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -rise_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -fall_to [get_clocks {clk_pxl}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -rise_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -fall_to [get_clocks {clk_E}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -rise_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -rise_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -fall_to [get_clocks {CLOCK_27[0]}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {clk_E}] -fall_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {clk_pxl}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {clk_pxl}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {clk_pxl}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {clk_pxl}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {SPI_SCK}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {SPI_SCK}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {CLOCK_27[0]}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {CLOCK_27[0]}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {clk_pxl}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {clk_pxl}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {clk_pxl}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {clk_pxl}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {SPI_SCK}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {SPI_SCK}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {CLOCK_27[0]}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -rise_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {CLOCK_27[0]}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {SPI_SCK}] -fall_to [get_clocks {CLOCK_27[0]}] -hold 0.150  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_27[0]}] -rise_to [get_clocks {clk_pxl}] -setup 0.150  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_27[0]}] -rise_to [get_clocks {clk_pxl}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_27[0]}] -fall_to [get_clocks {clk_pxl}] -setup 0.150  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_27[0]}] -fall_to [get_clocks {clk_pxl}] -hold 0.130  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_27[0]}] -rise_to [get_clocks {CLOCK_27[0]}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_27[0]}] -fall_to [get_clocks {CLOCK_27[0]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_27[0]}] -rise_to [get_clocks {clk_pxl}] -setup 0.150  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_27[0]}] -rise_to [get_clocks {clk_pxl}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_27[0]}] -fall_to [get_clocks {clk_pxl}] -setup 0.150  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_27[0]}] -fall_to [get_clocks {clk_pxl}] -hold 0.130  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_27[0]}] -rise_to [get_clocks {CLOCK_27[0]}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_27[0]}] -fall_to [get_clocks {CLOCK_27[0]}]  0.150  
=======
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -setup 0.090  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.060  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.090  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rQ}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.010  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[3]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
>>>>>>> ba233eb145d47306b2c76ac395651577b385fc9c


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

<<<<<<< HEAD
set_false_path -from [get_pins {clk_gen|altpll_component|auto_generated|pll1|clk[0]}] -to [get_keepers {jtgng_game:game|jtgng_rom:rom|pxl_sh[0]}]
=======
set_false_path  -from  [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]  -to  [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]
set_false_path  -from  [get_clocks {clk_gen|altpll_component|auto_generated|pll1|clk[2]}]  -to  [get_clocks {jtgng_game:game|jtgng_main:main|mc6809:cpu|rE}]
set_false_path -from [get_keepers {user_io:userio|joystick_0[*]}] -to [get_keepers {jtgng_game:game|jtgng_main:main|cpu_din[*]}]
set_false_path -from [get_keepers {user_io:userio|joystick_1[*]}] -to [get_keepers {jtgng_game:game|jtgng_main:main|cpu_din[*]}]
set_false_path -from [get_keepers {user_io:userio|status[*]}] -to [get_keepers {jtgng_game:game|jtgng_main:main|cpu_din[*]}]
set_false_path -from [get_keepers {user_io:userio|status[5]}] -to [get_keepers {jtgng_game:game|jtgng_main:main|nRESET}]
>>>>>>> ba233eb145d47306b2c76ac395651577b385fc9c


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

