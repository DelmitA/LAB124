module full_adder1 (input  logic a, b, cin, output logic cout, sum);
   
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (a & cin) | (b & cin);
   
endmodule
