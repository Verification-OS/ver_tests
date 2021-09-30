snip_driver -exact $design.fv.core.i_drivers
snip_driver -exact $design.fv.core.o_drivers

report_snips
report_constant
report_link
report_fv_complexity

sim_run -stable

append fv_prop_path $design ".fv.properties"
append fv_si_path   $design ".fv.properties.si"

set list_of_properties_to_check []

