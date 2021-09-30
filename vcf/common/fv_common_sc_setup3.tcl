append fv_sc_path_if    $design ".fv.core.instr_fetch.instr[*].gen"
append fv_sc_path_ex_rf $design ".fv.core.ex_tracker.rf_tracker"
append fv_sc_path_ex_cf $design ".fv.core.ex_tracker.cf_tracker"

set FV_SC_DUP_properties [list \
				 $fv_sc_path_if.FV_SC_DUP_instr_Q_send_1hot \
				]

set FV_SC_CF_properties [list \
				 ]

set FV_SC_DUP_CF_properties [list \
				       $fv_sc_path_if.FV_SC_DUP_CF_in_passthru_no_dup \
				       $fv_sc_path_ex_cf.FV_SC_DUP_CF_cover_CF_dup_committed_save \
				       $fv_sc_path_ex_cf.FV_SC_DUP_CF_cover_CF_orig_queue_push \
				       $fv_sc_path_ex_cf.FV_SC_DUP_CF_br_dup_no_orig_commit \
				       $fv_sc_path_ex_cf.FV_SC_DUP_CF_CF_orig_pc_valid_on_dup_clear \
				      ]

set FV_SC_DUP_SYNC_properties [list \
				      $fv_sc_path_ex_rf.FV_SC_DUP_CF_rf_unlocked_on_sync \
				     ]
set FV_self_check_properties [list \
				    $fv_sc_path_if.instr_constraint.FV_SC_instr_constr_1hot \
				    $fv_sc_path_if.dup_instr.FV_SC_* \
				   ]

if {[info exists dup]} {
    append FV_self_check_properties " " $FV_SC_DUP_properties
    if {[info exists cf]} {
	append FV_self_check_properties " " $FV_SC_DUP_CF_properties
	if {$dup_sync == 1} {
	    append FV_self_check_properties " " $FV_SC_DUP_SYNC_properties
	}
    }
}

if {[info exists cf]} {
    append FV_self_check_properties " " $FV_SC_CF_properties
}

if {[info exists self_check]} {
    append list_of_properties_to_check " " $FV_self_check_properties
}
