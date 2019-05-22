#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 12.1 Build 177 11/07/2012 SJ Web Edition
#
#************************************************************

# Copyright (C) 1991-2012 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name "usb_clk" -period 16.667ns [get_ports {usb_clk60}] -waveform {0.000 8.334}


# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty

# tsu/th constraints

#set_input_delay -clock "usb_clk" -max 5.000ns [get_ports {usb_ulpi_data[0] usb_ulpi_data[1] usb_ulpi_data[2] usb_ulpi_data[3] usb_ulpi_data[4] usb_ulpi_data[5] usb_ulpi_data[6] usb_ulpi_data[7] usb_ulpi_dir usb_ulpi_nxt}] 
#set_input_delay -clock "usb_clk" -min 2.000ns [get_ports {usb_ulpi_data[0] usb_ulpi_data[1] usb_ulpi_data[2] usb_ulpi_data[3] usb_ulpi_data[4] usb_ulpi_data[5] usb_ulpi_data[6] usb_ulpi_data[7] usb_ulpi_dir usb_ulpi_nxt}] 


# tco constraints

	#set_output_delay -clock "usb_clk" -max  2.000ns [get_ports {usb_ulpi_data[0] usb_ulpi_data[1] usb_ulpi_data[2] usb_ulpi_data[3] usb_ulpi_data[4] usb_ulpi_data[5] usb_ulpi_data[6] usb_ulpi_data[7] top_core:u_core|ulpi_wrapper:u_ulpi|ulpi_stp_q usb_ulpi_stp}] 
#set_output_delay -clock "usb_clk" -min -2.000ns [get_ports {usb_ulpi_data[0] usb_ulpi_data[1] usb_ulpi_data[2] usb_ulpi_data[3] usb_ulpi_data[4] usb_ulpi_data[5] usb_ulpi_data[6] usb_ulpi_data[7] top_core:u_core|ulpi_wrapper:u_ulpi|ulpi_stp_q usb_ulpi_stp}] 


# tpd constraints

#set_max_delay 2.000ns -from [get_ports {usb_ulpi_dir}] -to [get_ports {usb_ulpi_data[0] usb_ulpi_data[1] usb_ulpi_data[2] usb_ulpi_data[3] usb_ulpi_data[4] usb_ulpi_data[5] usb_ulpi_data[6] usb_ulpi_data[7] top_core:u_core|ulpi_wrapper:u_ulpi|ulpi_stp_q usb_ulpi_stp}]
#set_min_delay 0.000ns -from [get_ports {usb_ulpi_dir}] -to [get_ports {usb_ulpi_data[0] usb_ulpi_data[1] usb_ulpi_data[2] usb_ulpi_data[3] usb_ulpi_data[4] usb_ulpi_data[5] usb_ulpi_data[6] usb_ulpi_data[7] top_core:u_core|ulpi_wrapper:u_ulpi|ulpi_stp_q usb_ulpi_stp}]


