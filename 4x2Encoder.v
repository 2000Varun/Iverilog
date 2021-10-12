module encoder(a,b,c,d,x,y);
    input a,b,c,d;
    output x,y;
    assign x = a|b;
    assign y = a|c;
endmodule;

module driver;
    reg a,b,c,d;
    wire x,y;
    encoder m1(a,b,c,d,x,y);

    initial begin
        a=0; b=0; c=0; d=0;
        #10
        a=0; b=0; c=1; d=0;
        #10
        a=0; b=1; c=0; d=0;
        #10
        a=1; b=0; c=0; d=0;
        #10
        $finish;
    end

    initial begin
        $display("a\tb\tc\td\tx\ty");
        $monitor("%d\t%d\t%d\t%d\t%d\t%d\t",a,b,c,d,x,y);
    end
endmodule