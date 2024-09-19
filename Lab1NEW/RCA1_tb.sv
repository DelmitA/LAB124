`timescale 1ns / 1ps

module tb();

   logic [3:0] a;
   logic [3:0] b;
   logic cin;
   logic [3:0]sum;
   logic [3:0] cout;
   logic clk = 0;

   // Instantiate the device under test (RCA module)
   RCA1 dut (a, b, cin, cout, sum);

   integer handle3;
   integer desc3;
   integer i;
   reg [3:0] sum_correct; 

   initial begin
      handle3 = $fopen("rca.out");
      desc3 = handle3;
      #1760 $finish;
   end
   
   always begin
      #5 clk = ~clk; 
   end

   initial begin
      for (i = 0; i < 176; i = i + 1) begin
         @(posedge clk);
         a = $random;
         b = $random;
         cin = $random;
   
         assign sum_correct = a + b + cin;

         @(negedge clk);

         $fdisplay(desc3, "Test %d: a = %h, b = %h || sum = %b, sum_correct = %b, Correct = %b",
                   (i+1), a, b, sum, sum_correct, (sum == sum_correct));
      end

      $fclose(handle3);
      
   end

endmodule


