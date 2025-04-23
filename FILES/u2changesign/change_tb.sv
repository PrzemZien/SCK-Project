`timescale 1ns/1ps  


     
module change_tb;

    logic [3:0] s_a;          // sygnaly wewnetrzne modulu testbench
    logic [3:0] s_out;
    logic [3:0] s_synth;  //

//  Nazwa modulu  |  Przypisanie   | Nazwa      |  Przypisanie jawne portow
//                |  parametrow    | instancji  |
    change   #(.NUM(4)) ch_model  (.i_argA(s_a),.o_result(s_out));   // model oryginalny
    change_rtl          ch_synth  (.i_argA(s_a),.o_result(s_synth));    // model po syntezie
                                                                                        //   logicznej
    initial 
        begin // Blok initial
                //-- Makra systemowe
                $dumpfile("change.vcd");   // signals.vcd - plik gdzie zapisane zostana sygnaly
                                            //    zarejestrowane w symulacji
                $dumpvars(0,change_tb); 
                s_a= '1;
                #5
                s_a = 4'b1111;
                #5
                s_a = 4'b1101;
                #5
                s_a = 4'b0010;
                #5

                    

            $finish; // Makro systemowe - zakonczenie symulacji
        
        end   // koniec bloku initial
endmodule

