
source ../vcf/fv_common_setup1.tcl
source ../vcf/fv_enc_setup.tcl
source ../vcf/fv_dut_setup.tcl
source ../vcf/fv_common_setup2.tcl
source ../vcf/fv_reg_setup.tcl
source ../vcf/fv_dut_setup2.tcl
source ../vcf/fv_common_setup3.tcl

set_fml_var fml_max_time $reg_time_out

if { $regress == 1} {

    set_fml_var fml_max_time 12H
    set_fml_var fml_max_proof_depth 20
    check_fv -block -property [list $fv_si_path.FV_si_check_A*]
    check_fv -block -property [list $fv_si_path.FV_si_check_O* $fv_si_path.FV_si_check_X*]
    check_fv -block -property [list $fv_si_path.FV_si_check_SL*]
    check_fv -block -property [list $fv_si_path.FV_si_check_SR* $fv_si_path.FV_si_check_SU*]
    check_fv -block -property [list $fv_si_path.FV_si_check_J*]
    check_fv -block -property [list $fv_si_path.FV_si_check_S*]
    check_fv -block -property [list $fv_si_path.FV_si_check_L*]
    
    set_fml_var fml_max_time 200H
    set_fml_var fml_max_proof_depth 45
    check_fv -block -property [list $fv_si_path.FV_si_check_M*]
    check_fv -block -property [list $fv_si_path.FV_si_check_D* $fv_si_path.FV_si_check_R*]

    set_fml_var fml_max_time 100H
    set_fml_var fml_max_proof_depth 25
    check_fv -block -property [list $fv_prop_path.FV_CF[*].prop]
    
#    check_fv -block -property [list $fv_si_path.FV_si_check_*]
    
    report_fv -list > fv_report.txt

}
