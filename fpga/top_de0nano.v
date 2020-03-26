//-----------------------------------------------------------------
// TOP
//-----------------------------------------------------------------
module top_de0nano
(
    // 50MHz clock
//    input           clk,

    // LED
    output [7:0]    leds,

    // DIP Switches
//    input [3:0]     sw,

    // USB ULPI Interface
//    inout           usb_clk60,
    input           usb_clk60,
//    input           usb_rst,
    output          usb_rst,
    output          usb_ulpi_stp,
    input           usb_ulpi_dir,
    input           usb_ulpi_nxt,
    inout [7:0]     usb_ulpi_data
);

//-----------------------------------------------------------------
// Clocking
//-----------------------------------------------------------------
wire USB_CLK60G;

//clkgen_pll
//u_pll
//(
//	.inclk0(usb_clk60),
//	.c0(USB_CLK60G),
//	.locked()
//);
//    IOBUF 
//    CLKBUF_inst
//    (
//        .oe(1'b0),
//        .datain(1'b0),
//        .dataout(USB_CLK60G),
//        .dataio(usb_clk60)
//    );
assign USB_CLK60G = usb_clk60;

//wire la_clk /* synthesis keep */;
//
//la_pll
//la_pll_inst
//(
//	.inclk0(clk),
//	.c0(la_clk)
//);
//
//assign leds[7] = la_clk;

//-----------------------------------------------------------------
// Reset
//-----------------------------------------------------------------
reg [7:0] reset_q = 8'b11111111;
wire reset;

always @(posedge USB_CLK60G) 
begin
    reset_q <= {1'b0, reset_q[7:1]};
end

assign reset = reset_q[0];

//reg reset       = 1'b1;
//reg rst_next    = 1'b1;
//always @(posedge USB_CLK60G) 
//if (rst_next == 1'b0)
//    reset       <= 1'b0;
//else 
//    rst_next    <= 1'b0;

//IOBUF 
//RSTBUF_inst
//(
//    .oe(1'b1),
//    .datain(rst_next),
//    .dataout(),
//    .dataio(usb_rst)
//);
//-----------------------------------------------------------------
// IO Primitives
//-----------------------------------------------------------------
wire [7:0] ulpi_out_w;
wire [7:0] ulpi_in_w;
wire       ulpi_stp_w;

wire       ulpi_oe_w;
assign ulpi_oe_w = ~usb_ulpi_dir;


genvar i;
generate  
for (i=0; i < 8; i=i+1)  
begin: gen_buf
    IOBUF 
//    #(
//        .DRIVE(12),
//        .IOSTANDARD("DEFAULT"),
//        .SLEW("FAST")
//    )
    IOBUF_inst
    (
        .oe(ulpi_oe_w),
        .datain(ulpi_out_w[i]),
        .dataout(ulpi_in_w[i]),
        .dataio(usb_ulpi_data[i])
    );
end  
endgenerate  

OBUF 
//#(
//    .DRIVE(12),
//    .IOSTANDARD("DEFAULT"),
//    .SLEW("FAST")
//)
OBUF_stp
(
    .datain(ulpi_stp_w),
    .dataout(usb_ulpi_stp)
);
OBUF 
OBUF_rst
(
    .datain(reset),
    .dataout(usb_rst)
);

//-----------------------------------------------------------------
// Core
//-----------------------------------------------------------------
top_core
u_core
(
    // ULPI PHY clock (60MHz)
    .clk_i(USB_CLK60G),
    //.clk_i(clk),
    .rst_i(reset),

    // ULPI Interface
    .ulpi_data_i(ulpi_in_w),
    .ulpi_data_o(ulpi_out_w),
    .ulpi_dir_i(usb_ulpi_dir),
    .ulpi_nxt_i(usb_ulpi_nxt),
    .ulpi_stp_o(ulpi_stp_w),

    // MISC
    .leds(leds)
//    .leds(leds[6:0])
);

endmodule
