// ------------------------------------------------------------
// 4:1 Multiplexer - Structural style
// Built from three 2:1 mux instances:
//   Stage 1: choose within each pair (d0,d1) and (d2,d3) using s[0]
//   Stage 2: choose between stage-1 outputs using s[1]
// ------------------------------------------------------------
module mux4_structural (
    input  wire d0,
    input  wire d1,
    input  wire d2,
    input  wire d3,
    input  wire [1:0] s,
    output wire y
);
    wire y_low;
    wire y_high;

    // u0 maps ports as:
    //   a<-d0, b<-d1, s<-s[0], y->y_low
    // So y_low is the selected value from the lower pair.
    mux2_1 u0 (
        .a(d0),
        .b(d1),
        .s(s[0]),
        .y(y_low)
    );

    // u1 maps ports as:
    //   a<-d2, b<-d3, s<-s[0], y->y_high
    // So y_high is the selected value from the upper pair.
    mux2_1 u1 (
        .a(d2),
        .b(d3),
        .s(s[0]),
        .y(y_high)
    );

    // u2 maps ports as:
    //   a<-y_low, b<-y_high, s<-s[1], y->final output y
    // This final select picks between the two stage-1 results.
    mux2_1 u2 (
        .a(y_low),
        .b(y_high),
        .s(s[1]),
        .y(y)
    );
endmodule
