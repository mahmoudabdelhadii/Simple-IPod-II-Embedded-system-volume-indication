module led_fsm ( input logic clock_1Hz,output logic [7:0] LEDR);
    reg [3:0] ledstate;
    reg [3:0] nextstate;
    
    
    reg[3:0] led1 =4'b0000;
    reg [3:0] led2 =4'b0001;
    reg [3:0] led3 =4'b0010;
    reg[3:0] led4 =4'b0011;
    reg [3:0] led5 =4'b0100;
    reg [3:0] led6 =4'b0101;
    reg [3:0] led7 =4'b0110;
    reg [3:0] led8 =4'b0111;
    //parameter [3:0] led9 4'b1000
    
    always_ff@(posedge clock_1Hz)    //LED lights   [9:0]      LEDR 
    begin
    ledstate <= nextstate;
    end
    
    always_comb //combinational
    begin
      LEDR[7:0] = 8'b0;
    case (ledstate)
        led1: begin
          nextstate = led2;
          LEDR[0] = 1'b1;
          LEDR[7] =1'b0;
        LEDR[1] =1'b0;	
        end
        led2: begin
          nextstate = led3;
          LEDR[1] = 1'b1;
          LEDR[0] =1'b0;
        end
        led3: begin 
        nextstate = led4;
        LEDR[2] = 1'b1;
        LEDR[1] =1'b0;
        end
        led4: begin
        nextstate = led5;
        LEDR[3] = 1'b1;
        LEDR[2] =1'b0;
        end
        led5: begin
        nextstate = led6;
        LEDR[4] = 1'b1;
        LEDR[3] =1'b0;
        end
    
        led6: 
         begin
        nextstate = led7;
        LEDR[5] = 1'b1;
        LEDR[4] =1'b0;
        end
        led7: begin
        nextstate = led8;
        LEDR[6] = 1'b1;
        LEDR[5] =1'b0;
        end
        led8: begin
        nextstate = 4'b1000;
        LEDR[7] = 1'b1;
        LEDR[6] =1'b0;
        end
        4'b1000: begin
          nextstate = 4'b1001;
          LEDR[6] = 1'b1;
          LEDR[7]=1'b0;
    end
        4'b1001: begin 
        nextstate = 4'b1010;
        LEDR[5] = 1'b1;
          LEDR[6]=1'b0;
    end
        4'b1010: begin 
        nextstate = 4'b1011;
        LEDR[4] = 1'b1;
          LEDR[5]=1'b0;
    end
        4'b1011: begin 
        nextstate = 4'b1100;
        LEDR[3] = 1'b1;
          LEDR[4]=1'b0;
    end
        4'b1100: begin
        nextstate = 4'b1101;
        LEDR[2] = 1'b1;
          LEDR[3]=1'b0;
    end
        4'b1101:begin
     nextstate = led1;
        LEDR[1] = 1'b1;
          LEDR[2]=1'b0;
    end
        4'b1110: nextstate = led1;
        4'b1111: nextstate = led1;
          default: nextstate = led1;
    endcase
    end
    
    endmodule