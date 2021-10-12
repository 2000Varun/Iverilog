module decoder(x,y,E,a,b,c,d);
    output a,b,c,d;
    input x,y,E;
    assign a = ~x&~y&E;
    assign b = ~x&y&E;
    assign c = x&~y&E;
    assign d = x&y&E;
endmodule;

module threetoeightdecoder(x,y,z,a,b,c,d,e,f,g,h);
    input x,y,z;
    output a,b,c,d,e,f,g,h;
    decoder d1(y,z,~x,a,b,c,d);
    decoder d2(y,z,x,e,f,g,h);
endmodule


module driver;
    reg x,y,z;
    wire a,b,c,d,e,f,g,h;
    threetoeightdecoder obj(x,y,z,a,b,c,d,e,f,g,h);
    initial begin
        x=0;y=0;z=0;
        #10
        x=0;y=0;z=1;
        #10
        x=0;y=1;z=0;
        #10
        x=0;y=1;z=1;
        #10
        x=1;y=0;z=0;
        #10
        x=1;y=0;z=1;
        #10
        x=1;y=1;z=0;
        #10
        x=1;y=1;z=1;
        #10
        $finish;
    end
    initial begin
        $display("x\ty\tz\ta\tb\tc\td\te\tf\tg\th");
        $monitor("%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t",x,y,z,a,b,c,d,e,f,g,h);
    end
endmodule