
module top;
//declare the  clk and rst
reg clk,rst;
 mem_intf pif(clk,rst);
 mem_prgm pgm();
//dut insantation
 memory dut (.clk(pif.clk),.rst(pif.rst),.addr(pif.addr),.wdata(pif.wdata),.wr_rd(pif.wr_rd),.valid(pif.valid),.rdata(pif.rdata),.ready(pif.ready));

initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;
	#10;
	rst=0;
end
initial begin
		#500;
		$finish;
end
endmodule
