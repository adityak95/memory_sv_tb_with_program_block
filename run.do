vlog list.svh
 vsim  -novopt -suppress 12110 top -sv_seed 57295827
 add wave  -position insertpoint sim:/top/dut/*
 run -all
