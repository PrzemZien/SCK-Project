module dodawanie (i_argA,i_argB,o_result);
    parameter NUM = 4;
    input logic [NUM-1:0] i_argA, i_argB;
    output logic [NUM-1:0] o_result;

    always_comb
    begin
        o_result = i_argA + i_argB;
    end
    
endmodule

