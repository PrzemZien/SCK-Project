`timescale 1ns/1ps  


     
module setbit_tb;

    logic [3:0] s_a; 
    logic [3:0] s_b;         // sygnaly wewnetrzne modulu testbench
    logic [3:0] s_out;
    logic [3:0] s_synth; 
    logic [3:0] s_status;

//  Nazwa modulu  |  Przypisanie   | Nazwa      |  Przypisanie jawne portow
//                |  parametrow    | instancji  |
    setbit   		sb_model  (.i_argA(s_a),.i_argB(s_b),.o_result(s_out), .o_status(s_status));   // model oryginalny
    setbit_rtl          sb_synth  (.i_argA(s_a),.i_argB(s_b),.o_result(s_synth));    // model po syntezie
                                                                                        //   logicznej
    initial 
        begin // Blok initial
                //-- Makra systemowe
                $dumpfile("setbit.vcd");   // signals.vcd - plik gdzie zapisane zostana sygnaly
                                            //    zarejestrowane w symulacji
                $dumpvars(0,setbit_tb); 
                s_a = 4'b0000;
                s_b = 4'b0010;
                #10
                s_a = 4'b0010;
                s_b = 4'b0001;
                #10
                s_a = 4'b0000;
                s_b = 4'b1101;
                #10
  

                    

            $finish; // Makro systemowe - zakonczenie symulacji
        
        end   // koniec bloku initial
endmodule

