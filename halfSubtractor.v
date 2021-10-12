module halfSub(a,b,_diff,borrow);
    input a,b;
    output _diff,borrow;
    assign _diff = a^b;
    assign borrow = ~a&b;
endmodule

module driver;
    reg a,b;
    wire _diff,borrow;
    halfSub hfa(a,b,_diff,borrow);
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
        $dumpfile("halfsub.vcd");
        $dumpvars(0,driver);
        $display("a\tb\t_diff\tborrow");
        $monitor("%d\t%d\t%d\t%d",a,b,_diff,borrow);
    end
endmodule
        
        