// ------------------------------------------------------------
// 2:1 Multiplexer (building block for structural 4:1 MUX)
// - s=0 -> y=a
// - s=1 -> y=b
// ------------------------------------------------------------
module mux2_1 (
    input  wire a,
    input  wire b,
    input  wire s,
    output wire y
);
    assign y = (~s & a) | (s & b);
endmodule
