
module flashfsm (input logic CLK50MHZ, 
		input logic CLK22KHZ, 
	
	input logic flash_mem_readdatavalid, //
	input logic flash_mem_waitrequest, 
	input logic [31:0]flash_mem_readdata, 
	
	input logic reset, 
	input logic pause, 
	input logic direction, 
	
	output logic flash_mem_read, //set to 1 when you want to read
	output logic [3:0] flash_mem_byteenable, //During reads, byteenables indicate which bytes the master is reading. Slaves that simply return readdata with no side effects are free to ignore byteenables
	output logic [15:0] data_out,  //data at specific address
	output logic [22:0] flash_mem_address); //address we want to read
	logic fetchaddressenable;
	logic addressready;
	addressfsm U6 (.clock(CLK50MHZ),
					.reset(reset),
					.fetchaddressenable(fetchaddressenable),
					.direction(direction),
					.address_out(flash_mem_address),
					.addressready(addressready)
				);

parameter wait1 = 10'b00_0000_0000;
parameter determine_address = 10'b00_0000_0001;
parameter wait_request = 10'b01_0000_0000;
parameter address_fetched = 10'b10_0000_0000;
parameter read_state = 10'b00_1011_1110;
parameter outputLSB = 10'b11_1000_0000;
//parameter wait2 = 11'b100_0000_0000;
parameter outputMSB =10'b00_1100_0000;
//parameter wait3 = 11'b101_0100_0000;

logic [9:0] state;


				always_ff @ (posedge CLK50MHZ or posedge reset) begin
					if (reset) state <= wait1;
					else begin
						case (state)
							wait1: if (pause) state <= wait1;					
									else state <= determine_address;		
							determine_address: if (flash_mem_waitrequest) state <= wait_request;
													else if (addressready)
														state <= address_fetched;
							wait_request: if (~flash_mem_waitrequest & addressready)
												state <= address_fetched;
										else state <= wait_request;
							address_fetched: state <= read_state;
							
							read_state: if (flash_mem_readdatavalid)
											state <= outputLSB;
											else state <= read_state;
										
							outputLSB: if(CLK22KHZ) state <= outputMSB;
										else state <= outputLSB;
							outputMSB: if (CLK22KHZ)state <= wait1;   //counter 1 in state 
										else state <= outputMSB;
							
							default: state <= wait1;
						endcase
					end
				end


							

	logic [31:0] splitdata;
	logic dataenable, counter;
	always_ff @(posedge dataenable)
	splitdata <= flash_mem_readdata;

			
	//always_ff @(posedge outputflag) begin
		//case(direction)
			//1'b1: if (counter) data_out <= splitdata[31:16];
			//else data_out <= splitdata[15:0];
			//1'b0: if (counter) data_out <= splitdata[15:0];
			//else data_out <= splitdata[31:16];
			//default: data_out<= 32'b0;
			//endcase
			//end
	
	always_comb begin
			flash_mem_byteenable <= state[5:2];
			flash_mem_read <= state[1];
			fetchaddressenable <= state[0];
			dataenable <= state[7];
			counter <= state[6];
	end
	
logic [15:0] MSBdata,LSBdata;	
assign MSBdata = splitdata[31:16];
assign LSBdata = splitdata[15:0];
assign data_out = (direction)? ((counter)? MSBdata: LSBdata) : ((counter)? LSBdata:MSBdata);
	

	


endmodule

	  module addressfsm (input logic clock, 
						input logic reset, 
						input logic fetchaddressenable,
						input logic direction, 

						output logic[22:0] address_out, 
						output logic addressready
						);
						
						logic [1:0] state=2'b0;
						logic [22:0] nextaddress = 23'h0;
						logic send, next;

						parameter MAXADDRESS = 23'h7FFFF;
						parameter STARTADDRESS = 23'h0;

						parameter idle = 2'b00;
						parameter send_address = 2'b01;
						parameter next1 = 2'b10;
						parameter ready = 2'b11;
						
						
					
						always_ff @(posedge clock, posedge reset) begin
							if(reset)
								state = idle;                        
							else
								case (state)                         
									idle: begin
											send <=1'b0; 
											next <=1'b0; 
											addressready <=1'b0; 
											if (fetchaddressenable)
											state <= send_address;   
												else
											state <= idle;
									end
								send_address :begin state <= next1;       
													send <=1'b1;
								end
								next1: begin state <= ready;               
											send <= 1'b0;
											next <= 1'b1;
								end
								ready:begin state <= idle;  
											addressready<= 1'b1;
											next <=1'b0;              
								end
							endcase                                  
						end                                          


						always_ff @(posedge send)
						address_out <= nextaddress;
				
					
					always_ff @(posedge next, posedge reset) begin
					  if (reset)
							nextaddress <= STARTADDRESS;
				
							else if (direction)                        
							begin
								 if (address_out == MAXADDRESS)
									 nextaddress <= STARTADDRESS;   
				
								 else
									  nextaddress <= nextaddress + 23'h1;  
							end
							
							else if (!direction) begin                  
								 if (address_out == STARTADDRESS)
												 nextaddress <= MAXADDRESS;
								 else
												 nextaddress <= nextaddress - 23'h1;
							end
					  end                                            


	  endmodule 