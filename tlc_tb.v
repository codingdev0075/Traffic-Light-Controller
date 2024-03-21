module trafic_light_controller_tb;

    reg clk, rst;
    wire [2:0] light_M1;
    wire [2:0] light_S;
    wire [2:0] light_MT;
    wire [2:0] light_M2;

    traffic_light_controller uut(
        .clk(clk),
        .rst(rst),
        .light_M1(light_M1),
        .light_S(light_S),
        .light_MT(light_MT),
        .light_M2(light_M2)
    );

    initial 
    begin
        // Initialize clock
        clk = 1'b0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units

        // Initialize reset
        rst = 1'b0; // Start with a defined value (0)
        #10 rst = 1'b1; // Assert reset after 10 time units
        #20 rst = 1'b0; // Release reset after 20 time units
        #30; // Keep reset stable for additional 30 time units

        // Simulate for 1000 time units
        #1000 $finish; // End simulation after 1000 time units
    end

    // Dump signals for waveform viewing
    initial begin
        $dumpfile("traffic_light_controller_tb.vcd");
        $dumpvars(0, traffic_light_controller_tb);
        // Ensure numerical representation of signals
        $display("Starting simulation...");
        $monitor("Time: %t, clk: %b, rst: %b, light_M1: %b, light_S: %b, light_MT: %b, light_M2: %b", $time, clk, rst, light_M1, light_S, light_MT, light_M2);
    end

endmodule
