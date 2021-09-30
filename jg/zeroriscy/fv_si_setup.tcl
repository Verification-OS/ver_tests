
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
    set_max_trace_length 20
    prove -property [list $fv_si_path.FV_si_check_A*]
    prove -property [list $fv_si_path.FV_si_check_O* $fv_si_path.FV_si_check_X*]
    prove -property [list $fv_si_path.FV_si_check_SL*]
    prove -property [list $fv_si_path.FV_si_check_SR* $fv_si_path.FV_si_check_SU*]
    prove -property [list $fv_si_path.FV_si_check_J*]
    prove -property [list $fv_si_path.FV_si_check_S*]
    prove -property [list $fv_si_path.FV_si_check_L*]
    
    set_prove_time_limit 200H
    set_max_trace_length 45
    prove -property [list $fv_si_path.FV_si_check_M*]
    prove -property [list $fv_si_path.FV_si_check_D* $fv_si_path.FV_si_check_R*]

    set_prove_time_limit 100H
    set_max_trace_length 25
    prove -property [list $fv_prop_path.FV_CF\[*\].prop]
    
#    prove -property [list $fv_si_path.FV_si_check_*]
    
    report -force -file fv_report.txt

}
