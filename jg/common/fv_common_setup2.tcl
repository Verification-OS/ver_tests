stopat fv.core.i_drivers
stopat fv.core.o_drivers

# Get design information to check general complexity
get_design_info

# commenting out the following as it takes forever or doesn't work!
#check_loop -global

append fv_prop_path $design ".fv.properties"
append fv_si_path   $design ".fv.properties.si"

set_message -warning EPM016

set list_of_properties_to_check []

