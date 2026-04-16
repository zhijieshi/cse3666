`timescale 1ns/1ps

// ------------------------------------------------------------
// Testbench for 4:1 MUX teaching examples
// - Instantiates dataflow, behavioral, and structural DUTs.
// - Sweeps all combinations of s[1:0] and d3..d0 (64 cases).
// - Compares each DUT output to the same expected value.
// ------------------------------------------------------------

module tb_mux4;
    reg d0;
    reg d1;
    reg d2;
    reg d3;
    reg [1:0] s;

    wire y_dataflow;
    wire y_behavioral;
    wire y_structural;

    reg expected;
    integer i;

    mux4_dataflow dut_dataflow (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .s(s),
        .y(y_dataflow)
    );

    mux4_behavioral dut_behavioral (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .s(s),
        .y(y_behavioral)
    );

    mux4_structural dut_structural (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .s(s),
        .y(y_structural)
    );

    initial begin
        $display("s  d3 d2 d1 d0 | expd data beha stru");

        for (i = 0; i < 64; i = i + 1) begin
            {s, d3, d2, d1, d0} = i[5:0];
            #1;

            case (s)
                2'b00: expected = d0;
                2'b01: expected = d1;
                2'b10: expected = d2;
                default: expected = d3;
            endcase

            $display("%b %b  %b  %b  %b  |  %b    %b    %b    %b",
                     s, d3, d2, d1, d0,
                     expected, y_dataflow, y_behavioral, y_structural);

            if ((y_dataflow !== expected) ||
                (y_behavioral !== expected) ||
                (y_structural !== expected)) begin
                $display("MISMATCH: s=%b d3d2d1d0=%b%b%b%b exp=%b data=%b beh=%b str=%b",
                         s, d3, d2, d1, d0,
                         expected, y_dataflow, y_behavioral, y_structural);
                $finish(1);
            end
        end

        $display("PASS: all 64 combinations matched.");
        $finish(0);
    end
endmodule
