
source ../vcf/fv_common_setup1.tcl
source ../vcf/fv_enc_setup.tcl
source ../vcf/fv_dut_setup.tcl
source ../vcf/fv_common_setup2.tcl
source ../vcf/fv_reg_setup.tcl
source ../vcf/fv_dut_setup2.tcl
source ../vcf/fv_common_setup3.tcl

if {[info exists run_fv_cov]} {
    set_fml_var fml_max_time 20m
    check_fv -property $FV_Cover_properties
    report_fv -type cover -list > cov_report.txt
}

set_fml_var fml_max_time $reg_time_out

if { $regress == 1} {
    check_fv -block -break 1 -property $list_of_properties_to_check
    report_fv -list > fv_report.txt
} else {
    check_fv                 -property $list_of_properties_to_check -run_finish {
	report_fv -list > fv_report.txt
    }
}
