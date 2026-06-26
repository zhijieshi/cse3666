// ------------------------------------------------------------
// 4:1 Multiplexer - Dataflow style
// ------------------------------------------------------------
module mux4_dataflow (
    input  wire d0,
    input  wire d1,
    input  wire d2,
    input  wire d3,
    input  wire [1:0] s,
    output wire y
);
    wire e0, e1, e2, e3;
    assign e0 = ~s[1] & ~s[0];
    assign e1 = ~s[1] &  s[0];
    assign e2 =  s[1] & ~s[0];
    assign e3 =  s[1] &  s[0];

    assign y = (e0 & d0) | (e1 & d1) | (e2 & d2) | (e3 & d3);

    /* or, we can write a long expression
    assign y = (~s[1] & ~s[0] & d0) |
               (~s[1] &  s[0] & d1) |
               ( s[1] & ~s[0] & d2) |
               ( s[1] &  s[0] & d3);
    */
endmodule
