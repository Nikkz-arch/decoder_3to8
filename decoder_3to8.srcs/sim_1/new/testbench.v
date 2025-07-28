module testbench;
reg a2,a1,a0;
wire[7:0]y;
decoder3_8 uut(.a0(a0),.a1(a1),.a2(a2),.y(y));
initial begin
$monitor("time=%0t a2=%b a1=%b a0=%b y=%b",$time,a2,a1,a0,y);
a2=0;a1=0;a0=0;
#10 a2=0;a1=0;a0=1;
#10 a2=0;a1=1;a0=0;
#10 a2=0;a1=1;a0=1;
#10 a2=1;a1=0;a0=0;
#10 a2=1;a1=0;a0=1;
#10 a2=1;a1=1;a0=0;
#10 a2=1;a1=1;a0=1;
#10 $finish;
end
endmodule

