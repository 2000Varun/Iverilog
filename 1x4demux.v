module demux(a,b,c,d,s1,s0,I);
    input I,s1,s0;
    output a,b,c,d;
    assign a = I&~s1&~s0; 
    assign b = I&~s1&s0; 
    assign c = I&s1&~s0; 
    assign d = I&s1&s0;
endmodule;

module driver;
    reg s1,s0,I;
    wire a,b,c,d;
    demux d1(a,b,c,d,s1,s0,I);

    initial begin
        s1=0; s0=0; I=1;
        #10
        s1=0; s0=1; I=1;
        #10
        s1=1; s0=0; I=1;
        #10
        s1=1; s0=1; I=1;
        #10
        $finish;
    end

    initial begin
        $display("I\ts1\ts0\ta\tb\tc\td\t");
        $monitor("%d\t%d\t%d\t%d\t%d\t%d\t",I,s1,s0,a,b,c,d);
    end
endmodule