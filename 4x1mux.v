module mux(a,b,c,d,s1,s0,y);
    input a,b,c,d,s1,s0;
    output y;
    assign y = a&~s1&~s0 | b&~s1&s0 | c&s1&~s0 | d&s1&s0;
endmodule;

module driver;
    reg a,b,c,d,s1,s0;
    wire y;
    mux m1(a,b,c,d,s1,s0,y);

    initial begin
        a=0; b=1; c=1; d=0;
        s1=0; s0=0;
        #10
        s1=0; s0=1;
        #10
        s1=1; s0=0;
        #10
        s1=1; s0=1;
        #10
        $finish;
    end

    initial begin
        $display("s1\ts0\ty");
        $monitor("%d\t%d\t%d\t",s1,s0,y);
    end
endmodule