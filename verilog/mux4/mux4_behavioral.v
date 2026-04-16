// ------------------------------------------------------------
// 4:1 Multiplexer - Behavioral style
// - Uses an always block and case statement.
// - Useful for teaching procedural combinational modeling.
// ------------------------------------------------------------
module mux4_behavioral (
    input  wire d0,
    input  wire d1,
    input  wire d2,
    input  wire d3,
    input  wire [1:0] s,
    output reg  y
);
    always @* begin
        case (s)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            default: y = d3;
        endcase
    end
endmodule
