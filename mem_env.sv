class mem_env;
	mem_agent agt;
	mem_sbd sbd;

	task run();
	$display(" #### running  run task :: MEM_ENV");
			agt=new();
			sbd=new();
			agt.run();
			sbd.run();
	endtask
endclass
