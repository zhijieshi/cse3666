// ------------------------------------------------------------
// 4:1 Multiplexer - Dataflow style
// - Uses one Boolean expression with bitwise operators.
// - Useful for teaching truth-table-to-equation translation.
// ------------------------------------------------------------
module mux4_dataflow (
    input  wire d0,
    input  wire d1,
    input  wire d2,
    input  wire d3,
    input  wire [1:0] s,
    output wire y
);
    assign y = (~s[1] & ~s[0] & d0) |
               (~s[1] &  s[0] & d1) |
               ( s[1] & ~s[0] & d2) |
               ( s[1] &  s[0] & d3);
endmodule
