`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2026 03:28:51 PM
// Design Name: 
// Module Name: blinky
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module blinky(
    input logic clk,
    input logic btn0,
    output logic [3:0] led
    );
    
        logic [24:0] tick_cnt;
    logic        tick;

    // Divider: tick is high for one cycle every 25,000,000 clocks
    assign tick = (tick_cnt == 25'd24_999_999);

    always_ff @(posedge clk) begin
        if (btn0 || tick) tick_cnt <= '0;
        else              tick_cnt <= tick_cnt + 1;
    end

    // 4-bit counter that only advances on tick
    always_ff @(posedge clk) begin
        if (btn0)      led <= '0;
        else if (tick) led <= led + 1;
    end

endmodule