module greater (i_argA, i_argB, o_result);
    parameter NUM = 4;
    input logic [NUM-1:0]  i_argA;
    input logic [NUM-1:0]  i_argB;
    output logic [NUM-1:0]  o_result;

    always_comb 
    begin
        if (i_argA >= i_argB)
        begin
        	o_result = i_argA;
       	end
        else
        begin
        	o_result = '0;
        end
    end
endmodule
