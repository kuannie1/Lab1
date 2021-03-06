`include "alu.v"

`define ADD  3'd0
`define SUB  3'd1
`define XOR  3'd2
`define SLT  3'd3
`define AND  3'd4
`define NAND 3'd5
`define NOR  3'd6
`define OR   3'd7

module test_timing_ALU ();
  // This runs a single test to see the timing for each operation. The output should be a file called "alu_timing.vcd" which can
  //  be used with GTKWave to see propagation delays.
    reg[2:0] address;
    reg signed [31:0] a,b;
    wire carryout, overflow, zero;
    wire signed [31:0] out;

    ALU alu(out, carryout, zero, overflow, a, b, address);

    initial begin 

    $dumpfile("alu_timing.vcd");
    $dumpvars(0,alu);

    address = `SUB; a = 32'd10; b = 32'd10; #5000
    $display("SUB %d %d ", a, b);
    if ((out !== 32'd0) || (carryout !== 1) || (overflow !== 0)) $display("*** SUB %d %d failed. out: %d carryout: %d overflow: %d", a, b, out, carryout, overflow);

    end
endmodule