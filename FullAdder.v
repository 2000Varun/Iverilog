module fullAdder(a,b,c,_sum,carry);
    input a,b,c;
    output _sum,carry;
    assign _sum = a^b^c;
    assign carry = a&b|b&c|c&a;
endmodule

module driver;
    reg a,b,c;
    wire _sum,carry;
    fullAdder fa(a,b,c,_sum,carry);
    initial begin
        a=0; b=0; c=0;
        #10
        a=0; b=0; c=1;
        #10
        a=0; b=1; c=0; 
        #10
        a=0; b=1;c=1;
        #10
        a=1; b=0;c=0;
        #10
        a=1; b=0;c=1;
        #10
        a=1; b=1;c=0;
        #10
        a=1; b=1;c=1;
        #10
        $finish;
    end
    initial begin
        $dumpfile("fulladd.vcd");
        $dumpvars(0,driver);
        $display("a\tb\tc\tsum\tcarry");
        $monitor("%d\t%d\t%d\t%d\t%d",a,b,c,_sum,carry);
    end
endmodule