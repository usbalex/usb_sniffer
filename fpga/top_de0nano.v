//-----------------------------------------------------------------
// TOP
//-----------------------------------------------------------------
module top_de0nano
(
    // 50MHz clock
    input           clk,

    // LED
    output [7:0]    leds,

    // DIP Switches
    input [3:0]     sw,    

    // USB ULPI Interface
    input           usb_clk60,
    output          usb_ulpi_stp,
    input           usb_ulpi_dir,
    input           usb_ulpi_nxt,
    inout [7:0]     usb_ulpi_data
);

//-----------------------------------------------------------------
// Clocking
//-----------------------------------------------------------------
wire USB_CLK60G;

clkgen_pll
u_pll
(
	.inclk0(usb_clk60),
	.c0(USB_CLK60G),
	.locked()
);

//-----------------------------------------------------------------
// Reset
//-----------------------------------------------------------------
reg reset       = 1'b1;
reg rst_next    = 1'b1;

always @(posedge USB_CLK60G) 
if (rst_next == 1'b0)
    reset       <= 1'b0;
else 
    rst_next    <= 1'b0;

//-----------------------------------------------------------------
// IO Primitives
//-----------------------------------------------------------------
wire [7:0] ulpi_out_w;
wire [7:0] ulpi_in_w;
wire       ulpi_stp_w;

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
        .oe(usb_ulpi_dir),
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

//-----------------------------------------------------------------
// Core
//-----------------------------------------------------------------
top_core
u_core
(
    // ULPI PHY clock (60MHz)
    .clk_i(USB_CLK60G),
    .rst_i(reset),

    // ULPI Interface
    .ulpi_data_i(ulpi_in_w),
    .ulpi_data_o(ulpi_out_w),
    .ulpi_dir_i(usb_ulpi_dir),
    .ulpi_nxt_i(usb_ulpi_nxt),
    .ulpi_stp_o(ulpi_stp_w),

    // MISC
    .leds(leds)
);

endmodule
