`timescale 1ns/1ps  


     
module exe_unit_w12_tb;

    logic [3:0] s_a;
    logic [1:0] s_oper;        // sygnaly wewnetrzne modulu testbench
    logic [3:0] s_b;  //
    logic [3:0] s_out;
    logic [3:0] s_synth;
    logic [3:0] s_status;
    logic 	i_clk;
    logic	i_rsn;  //

//  Nazwa modulu  |  Przypisanie   | Nazwa      |  Przypisanie jawne portow
//                |  parametrow    | instancji  |
    exe_unit_w12   #(.M(4), .N(2))   exe_unit_w12_model  (.i_oper(s_oper),.i_argA(s_a), .i_argB(s_b),.o_result(s_out),.o_status(s_status),.i_clk,.i_rsn);   // model oryginalny
    exe_unit_w12_rtl          exe_unit_w12_synth  (.i_oper(s_oper),.i_argA(s_a), .i_argB(s_b),.o_result(s_synth),.i_clk,.i_rsn);    // model po syntezie
                                                                                        //   logicznej
    initial 
        begin // Blok initial
                //-- Makra systemowe
                $dumpfile("exe_unit_w12.vcd");   // signals.vcd - plik gdzie zapisane zostana sygnaly
                                	         //    zarejestrowane w symulacji
                $dumpvars(0,exe_unit_w12_tb);
                i_clk = 0;
                i_rsn = 1;
                s_oper = 2'b00;
                s_a = 4'd2;
                s_b = 4'd3;
                i_clk = 0;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'd4;
                s_b = 4'd5;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'd8;
                s_b = 4'd8;
                #1
                i_clk = 1;
                #1
                s_oper = 2'b01;
                i_clk = 0;
                s_a = 4'd5;
                s_b = 4'd3;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'd5;
                s_b = 4'd5;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'd2;
                s_b = 4'd3;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_oper = 2'b10;
                s_a = 4'b1001;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'b1111;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'b1100;
                #1
                i_clk = 1;
                #1
                s_oper = 4'b11;
                i_clk = 0;
                s_a = 4'b0000;
                s_b = 4'b0010;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'b0010;
                s_b = 4'b0001;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                s_a = 4'b0000;
                s_b = 4'b1101;
                #1
                i_clk = 1;
                #1
                i_clk = 0;
                i_rsn = 0;
                #1
            $finish; // Makro systemowe - zakonczenie symulacji
        
        end   // koniec bloku initial
endmodule

