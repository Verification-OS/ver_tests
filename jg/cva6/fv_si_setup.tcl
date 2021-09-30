
source ../jg/fv_common_setup1.tcl
source ../jg/fv_enc_setup.tcl
source ../jg/fv_dut_setup.tcl
source ../jg/fv_common_setup2.tcl
source ../jg/fv_reg_setup.tcl
source ../jg/fv_dut_setup2.tcl
source ../jg/fv_common_setup3.tcl

set_prove_time_limit $reg_time_out
set_prove_per_property_time_limit $reg_time_out

if { $regress == 1} {

    set_prove_time_limit 12H
    set_max_trace_length 25
    if { $inc_rva == 1} {
	prove -property [list $fv_si_path.FV_si_check_AMO*]
    }
    prove -property [list $fv_si_path.FV_si_check_A*]
    prove -property [list $fv_si_path.FV_si_check_O* $fv_si_path.FV_si_check_X*]
    prove -property [list $fv_si_path.FV_si_check_SL*]
    prove -property [list $fv_si_path.FV_si_check_SR* $fv_si_path.FV_si_check_SU*]
    prove -property [list $fv_si_path.FV_si_check_J*]
    prove -property [list $fv_si_path.FV_si_check_S*]
    prove -property [list $fv_si_path.FV_si_check_L*]
    
# cannot do CF until branch-prediction is supported
#    set_prove_time_limit 100H
#    set_max_trace_length 25
#    prove -property [list $fv_prop_path.FV_CF\[*\].prop]
    prove -property [list $fv_prop_path.FV_EXQ*]

    set_prove_time_limit 200H
    prove -property [list $fv_si_path.FV_si_check_M*]
    set_max_trace_length 50
    prove -property [list $fv_si_path.FV_si_check_D* $fv_si_path.FV_si_check_R*]

    report -force -file fv_report.txt

}
