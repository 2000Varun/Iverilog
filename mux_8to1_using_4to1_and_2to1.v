module mux_4to1 (
    I0, I1, I2, I3, S1, S0, Y
);

    input I0, I1, I2, I3, S0, S1;
    output Y;

    assign Y = ~S0&~S1&I0 | S0&~S1&I1 | ~S0&S1&I2 | S0&S1&I3;
    
endmodule

module mux_2to1(I0, I1, S0, Y);
    input S0, I0, I1;
    output Y;
 
    assign Y = I0&~S0 | I1&S0;
endmodule

module mux_8to1(I0, I1, I2, I3, I4, I5, I6, I7, S2, S1, S0, Y);
    input I0, I1, I2, I3, I4, I5, I6, I7, S0, S1, S2;
    output Y;

    wire y1, y2;
    mux_4to1 m4to1_1(I0, I1, I2, I3, S1, S0, y1);
    mux_4to1 m4to1_2(I4, I5, I6, I7, S1, S0, y2);

    
    mux_2to1 m2to1_1(y1, y2, S2, Y);
endmodule

module sim;
    reg i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2;
    wire y;

    mux_8to1 m8to1_1(i0, i1, i2, i3, i4, i5, i6, i7, s2, s1, s0, y);
    initial begin
        // $monitor("Y=%d", y);
        i0=0; i1=1; i2=0; i3=0; i4=0; i5=0; i6=0; i7=0;
        s2=0; s1=0; s0=1; 
        #10

        i0=1; i1=1; i2=1; i3=1; i4=1; i5=0; i6=1; i7=1;
        s2=1; s1=0; s0=1; 
        #10
        
        i0=0; i1=0; i2=0; i3=1; i4=0; i5=0; i6=0; i7=0;
        s2=0; s1=1; s0=1; 
        #10
        $finish;
    end

    always @(y)
        $display("y changed\t", "y=", y, " at time %0t", $time);
endmodule



