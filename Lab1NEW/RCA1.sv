module RCA1 (a,b,cin,cout,sum);
    input [3:0] a,b; 
    input cin; 
    output cout;
    output [3:0] sum; 

logic [2:0] carry;

full_adder1 fa0(a[0], b[0], cin, carry[0], sum[0]);
full_adder1 fa1(a[1], b[1], carry[0], carry[1], sum[1]);
full_adder1 fa2(a[2], b[2], carry[1], carry[2], sum[2]);
full_adder1 fa3(a[3], b[3], carry[2], cout, sum[3]);

endmodule