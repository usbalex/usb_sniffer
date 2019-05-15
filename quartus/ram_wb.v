// megafunction wizard: %RAM: 2-PORT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: ram_wb.v
// Megafunction Name(s):
// 			altsyncram
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.1 Build 177 11/07/2012 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module ram_wb (
	address_a,
	address_b,
	byteena_a,
	byteena_b,
	clock_a,
	clock_b,
	data_a,
	data_b,
	enable_a,
	enable_b,
	wren_a,
	wren_b,
	q_a,
	q_b);

	input	[13:0]  address_a;
	input	[13:0]  address_b;
	input	[3:0]  byteena_a;
	input	[3:0]  byteena_b;
	input	  clock_a;
	input	  clock_b;
	input	[31:0]  data_a;
	input	[31:0]  data_b;
	input	  enable_a;
	input	  enable_b;
	input	  wren_a;
	input	  wren_b;
	output	[31:0]  q_a;
	output	[31:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	[3:0]  byteena_a;
	tri1	[3:0]  byteena_b;
	tri1	  clock_a;
	tri1	  enable_a;
	tri1	  enable_b;
	tri0	  wren_a;
	tri0	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [31:0] sub_wire0;
	wire [31:0] sub_wire1;
	wire [31:0] q_a = sub_wire0[31:0];
	wire [31:0] q_b = sub_wire1[31:0];

	altsyncram	altsyncram_component (
				.byteena_a (byteena_a),
				.clock0 (clock_a),
				.clocken1 (enable_b),
				.wren_a (wren_a),
				.byteena_b (byteena_b),
				.clock1 (clock_b),
				.wren_b (wren_b),
				.address_a (address_a),
				.data_a (data_a),
				.address_b (address_b),
				.clocken0 (enable_a),
				.data_b (data_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.eccstatus (),
				.rden_a (1'b1),
				.rden_b (1'b1));
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.byteena_reg_b = "CLOCK1",
		altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "NORMAL",
		altsyncram_component.clock_enable_input_b = "NORMAL",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK1",
		altsyncram_component.intended_device_family = "Cyclone IV E",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 16384,
		altsyncram_component.numwords_b = 16384,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.read_during_write_mode_port_b = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.widthad_a = 14,
		altsyncram_component.widthad_b = 14,
		altsyncram_component.width_a = 32,
		altsyncram_component.width_b = 32,
		altsyncram_component.width_byteena_a = 4,
		altsyncram_component.width_byteena_b = 4,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
// Retrieval info: PRIVATE: ADDRESSSTALL_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "1"
// Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "1"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "1"
// Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_B NUMERIC "1"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "1"
// Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_B NUMERIC "1"
// Retrieval info: PRIVATE: CLRdata NUMERIC "0"
// Retrieval info: PRIVATE: CLRq NUMERIC "0"
// Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren NUMERIC "0"
// Retrieval info: PRIVATE: CLRwraddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRwren NUMERIC "0"
// Retrieval info: PRIVATE: Clock NUMERIC "5"
// Retrieval info: PRIVATE: Clock_A NUMERIC "0"
// Retrieval info: PRIVATE: Clock_B NUMERIC "0"
// Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "1"
// Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_A"
// Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
// Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: PRIVATE: MEMSIZE NUMERIC "524288"
// Retrieval info: PRIVATE: MEM_IN_BITS NUMERIC "0"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: OPERATION_MODE NUMERIC "3"
// Retrieval info: PRIVATE: OUTDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: OUTDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "2"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_B NUMERIC "3"
// Retrieval info: PRIVATE: REGdata NUMERIC "1"
// Retrieval info: PRIVATE: REGq NUMERIC "0"
// Retrieval info: PRIVATE: REGrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: REGrren NUMERIC "0"
// Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
// Retrieval info: PRIVATE: REGwren NUMERIC "1"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: USE_DIFF_CLKEN NUMERIC "0"
// Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
// Retrieval info: PRIVATE: VarWidth NUMERIC "0"
// Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "32"
// Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "32"
// Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "32"
// Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "32"
// Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "1"
// Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: enable NUMERIC "1"
// Retrieval info: PRIVATE: rden NUMERIC "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: ADDRESS_REG_B STRING "CLOCK1"
// Retrieval info: CONSTANT: BYTEENA_REG_B STRING "CLOCK1"
// Retrieval info: CONSTANT: BYTE_SIZE NUMERIC "8"
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_A STRING "NORMAL"
// Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_B STRING "NORMAL"
// Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_A STRING "BYPASS"
// Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_B STRING "BYPASS"
// Retrieval info: CONSTANT: INDATA_REG_B STRING "CLOCK1"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "16384"
// Retrieval info: CONSTANT: NUMWORDS_B NUMERIC "16384"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "BIDIR_DUAL_PORT"
// Retrieval info: CONSTANT: OUTDATA_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_REG_A STRING "UNREGISTERED"
// Retrieval info: CONSTANT: OUTDATA_REG_B STRING "UNREGISTERED"
// Retrieval info: CONSTANT: POWER_UP_UNINITIALIZED STRING "FALSE"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_PORT_A STRING "NEW_DATA_NO_NBE_READ"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_PORT_B STRING "NEW_DATA_NO_NBE_READ"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "14"
// Retrieval info: CONSTANT: WIDTHAD_B NUMERIC "14"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "32"
// Retrieval info: CONSTANT: WIDTH_B NUMERIC "32"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "4"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_B NUMERIC "4"
// Retrieval info: CONSTANT: WRCONTROL_WRADDRESS_REG_B STRING "CLOCK1"
// Retrieval info: USED_PORT: address_a 0 0 14 0 INPUT NODEFVAL "address_a[13..0]"
// Retrieval info: USED_PORT: address_b 0 0 14 0 INPUT NODEFVAL "address_b[13..0]"
// Retrieval info: USED_PORT: byteena_a 0 0 4 0 INPUT VCC "byteena_a[3..0]"
// Retrieval info: USED_PORT: byteena_b 0 0 4 0 INPUT VCC "byteena_b[3..0]"
// Retrieval info: USED_PORT: clock_a 0 0 0 0 INPUT VCC "clock_a"
// Retrieval info: USED_PORT: clock_b 0 0 0 0 INPUT NODEFVAL "clock_b"
// Retrieval info: USED_PORT: data_a 0 0 32 0 INPUT NODEFVAL "data_a[31..0]"
// Retrieval info: USED_PORT: data_b 0 0 32 0 INPUT NODEFVAL "data_b[31..0]"
// Retrieval info: USED_PORT: enable_a 0 0 0 0 INPUT VCC "enable_a"
// Retrieval info: USED_PORT: enable_b 0 0 0 0 INPUT VCC "enable_b"
// Retrieval info: USED_PORT: q_a 0 0 32 0 OUTPUT NODEFVAL "q_a[31..0]"
// Retrieval info: USED_PORT: q_b 0 0 32 0 OUTPUT NODEFVAL "q_b[31..0]"
// Retrieval info: USED_PORT: wren_a 0 0 0 0 INPUT GND "wren_a"
// Retrieval info: USED_PORT: wren_b 0 0 0 0 INPUT GND "wren_b"
// Retrieval info: CONNECT: @address_a 0 0 14 0 address_a 0 0 14 0
// Retrieval info: CONNECT: @address_b 0 0 14 0 address_b 0 0 14 0
// Retrieval info: CONNECT: @byteena_a 0 0 4 0 byteena_a 0 0 4 0
// Retrieval info: CONNECT: @byteena_b 0 0 4 0 byteena_b 0 0 4 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock_a 0 0 0 0
// Retrieval info: CONNECT: @clock1 0 0 0 0 clock_b 0 0 0 0
// Retrieval info: CONNECT: @clocken0 0 0 0 0 enable_a 0 0 0 0
// Retrieval info: CONNECT: @clocken1 0 0 0 0 enable_b 0 0 0 0
// Retrieval info: CONNECT: @data_a 0 0 32 0 data_a 0 0 32 0
// Retrieval info: CONNECT: @data_b 0 0 32 0 data_b 0 0 32 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 wren_a 0 0 0 0
// Retrieval info: CONNECT: @wren_b 0 0 0 0 wren_b 0 0 0 0
// Retrieval info: CONNECT: q_a 0 0 32 0 @q_a 0 0 32 0
// Retrieval info: CONNECT: q_b 0 0 32 0 @q_b 0 0 32 0
// Retrieval info: GEN_FILE: TYPE_NORMAL ram_wb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ram_wb.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ram_wb.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ram_wb.bsf TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ram_wb_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ram_wb_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
