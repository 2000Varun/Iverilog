//1) GATES

module and_gate(a,b,y);
    input a,b;
    output y;
    assign y=a&b;
endmodule

module or_gate(a,b,y);
    input a,b;
    output y;
    assign y=a|b;
endmodule

module xor_gate(a,b,y);
    input a,b;
    output y;
    assign y=a^b;
endmodule

module not_gate(a,y);
    input a;
    output y;
    assign y=~a;
endmodule

module nand_gate(a,b,y);
    input a,b;
    output y;
    assign y=~(a&b);
endmodule

module nor_gate(a,b,y);
    input a,b;
    output y;
    assign y=~(a|b);
endmodule

module exnor_gate(a,b,y);
    input a,b;
    output y;
    assign y=~(a^b);
endmodule

module driver;
    reg a,b;
    wire AND,OR,XOR,NOT,NAND,NOR,EXNOR;
    and_gate gate1(a,b,AND);
    or_gate gate2(a,b,OR);
    xor_gate gate3(a,b,XOR);
    not_gate gate4(a,NOT);
    nand_gate gate5(a,b,NAND);
    nor_gate gate6(a,b,NOR);
    exnor_gate gate7(a,b,EXNOR);
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
        $dumpfile("test.vcd");
        $dumpvars(0,driver);
        $display("a\tb\tAND\tOR\tXOR\tNOT\tNAND\tNOR\tEXNOR");
        $monitor("%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d",a,b,AND,OR,XOR,NOT,NAND,NOR,EXNOR);
    end
endmodule