module melay_11011_non_overlapping(clk, rst, sequence_in, out);
  input clk, rst, sequence_in;
  output reg out;
  
  reg [2:0] current_state, next_state;  
  
  parameter s0 = 3'b000;
  parameter s1 = 3'b001;  
  parameter s2 = 3'b010;
  parameter s3 = 3'b011;
  parameter s4 = 3'b100;
  
  always@(posedge clk, posedge rst)
    begin
      if(rst)
        current_state <= s0;
      else
        current_state <= next_state;
    end
  
  always@(current_state, sequence_in)
    begin
      case(current_state)
        s0: {next_state,out} = sequence_in ? {s1,1'b0} : {s0,1'b0} ;
        s1: {next_state,out} = sequence_in ? {s2,1'b0} : {s0,1'b0} ;
        s2: {next_state,out} = sequence_in ? {s2,1'b0} : {s3,1'b0} ;
        s3: {next_state,out} = sequence_in ? {s4,1'b0} : {s0,1'b0} ;
        s4: {next_state,out} = sequence_in ? {s0,1'b1} : {s0,1'b0} ;
        default: next_state = s0;
      endcase
    end
  
endmodule :melay_11011_non_overlapping
