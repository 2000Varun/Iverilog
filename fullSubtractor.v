module fullAdder(a,b,c,_diff,borrow);
    input a,b,c;
    output _diff,borrow;
    assign _diff = a^b^c;
    assign borrow = ~a&b | ~a&c | b&c;
endmodule

module driver;
    reg a,b,c;
    wire _diff,borrow;
    fullAdder fa(a,b,c,_diff,borrow);
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
        $dumpfile("fullSub.vcd");
        $dumpvars(0,driver);
        $display("a\tb\tc\tDiff\tborrow");
        $monitor("%d\t%d\t%d\t%d\t%d",a,b,c,_diff,borrow);
    end
endmodule