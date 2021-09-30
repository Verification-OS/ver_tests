set design ariane_wrapper
append fv_file_list "../vcf/fv" $enc ".vlist"
puts $fv_file_list
set vcs_files [concat "+incdir+../fv_rtl+../dut_rtl ./config.vh -f ../vcf/fv_dut_pkgs.vlist -f " $fv_file_list " -f ../vcf/fv_dut.vlist" ]
puts $vcs_files
read_file -sva -format sverilog -top $design -vcs $vcs_files
create_clock clk_i -period 100
create_reset rst_ni -low
# the following are tied in the ariane_wrapper
#set_constant irq_i -value 2'b0
#set_constant ipi_i -value 1'b0
#set_constant timer_irq_i -value 1'b0
#set_constant debug_req_i -value 1'b0

set_fml_var fml_max_proof_depth 50

