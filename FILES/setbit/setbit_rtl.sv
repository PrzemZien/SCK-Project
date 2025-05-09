/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module setbit_rtl(i_argA, i_argB, o_result, o_status);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  input [3:0] i_argA;
  input [3:0] i_argB;
  output [3:0] o_result;
  output [3:0] o_status;
  assign _00_ = ~i_argB[1];
  assign _01_ = ~i_argB[0];
  assign _02_ = ~i_argB[3];
  assign _03_ = ~i_argB[2];
  assign _04_ = _02_ & _03_;
  assign o_status[0] = ~_04_;
  assign _05_ = i_argB[1] | i_argB[0];
  assign _06_ = ~_05_;
  assign _07_ = i_argA[0] | _06_;
  assign o_result[0] = _04_ & _07_;
  assign _08_ = _00_ & i_argB[0];
  assign _09_ = i_argA[1] | _08_;
  assign o_result[1] = _04_ & _09_;
  assign _10_ = i_argB[1] & _01_;
  assign _11_ = i_argA[2] | _10_;
  assign o_result[2] = _04_ & _11_;
  assign _12_ = i_argB[1] & i_argB[0];
  assign _13_ = i_argA[3] | _12_;
  assign o_result[3] = _04_ & _13_;
  assign o_status[3:1] = 3'h0;
endmodule
