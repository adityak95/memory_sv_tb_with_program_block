class mem_bfm;
	mem_tx tx;
	 virtual mem_intf vif;
	 function new();
			//	vif=new();//by doing this it ccreates new memory allocation
			vif =top.pif;//top module  interfce handle is assigned to vif ,now both  bfm and  top will refrece to same memory
	 endfunction

	task run();
		$display(" #### running  run task :: MEM_BFM");
		// collect  data from mailbox
			forever begin
					mem_common:: gen2bfm.get(tx);
					drive_tx(tx);
					tx.print("BFM");
			end
	endtask

	task drive_tx(mem_tx tx);
	// driving tx data to dut
		$display(" driving  the  tx data to dut ");
		@(posedge vif.clk);
		vif.addr=tx.addr;
		vif.wr_rd=tx.wr_rd;
		if(vif.wr_rd==1)
				vif.wdata=tx.data;
		vif.valid=1;
		wait(vif.ready==1);
		@(posedge vif.clk);
			if(vif.wr_rd==0)
			tx.data=vif.rdata;
		@(posedge vif.clk);
		vif.addr=0;
		vif.wr_rd=0;
		vif.valid=0;
		vif.wdata=0;

	endtask
endclass
