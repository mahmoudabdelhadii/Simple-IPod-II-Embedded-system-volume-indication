module addressfsm_tb;
    
    
    reg clock, 
	 reset, 
	 fetchaddressenable,
	direction;

	wire[22:0] address_out;
	wire addressready;



    addressfsm DUT (.clock(clock), 
	                .reset(reset), 
	                .fetchaddressenable(fetchaddressenable),
	                .direction(direction), 
                    .address_out(address_out),
	                .addressready(addressready));

                    always begin
                        #10 clock =~clock; 
                end
                 
                initial begin 
                clock = 1'b0;
                reset = 1'b0;
                fetchaddressenable =1'b0;
                direction =1'b0;
                #100
                reset = 1'b1;
                direction =1'b1;
                #100
                reset =1'b0;
                #100
                #15
                fetchaddressenable =1'b1;
                #15
                fetchaddressenable= 1'b0;
#150
                fetchaddressenable =1'b1;
                #15
                fetchaddressenable= 1'b0;
#150
                fetchaddressenable =1'b1;
                #15
                fetchaddressenable= 1'b0;
#150
                fetchaddressenable =1'b1;
                #15
                fetchaddressenable= 1'b0;
                end
endmodule
                

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
module flashfsm_tb;
    

reg CLK50MHZ;
reg CLK22KHZ;
reg CLK;
reg flash_mem_readdatavalid;
reg flash_mem_waitrequest; 
reg [31:0]flash_mem_readdata;

reg reset; 
reg pause; 
reg direction; 

wire flash_mem_read; //set to 1 when you want to read
wire [3:0] flash_mem_byteenable; //During reads, byteenables indicate which bytes the master is reading. Slaves that simply return readdata with no side effects are free to ignore byteenables
wire [15:0] data_out;  //data at specific address
wire [22:0] flash_mem_address; //address we want to read

flashfsm DUT2(.CLK50MHZ(CLK50MHZ), 
		.CLK22KHZ(CLK), 
	
	.flash_mem_readdatavalid(flash_mem_readdatavalid), //
	.flash_mem_waitrequest(flash_mem_waitrequest), 
	.flash_mem_readdata(flash_mem_readdata), 
	
	.reset(reset), 
	.pause(pause), 
	.direction(direction), 
	
	.flash_mem_read(flash_mem_read), //set to 1 when you want to read
	.flash_mem_byteenable(flash_mem_byteenable), //During reads, byteenables indicate which bytes the master is reading. Slaves that simply return readdata with no side effects are free to ignore byteenables
	.data_out(data_out),  //data at specific address
	.flash_mem_address(flash_mem_address)
    ); 

    edge_detect_gate U1 (.clk50(CLK50MHZ),
			.reset(1'b0),
                        .clk22(CLK22KHZ),
                        .syncclk22(CLK));


    always begin 
        #1 CLK50MHZ = ~CLK50MHZ;
    end
    always begin
        #100 CLK22KHZ = ~CLK22KHZ;
    end 
    initial begin
        reset = 1'b0;
        pause = 1'b0;
        direction =1'b1;
        CLK50MHZ = 1'b0;
        CLK22KHZ = 1'b0;
	flash_mem_readdatavalid= 1'b1;
	CLK=1'b0;
        flash_mem_readdata = 32'h0;
        flash_mem_waitrequest=1'b0;
        #200  
        flash_mem_waitrequest = 1'b0;
        #280
        flash_mem_readdatavalid= 1'b1;
        #500
        flash_mem_readdata = 32'h7F7F;
        #500
        flash_mem_waitrequest= 1'b0;
        pause = 1'b1;
        #200
        pause =1'b0;
        direction = 1'b1;
        #200
        direction = 1'b0;
        flash_mem_readdatavalid= 1'b1;
        flash_mem_waitrequest =1'b1;
        #300
	flash_mem_waitrequest =1'b0;
        end

endmodule
