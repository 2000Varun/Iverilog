module halfAdder(a,b,_sum,carry);
    input a,b;
    output _sum,carry;
    assign _sum = a^b;
    assign carry = a&b;
endmodule

module or_gate(a,b,y);
    input a,b;
    output y;
    assign y=a|b;
endmodule

module driver;
    reg a,b,c;
    wire _sum1,sumf,carry1,carry2,carryf;
    halfAdder hfa1(a,b,_sum1,carry1);
    halfAdder hfa2(_sum1,c,sumf,carry2);
    or_gate org(carry1,carry2,carryf);
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
        $dumpfile("fullusinghalf.vcd");
        $dumpvars(0,driver);
        $display("a\tb\tc\tsum\tcarry");
        $monitor("%d\t%d\t%d\t%d\t%d",a,b,c,sumf,carryf);
    end
endmodule
        
        