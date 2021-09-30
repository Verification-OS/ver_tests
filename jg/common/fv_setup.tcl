
source ../jg/fv_common_setup1.tcl
source ../jg/fv_enc_setup.tcl
source ../jg/fv_dut_setup.tcl
source ../jg/fv_common_setup2.tcl
source ../jg/fv_reg_setup.tcl
source ../jg/fv_dut_setup2.tcl
source ../jg/fv_common_setup3.tcl

if {[info exists run_fv_cov]} {
    set_prove_time_limit 20m
    set_prove_per_property_time_limit 10m
    prove  -property $FV_Cover_properties
    report -force -file cov_report.txt
}

set_prove_time_limit $reg_time_out
set_prove_per_property_time_limit $reg_time_out

if { $regress == 1} {
    set_stop_on_cex_limit 1
    prove  -property $list_of_properties_to_check
    report -force -file fv_report.txt
} else {
# trying to run CMT separately (with its own max depth)
#    if {[info exists cmt]} {
#	prove -bg -task {cmt}
#    }
    prove  -property $list_of_properties_to_check
    report -force -file fv_report.txt
}
