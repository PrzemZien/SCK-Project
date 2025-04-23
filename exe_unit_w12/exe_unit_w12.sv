

module exe_unit_w12(i_oper,i_argA,i_argB,i_rsn,i_clk,o_result,o_status);
    parameter M = 4;
    parameter N = 2;
    input logic [M-1:0] i_argA;
    input logic [M-1:0] i_argB;
    input logic [N-1:0] i_oper;
    input logic i_rsn;
    input logic i_clk;
    
    output logic [M-1:0] o_result;
    logic [M-1:0] s_result;
    logic [M-1:0] s_status;
    output logic [M-1:0] o_status;
    logic [M-1:0] b;
    logic [M-1:0] P;
    integer k;
    integer p;
    always_comb
    begin
    	s_result = '0;
    	s_status = '0;
    	b = '0;
    	P = '0;
    	case (i_oper)
    	4'b00: 
    	begin
        	s_result = i_argA + i_argB;
        end
        4'b01: 
        begin
        	if (i_argA >= i_argB)
        	begin
        		s_result = i_argA;
       		end
        	else
       		begin
        		s_result = 4'b0000;
        	end
        end
        4'b10:
        begin
        	if (i_argA[M-1] == 0 )
        	begin
        		s_result = i_argA;
       		end
        	if (i_argA[M-1] == 1)
        	begin
        		b[M-1] = i_argA[M-1];
        		for (k = 0; k < M -1; k++)
        		b[k] = ~i_argA[k];
        		s_result = b + 1;
        	end
        	if (s_result[3] == 1)
        	begin
        		s_status[2] = 1;
        	end	
        end
        4'b11:
        begin
    		if (i_argB >= 0)
    		begin
    			if (i_argB[3:0] < M )
    			begin
    				s_result= i_argA;
    				s_result[i_argB] = 1;
    				s_status[0] = 0;
    			end
    			else
    			begin
    				s_result = 4'b0000;
    				s_status[0]= 1;
    			end
    		end
    		else
    		begin
    			s_result = 4'b0000;
    			s_status[0]= 1;
    		end
        end
        default:
        	s_result = 4'b0000;
        endcase
        if (s_result == 4'b0000)
        begin
        	s_status[1] = 1;
        end
        else
        begin
        	s_status[1] = 0;
        end
        for (p = 0; p < 4 ; p++)
        	if (s_result[p] == 1)
        	begin
        		P = P + 1;
        	end
        	else
        	begin
        	end
        if (P == 2)
        begin
        	s_status[3] = 1;
        end
        if (P == 4)
        begin
        	s_status[3] = 1;
        end  
    end
    
    always_comb
    begin
    	if (i_rsn == 0)
    	begin
    		o_status = 4'b0000;
    		o_result = 4'b0000;
    	end
    	else
    	begin
    		o_result = s_result;
    		o_status = s_status;
    	end
    end
endmodule

