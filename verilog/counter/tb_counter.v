`timescale 1ns / 1ps

module tb_counter;

    localparam WIDTH = 16;

    reg  [WIDTH-1:0] step;
    reg  [WIDTH-1:0] load_data;
    reg              load;
    reg              clock;
    wire [WIDTH-1:0] count;

    integer init_value;
    integer step_value;
    integer cycles;
    integer i;

    Counter dut (
        .count(count),
        .step(step),
        .load(load),
        .load_data(load_data),
        .clock(clock)
    );

    initial clock = 1'b0;
    always #5 clock = ~clock;

    initial begin
        if ($test$plusargs("trace")) begin
            $dumpfile("counter.vcd");
            $dumpvars(0, tb_counter);
        end
    end

    always @(posedge clock) begin
        #1;     // wait for the register to be updated
        $display("load=%d count=%5d", load, count);
    end

    initial begin
        if (!$value$plusargs("iv=%d", init_value))
            init_value = 0;
        if (!$value$plusargs("step=%d", step_value))
            step_value = 1;
        if (!$value$plusargs("cycles=%d", cycles))
            cycles = 16;

        load_data = init_value[WIDTH-1:0];
        step = step_value[WIDTH-1:0];
        load    = 1'b1;

        // wait for the positive edge for the load  cycle
        @(posedge clock);       

        // wait for 2ns so the old load value can be printed
        # 2; 
        load = 1'b0;

        for (i = 0; i < cycles; i = i + 1) begin
            @(negedge clock);
        end

        $finish(0);
    end

endmodule
