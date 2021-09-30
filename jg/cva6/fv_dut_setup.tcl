set design ariane_wrapper
append fv_file_list "../jg/fv" $enc ".vlist"
puts $fv_file_list
set all_files [concat "./config.vh -f ../jg/fv_dut_pkgs.vlist -f " $fv_file_list " -f ../jg/fv_dut.vlist" ]
puts $all_files

analyze -sv09 +incdir+../fv_rtl+../dut_rtl -f $all_files
  
# Elaborate design and properties
# Note: or use -bbox_mul -bbox_div -bbox_mod -bbox_pow ?
elaborate -top $design -disable_auto_bbox

# Set up clocks and resets and constants
clock clk_i
reset ~rst_ni
# assume fetch_enable_i==1'b0

set_max_trace_length 50

