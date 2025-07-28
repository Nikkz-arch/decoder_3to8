3-to-8 Decoder (Verilog):
Overview
This project implements a 3-to-8 line decoder using a hierarchical design in Verilog HDL.
The decoder activates one output line corresponding to the binary value of the 3-bit input.
It is implemented using two 2-to-4 decoders to demonstrate modular design.

In this design
Inputs:
a2 a1 a0 (3-bit select lines)

Outputs:
y7 y6 y5 y4 y3 y2 y1 y0 (8-bit one-hot encoded output)

Files Included
decoder2_4.v – RTL design of 2-to-4 Decoder
decoder3_8.v – Hierarchical design of 3-to-8 Decoder using two 2-to-4 decoders
testbench.v – Testbench for functional verification
/screenshots/ – Simulation results and waveform analysis

How It Works
The 3-to-8 decoder works as follows:
Uses two 2-to-4 decoders
a2 acts as the enable signal to decide which 2-to-4 decoder activates:
If a2 = 0 → lower 2-to-4 decoder enables (y0–y3)
If a2 = 1 → upper 2-to-4 decoder enables (y4–y7)

Outputs are one-hot, meaning only one output is high at a time based on the binary input.

Logic
a2 a1 a0 → y
000 → y0
001 → y1
010 → y2
011 → y3
100 → y4
101 → y5
110 → y6
111 → y7

Truth Table
a2	a1	a0	y7 y6 y5 y4 y3 y2 y1 y0
0	0	0      	00000001
0	0	1      	00000010
0	1	0     	00000100
0	1	1     	00001000
1	0	0	      00010000
1	0	1	      00100000
1	1	0     	01000000
1	1	1	      10000000

Instantiation Explanation
The hierarchical design uses two instances of decoder2_4:
First instance → handles outputs y0–y3 when a2 = 0
Second instance → handles outputs y4–y7 when a2 = 1
decoder2_4 d1(.a0(a0), .a1(a1), .en(~a2), .d(y[3:0]));
decoder2_4 d2(.a0(a0), .a1(a1), .en(a2),  .d(y[7:4]));

Simulation Results (TCL Console):
time=0 a2=0 a1=0 a0=0 y=00000001
time=10 a2=0 a1=0 a0=1 y=00000010
time=20 a2=0 a1=1 a0=0 y=00000100
time=30 a2=0 a1=1 a0=1 y=00001000
time=40 a2=1 a1=0 a0=0 y=00010000
time=50 a2=1 a1=0 a0=1 y=00100000
time=60 a2=1 a1=1 a0=0 y=01000000
time=70 a2=1 a1=1 a0=1 y=10000000
Tools Used
Language: Verilog HDL

Simulator: Xilinx Vivado

Author
NIKSHITHA SHREE C V
B.Tech – VLSI Design & Technology
