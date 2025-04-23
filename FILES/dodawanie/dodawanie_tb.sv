`timescale 1ns/1ps  


     
module dodawanie_tb;

    logic [3:0] s_a;          // sygnaly wewnetrzne modulu testbench
    logic [3:0] s_b;  //
    logic [3:0] s_out;
    logic [3:0] s_synth;  //

//  Nazwa modulu  |  Przypisanie   | Nazwa      |  Przypisanie jawne portow
//                |  parametrow    | instancji  |
    dodawanie   #(.NUM(4)) dod_model  (.i_argA(s_a), .i_argB(s_b),.o_result(s_out));   // model oryginalny
    dodawanie_rtl          dod_synth  (.i_argA(s_a), .i_argB(s_b), .o_result(s_synth));    // model po syntezie
                                                                                        //   logicznej
    initial 
        begin // Blok initial
                //-- Makra systemowe
                $dumpfile("dodawanie.vcd");   // signals.vcd - plik gdzie zapisane zostana sygnaly
                                            //    zarejestrowane w symulacji
                $dumpvars(0,dodawanie_tb); 
                s_a = 4'd6;
                s_b= 4'd2;
                #20
                s_a = 4'd3;
                s_b =  4'd2;
                #20
                s_a = 4'd1;
                s_b = 4'd1;
                    

            $finish; // Makro systemowe - zakonczenie symulacji
        
        end   // koniec bloku initial
endmodule

