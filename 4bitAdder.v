module halfAdder(a,b,_sum,carry);
    input a,b;
    output _sum,carry;
    assign _sum = a^b;
    assign carry = a&b;
endmodule

module fullAdder(a,b,c,_sum,carry);
    input a,b,c;
    output _sum,carry;
    assign _sum = a^b^c;
    assign carry = a&b|b&c|c&a;
endmodule

module driver;
    reg a1,a2,a3,a4,b1,b2,b3,b4;
    wire sum1,sum2,sum3,sum4,carry1,carry2,carry3,carry4;
    halfAdder hfa1(a1,b1,sum1,carry1);
    fullAdder fa1(a2,b2,carry1,sum2,carry2);
    fullAdder fa2(a3,b3,carry2,sum3,carry3);
    fullAdder fa3(.a(a4),.b(b4),.c(carry3),.carry(carry4),._sum(sum4));
    initial begin
        // a4=0; a3=0; a2=0; a1=0;
        // b4=0; b3=0; b2=0; b1=0;
        // #10
        a4=1; a3=1; a2=0; a1=0;
        b4=1; b3=0; b2=1; b1=0;
        #10
        $finish;
    end
    initial begin
        $dumpfile("4bitadder.vcd");
        $dumpvars(0,driver);
        $display("\t%d\t%d\t%d\t%d",a4,a3,a2,a1);
        $display("\t%d\t%d\t%d\t%d",b4,b3,b2,b1);
        $monitor("%d\t%d\t%d\t%d\t%d",carry4,sum4,sum3,sum2,sum1);
    end
endmodule