set design top
append fv_file_list "../vcf/fv" $enc ".vlist"
puts $fv_file_list
set vcs_files [concat "+incdir+../fv_rtl+../dut_rtl -f " $fv_file_list " -f ../vcf/fv_dut.vlist" ]
puts $vcs_files
read_file -sva -format sverilog -top $design -vcs $vcs_files
create_clock clk -period 100
create_reset reset_x -low
