module edge_detect_gate
(
input wire clk50, reset,
input wire clk22,
output wire syncclk22
);
// s i g n a l d e c l a r a t i o n
reg delay_reg;

always @(posedge clk50, posedge reset)
    if(reset)
    delay_reg <=1'b0;
    else 
    delay_reg <= clk22;

    assign syncclk22 = ~delay_reg & clk22;

endmodule


module edge_detect_gate_tb;

    reg clk50;
    reg clk22;
    wire syncclk22;

    edge_detect_gate dut2 (
        .clk50(clk50),
        .clk22(clk22),
        .syncclk22(syncclk22)
    );
        
    always begin
        #1 clk50 = ~clk50;
    end
    always begin
        #500 clk22 = ~clk22;
    end
    initial begin
        clk50 = 1'b0;
        clk22 = 1'b0;
    end

endmodule

module asyncsig (
    input logic clk,
    input logic async_sig,
    output logic out_sync_sig
);

wire in1,in2,in3;

flopr FDC_1 (
.clk(clk),
.reset(1'b0),
.d(out_sync_sig),
.q(in1)
);
flopr FDCu1 (
.clk(async_sig),
.reset(in1),
.d(1'b1),
.q(in2)
);
flopr FDCu2 (
.clk(clk),
.reset(1'b0),
.d(in2),
.q(in3)
);
flopr FDCu3 (
.clk(clk),
.reset(1'b0),
.d(in3),
.q(out_sync_sig)
);

endmodule 


module flopr(
        input logic clk,
        input logic reset,
        input logic  d,
        output logic q
        );

always_ff@(posedge clk, posedge reset)
if (reset) q<=1'b0;
else  q<= d;
endmodule

