`timescale 1ns/1ps  


     
module greater_tb;

    logic [3:0] s_a;          // sygnaly wewnetrzne modulu testbench
    logic [3:0] s_b;  //
    logic [3:0] s_out;
    logic [3:0] s_synth;  //

//  Nazwa modulu  |  Przypisanie   | Nazwa      |  Przypisanie jawne portow
//                |  parametrow    | instancji  |
    greater   #(.NUM(4)) gre_model  (.i_argA(s_a), .i_argB(s_b),.o_result(s_out));   // model oryginalny
    greater_rtl          gre_synth  (.i_argA(s_a), .i_argB(s_b), .o_result(s_synth));    // model po syntezie
                                                                                        //   logicznej
    initial 
        begin // Blok initial
                //-- Makra systemowe
                $dumpfile("greater.vcd");   // signals.vcd - plik gdzie zapisane zostana sygnaly
                                            //    zarejestrowane w symulacji
                $dumpvars(0,greater_tb); 
                s_a = 4'd6;
                s_b= 4'd2;
                #20
                s_a = 4'd3;
                s_b =  4'd2;
                #20
                s_a = 4'd1;
                s_b = 4'd1;
                #20
                s_a = 4'd1;
                s_b = 4'd6;
                #20
                s_a = 4'd2;
                s_b = 4'd7;
                    

            $finish; // Makro systemowe - zakonczenie symulacji
        
        end   // koniec bloku initial
endmodule
