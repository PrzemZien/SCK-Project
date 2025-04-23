module setbit (i_argA, i_argB, o_result, o_status);
    parameter NUM = 4; 
    input logic [NUM-1:0] i_argA;
    input logic [NUM-1:0] i_argB;
    output logic [NUM-1:0] o_result;
    output logic [NUM-1:0] o_status;

    always_comb 
    begin
    	o_result = '0;
    	o_status = '0;
    	if (i_argB >= 0)
    	begin
    		if (i_argB[3:0] < NUM )
    		begin
    			o_result= i_argA;
    			o_result[i_argB] = 1;
    			o_status = 1'b0;
    		end
    		else
    		begin
    		o_result = 4'b0;
    		o_status = 1'b1;
    		end
    	end
    	else
    	begin
    		o_result = 4'b0;
    		o_status = 1'b1;
    	end
    end
     
endmodule
