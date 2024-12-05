interface mem_intf(input reg clk, rst);
logic [`ADDR_WIDTH-1:0]addr;
logic [`WIDTH-1:0]wdata;
logic wr_rd,valid;
logic [`WIDTH-1:0]rdata;
logic ready;

endinterface
