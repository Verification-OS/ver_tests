
set FV_DUP_properties [list \
			      $fv_prop_path.FV_DUP_halves_*\[2\].genblk1.prop \
			      $fv_prop_path.FV_DUP_pairs_*\[2\].genblk1.prop \
			      $fv_prop_path.FV_DUP_halves_*\[2\].prop \
			      $fv_prop_path.FV_DUP_pairs_*\[2\].prop \
			     ]

set FV_CF_properties [list \
			       $fv_prop_path.FV_CF\[*\].prop \
			      ]

set FV_EXQ_properties [list \
			     $fv_prop_path.FV_EXQ_check_kill_found \
			     $fv_prop_path.FV_EXQ_check_jmp_taken \
			     $fv_prop_path.FV_EXQ_check_commit\[*\].not_empty \
			     $fv_prop_path.FV_EXQ_check_commit\[*\].some_uncommitted \
			     $fv_prop_path.FV_EXQ_check_commit\[*\].expected_kill_received \
			     $fv_prop_path.FV_EXQ_check_queue_not_full \
			    ]

set FV_DUP_CF_properties [list \
				    $fv_prop_path.FV_DUP_CF_check_br_dup_taken \
				    $fv_prop_path.FV_DUP_CF_check_JALR_dest_PC \
				    $fv_prop_path.FV_DUP_CF_check_dest_PC \
				   ]

set FV_DUP_SYNC_properties [list \
				   $fv_prop_path.FV_DUP_sync*\[2\].genblk1.prop \
				   $fv_prop_path.FV_DUP_sync_ready \
				  ]

set FV_CMT_properties [list $fv_prop_path.FV_CMT]

set FV_Cover_properties [list *.FV_Cover*]

if {[info exists dup]} {
    append list_of_properties_to_check " " $FV_DUP_properties
    if {[info exists cf]} {
	append list_of_properties_to_check " " $FV_DUP_CF_properties
	if {$dup_sync == 1} {
	    append list_of_properties_to_check " " $FV_DUP_SYNC_properties
	}
    }
}

if {[info exists exq]} {
    append list_of_properties_to_check " " $FV_EXQ_properties
}

if {[info exists cf]} {
    append list_of_properties_to_check " " $FV_CF_properties
}

if {[info exists cmt]} {
    append list_of_properties_to_check " " $FV_CMT_properties
    set_max_trace_length 100
# trying to set a different depth for CMT
#    task -create cmt -set -source_task <embedded> -copy_stopats -copy_abstractions all -copy_assumes -copy $FV_CMT_properties
#    set_max_trace_length -task cmt 300
}

#if {[info exists run_fv_cov]} {
#    append list_of_properties_to_check " " $FV_Cover_properties
#}


