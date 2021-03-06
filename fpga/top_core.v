//-----------------------------------------------------------------
// top_core
//-----------------------------------------------------------------
module top_core
(
    // ULPI PHY clock (60MHz)
    input           clk_i,
    input           rst_i,

    // ULPI Interface
    input  [7:0]    ulpi_data_i,
    output [7:0]    ulpi_data_o,
    input           ulpi_dir_i,
    input           ulpi_nxt_i,
    output          ulpi_stp_o,

    // MISC
    output [7:0]    leds
);

//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
parameter       CLK_KHZ             = 60000;
parameter       UART_BAUD           = 115200;
parameter       SPI_CLK_KHZ         = CLK_KHZ / 5;
parameter       BOOT_VECTOR         = 32'h00000000;
parameter       ISR_VECTOR          = 32'h00000010;

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------
wire [7:0]  ftdi_gpio_w;

//-----------------------------------------------------------------
// ULPI
//-----------------------------------------------------------------

wire [1:0]              xcvrselect_w;
wire                    termselect_w;
wire [1:0]              op_mode_w;
wire                    dppulldown_w;
wire                    dmpulldown_w;

wire [7:0]              utmi_data_w = 8'b0;
wire [7:0]              utmi_data_r;
//wire                    utmi_txvalid = 1'b1;
wire                    utmi_txvalid = 1'b0;
wire                    utmi_txready;
wire                    utmi_rxvalid;
wire                    utmi_rxactive;
wire                    utmi_rxerror;
wire [1:0]              utmi_linestate;

ulpi_wrapper
u_ulpi
(
    .ulpi_clk60_i(clk_i),
    .ulpi_rst_i(rst_i),

    // ULPI Interface
    .ulpi_data_out_i(ulpi_data_i),
    .ulpi_data_in_o(ulpi_data_o),
    .ulpi_dir_i(ulpi_dir_i),
    .ulpi_nxt_i(ulpi_nxt_i),
    .ulpi_stp_o(ulpi_stp_o),

    // UTMI Interface
    .utmi_txvalid_i(utmi_txvalid),
    .utmi_txready_o(utmi_txready),
    .utmi_rxvalid_o(utmi_rxvalid),
    .utmi_rxactive_o(utmi_rxactive),
    .utmi_rxerror_o(utmi_rxerror),
    .utmi_data_in_o(utmi_data_r),
    .utmi_data_out_i(utmi_data_w),
    .utmi_xcvrselect_i(xcvrselect_w),
    .utmi_termselect_i(termselect_w),
    .utmi_op_mode_i(op_mode_w),
    .utmi_dppulldown_i(dppulldown_w),
    .utmi_dmpulldown_i(dmpulldown_w),
    .utmi_linestate_o(utmi_linestate)
);

//-----------------------------------------------------------------
//// FTDI Interface
// JTAG Interface
//-----------------------------------------------------------------
wire[31:0]  ftdi_address_w;
wire[31:0]  ftdi_data_w;
wire[31:0]  ftdi_data_r;
wire[3:0]   ftdi_sel_w;
wire        ftdi_we_w;
wire        ftdi_stb_w;
wire        ftdi_cyc_w;
wire        ftdi_stall_w;
wire        ftdi_ack_w;

//ftdi_if
//u_ftdi
altera_jtag_if
u_jtag
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    .gp_o(ftdi_gpio_w),
    .gp_i(ftdi_gpio_w),

    // Wishbone
    .mem_addr_o(ftdi_address_w),
    .mem_data_o(ftdi_data_w),
    .mem_data_i(ftdi_data_r),
    .mem_sel_o(ftdi_sel_w),
    .mem_we_o(ftdi_we_w),
    .mem_stb_o(ftdi_stb_w),
    .mem_cyc_o(ftdi_cyc_w),
    .mem_ack_i(ftdi_ack_w),
    .mem_stall_i(ftdi_stall_w)
);

//-----------------------------------------------------------------
// Wishbone Interface Select
//-----------------------------------------------------------------
wire        mem_stb_w     = ftdi_stb_w & ~ftdi_address_w[31];
wire        mem_cyc_w     = ftdi_cyc_w & ~ftdi_address_w[31];
wire [31:0] mem_data_r;
wire        mem_ack_w;

wire        periph_stb_w  = ftdi_stb_w & ftdi_address_w[31];
wire        periph_cyc_w  = ftdi_cyc_w & ftdi_address_w[31];
wire [31:0] periph_data_r;
wire        periph_ack_w;

reg sel_q;
always @(posedge clk_i or posedge rst_i)
if (rst_i)
    sel_q  <= 1'b0;
else if (ftdi_stb_w)
    sel_q  <= ftdi_address_w[31];

assign ftdi_data_r  = sel_q ? periph_data_r : mem_data_r;
assign ftdi_ack_w   = sel_q ? periph_ack_w  : mem_ack_w;

//-----------------------------------------------------------------
// USB Sniffer
//-----------------------------------------------------------------
// Wishbone (Master - Write Only)
wire [31:0] sniffer_addr_w;
wire [3:0]  sniffer_sel_w;
wire [31:0] sniffer_data_w;
wire        sniffer_cyc_w;
wire        sniffer_we_w;
wire        sniffer_stb_w;
wire        sniffer_stall_w;
wire        sniffer_ack_w;

usb_sniffer
u_sniffer
(
    .clk_i(clk_i),
    .rst_i(rst_i),

    // Peripheral Interface
    .addr_i(ftdi_address_w[7:0]),
    .data_i(ftdi_data_w),
    .data_o(periph_data_r),
    .cyc_i(periph_cyc_w),
    .we_i(ftdi_we_w),
    .stb_i(periph_stb_w),
    .ack_o(periph_ack_w),

    // UTMI Interface
    .utmi_rxvalid_i(utmi_rxvalid),
    .utmi_rxactive_i(utmi_rxactive),
    .utmi_rxerror_i(utmi_rxerror),
    .utmi_data_i(utmi_data_r),
    .utmi_linestate_i(utmi_linestate),

    .utmi_op_mode_o(op_mode_w),
    .utmi_xcvrselect_o(xcvrselect_w),
    .utmi_termselect_o(termselect_w),
    .utmi_dppulldown_o(dppulldown_w),
    .utmi_dmpulldown_o(dmpulldown_w),

    // Wishbone (Slave)
    .mem_addr_o(sniffer_addr_w),
    .mem_sel_o(sniffer_sel_w),
    .mem_data_o(sniffer_data_w),
    .mem_cyc_o(sniffer_cyc_w),
    .mem_stb_o(sniffer_stb_w),
    .mem_we_o(sniffer_we_w),
    .mem_stall_i(sniffer_stall_w),
    .mem_ack_i(sniffer_ack_w)
);

//-----------------------------------------------------------------
// Sample RAM
//-----------------------------------------------------------------
ram_wb
//ram_wb_1k
u_ram
(
    // Port A
    .clock_a(clk_i),
    .enable_a(sniffer_cyc_w & sniffer_stb_w),
    .wren_a(sniffer_we_w),
    .byteena_a(sniffer_sel_w),
    .address_a(sniffer_addr_w[15:2]), // 16k
//    .address_a(sniffer_addr_w[11:2]), // 1k
    .data_a(sniffer_data_w),
    .q_a(),

    // Port B - External Port
    .clock_b(clk_i),
    .enable_b(mem_cyc_w & mem_stb_w),
    .wren_b(ftdi_we_w),
    .byteena_b(ftdi_sel_w),
    .address_b(ftdi_address_w[15:2]), // 16k
//    .address_b(ftdi_address_w[11:2]), // 1k
    .data_b(ftdi_data_w),
    .q_b(mem_data_r)
);

reg acka_q;
reg ackb_q;
always @(posedge clk_i or posedge rst_i)
    if (rst_i)
    begin
        acka_q  <= 1'b0;
        ackb_q  <= 1'b0;
    end else begin
        acka_q  <= sniffer_cyc_w & sniffer_stb_w;
        ackb_q  <= mem_cyc_w & mem_stb_w;
    end
assign sniffer_ack_w  = acka_q;
assign mem_ack_w      = ackb_q;

assign sniffer_stall_w  = 1'b0;
assign ftdi_stall_w     = 1'b0;

//-----------------------------------------------------------------
// LED
//-----------------------------------------------------------------
//assign leds = ftdi_gpio_w;
assign leds = {rst_i, ulpi_dir_i, ulpi_nxt_i, ulpi_stp_o, ulpi_data_i[3:0]};
//assign leds = {rst_i, ulpi_dir_i, ulpi_nxt_i, ulpi_stp_o, ftdi_gpio_w[3:0]};

endmodule
