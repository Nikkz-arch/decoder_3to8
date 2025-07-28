module decoder2_4(input a0,input a1,input en,output reg [3:0]d);
always@(*)begin
if(en)
case({a1,a0})
2'b00:d=4'b0001;
2'b01:d=4'b0010;
2'b10:d=4'b0100;
2'b11:d=4'b1000;
default:d=4'b0000;
endcase
else
d = 4'b0000;
end
endmodule

module decoder3_8(input a0,a1,a2,output [7:0] y);
decoder2_4 d1(.a0(a0),.a1(a1),.en(~a2),.d(y[3:0]));
decoder2_4 d2(.a0(a0),.a1(a1),.en(a2),.d(y[7:4]));
endmodule
