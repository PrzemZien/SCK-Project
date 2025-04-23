module change (i_argA,o_result);
    parameter NUM = 4;
    input logic signed [NUM-1:0]  i_argA;
    output logic signed [NUM-1:0]  o_result;
    logic [NUM-1:0] b;
    integer k;

    always_comb 
    begin
        if (i_argA[NUM-1] == 0 )
        begin
        	o_result = i_argA;
       	end
        else
        begin
        	if (i_argA[NUM-1] == 1)
        	begin
        		b[NUM-1] = i_argA[NUM-1];
        		for (k = 0; k < NUM -1; k++)
        		b[k] = ~i_argA[k];
        	end
        	o_result = b + 1;
        end
    end
endmodule
