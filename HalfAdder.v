module halfAdder(a,b,_sum,carry);
    input a,b;
    output _sum,carry;
    assign _sum = a^b;
    assign carry = a&b;
endmodule

module driver;
    reg a,b;
    wire _sum,carry;
    halfAdder hfa(a,b,_sum,carry);
    initial begin
        a=0; b=0;
        #10
        a=0; b=1;
        #10
        a=1; b=0;
        #10
        a=1; b=1;
        #10
        $finish;
    end
    initial begin
        $dumpfile("halfadd.vcd");
        $dumpvars(0,driver);
        $display("a\tb\tsum\tcarry");
        $monitor("%d\t%d\t%d\t%d",a,b,_sum,carry);
    end
endmodule
        
        