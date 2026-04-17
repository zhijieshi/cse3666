`timescale 1ns / 1ps

// no reset signal. Use load to load the initial value
module Counter (
    output reg  [15:0] count,
    input  wire [15:0] step,
    input  wire        load,
    input  wire [15:0] load_data,
    input  wire        clock
);

    wire [15:0] adder_out;
    wire [15:0] next_count;

    // assume adder takes 2ns 
    assign #3 adder_out = count + step;

    // use mux to select the next state
    // assume the delay on mux is 1ns
    assign #1 next_count = load ? load_data : adder_out;

    // delay of the register is 0.5ns
    always @(posedge clock) begin
        count <= #0.5 next_count;
    end

endmodule
