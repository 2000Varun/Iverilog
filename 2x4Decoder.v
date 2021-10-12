module decoder(x,y,a,b,c,d);
    output a,b,c,d;
    input x,y;
    assign a = ~x&~y;
    assign b = ~x&y;
    assign c = x&~y;
    assign d = x&y;
endmodule;

module driver;
    wire a,b,c,d;
    reg x,y;
    decoder m1(x,y,a,b,c,d);

    initial begin
        x=0; y=0;
        #10
        x=0; y=1;
        #10
        x=1; y=0;
        #10
        x=1; y=1;
        #10
        $finish;
    end

    initial begin
        $display("x\ty\ta\tb\tc\td");
        $monitor("%d\t%d\t%d\t%d\t%d\t%d\t",x,y,a,b,c,d);
    end
endmodule