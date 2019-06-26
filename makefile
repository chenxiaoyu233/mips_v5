main: 
	iverilog -Wall -tvvp -o main.vvp *.v TestBench/PPCPU_tb.v
	vvp main.vvp
	open main.vcd
