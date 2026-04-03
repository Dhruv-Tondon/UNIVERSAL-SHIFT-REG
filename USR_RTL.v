module paraunivshiftreg #(parameter N=4) (
    input reset,l_ser_in,r_ser_in,clk,
    input [N-1:0]para_in,
    input [1:0] sel,
    output reg [N-1:0] out
);

always_ff @(posedge clk ,posedge reset)begin
if(reset)
out<=0;
else begin
case(sel)
2'b00:out<=out;
2'b01:out<={l_ser_in,out[N-1:1]};
2'b10:out<={out[N-2:0],r_ser_in};
2'b11:out<=para_in;
default:out<=out;
endcase

end
end
endmodule

