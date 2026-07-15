`timescale 1ns / 1ps

module traffic_controller_tb;

//---------------------------------------
// Inputs
//---------------------------------------

reg clk;
reg reset;

//---------------------------------------
// Outputs
//---------------------------------------

wire [1:0] north;
wire [1:0] east;
wire [1:0] south;
wire [1:0] west;

//---------------------------------------
// Instantiate DUT
//---------------------------------------

traffic_controller uut
(
    .clk(clk),
    .reset(reset),
    .north(north),
    .east(east),
    .south(south),
    .west(west)
);

//---------------------------------------
// Clock Generation
//---------------------------------------

always #5 clk = ~clk;      // 10 ns clock period

//---------------------------------------
// Stimulus
//---------------------------------------

initial
begin

    clk = 0;
    reset = 1;

    // Hold reset for a few clock cycles
    #20;

    reset = 0;

    // Run long enough to see several complete cycles
    #1000;

    $stop;

end

//---------------------------------------
// Monitor
//---------------------------------------

initial
begin

    $monitor("Time=%0t | State Outputs | N=%b E=%b S=%b W=%b",
              $time, north, east, south, west);

end

endmodule
