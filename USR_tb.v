module tb_paraunivshiftreg;

parameter N = 4;

logic clk, reset,l_ser_in, r_ser_in;
logic [N-1:0] para_in;
logic [1:0] sel;
logic [N-1:0] out;

paraunivshiftreg #(N) dut (
    .reset(reset),.l_ser_in(l_ser_in),
    .r_ser_in(r_ser_in),.clk(clk),
    .para_in(para_in),.sel(sel),
    .out(out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    l_ser_in = 0;
    r_ser_in = 0;
    para_in = 0;
    sel = 2'b00;

    // reset
    #10 reset = 0;

    // load parallely
    para_in = 4'b1010;
    sel = 2'b11;
    #10;

    // nothing(hold)
    sel = 2'b00;
    #10;

    // Shift Right 4 times
    sel = 2'b01;
    l_ser_in = 1;
    repeat(4) #10;

    // Shift Left thrice
    sel = 2'b10;
    r_ser_in = 0;
    repeat(3) #10;

    // Change inputs while shifting
    l_ser_in = 0;
    
    r_ser_in = 1;
    #20;

end


initial begin
    $dumpfile("USRdump.vcd");
    $dumpvars(0, tb_paraunivshiftreg);
    $display("Starting simulation...");
    #500;  
    $display("Simulation finished");
    $finish;
end

endmodule