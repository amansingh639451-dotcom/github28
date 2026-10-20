`timescale 1ns / 1ps
module tb_repellant_generator;
    reg clk;
    reg rst_n;
    reg btn_onoff;
    reg btn_mode;
    reg btn_inc;
    reg btn_dec;
    wire signal_out;
    repellant_generator #(
        .ONOFF_DELAY_CYCLES(32'd10000)
    )
    uut (
        .clk        (clk),
        .rst_n      (rst_n),
        .btn_onoff  (btn_onoff),
        .btn_mode   (btn_mode),
        .btn_inc    (btn_inc),
        .btn_dec    (btn_dec),
        .signal_out (signal_out)
    );
    always #4 clk = ~clk;
    task press_onoff;
    begin
        btn_onoff = 1'b0;
        #25_000_000;
        btn_onoff = 1'b1;
        #25_000_000;
    end
    endtask
    task press_mode;
    begin
        btn_mode = 1'b0;
        #25_000_000;
        btn_mode = 1'b1;
        #25_000_000;
    end
    endtask
    task press_inc;
    begin
        btn_inc = 1'b0;
        #25_000_000;
        btn_inc = 1'b1;
        #25_000_000;
    end
    endtask
    task press_dec;
    begin
        btn_dec = 1'b0;
        #25_000_000;
        btn_dec = 1'b1;
        #25_000_000;
    end
    endtask
    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        btn_onoff = 1'b1;
        btn_mode  = 1'b1;
        btn_inc   = 1'b1;
        btn_dec   = 1'b1;
        #100;
        rst_n = 1'b1;
        #1_000;
        press_onoff;
        #100_000;
        press_mode;
        #50_000_000;
        press_inc;
        #20_000_000;
        press_inc;
        #20_000_000;
        press_inc;
        #20_000_000;
        press_dec;
        #20_000_000;
        press_mode;
        #20_000_000;
        press_inc;
        #10_000_000;
        press_dec;
        #10_000_000;
        press_mode;
        #10_000_000;
        press_inc;
        #5_000_000;
        press_dec;
        #5_000_000;
        press_mode;
        press_mode;
        #30_000_000;
        press_onoff;
        #100_000;
        $display("==============================================");
        $display("      4-BUTTON DDS TEST COMPLETED");
        $display("==============================================");
        $finish;
    end
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_repellant_generator);
    end
endmodule