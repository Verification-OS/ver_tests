set_prove_time_limit 200h
set_prove_per_property_time_limit 200h
set_max_trace_length 35
# set the following according to the machine size FV is run on
#set_proofgrid_max_local_jobs 96
#set_proofgrid_per_engine_max_local_jobs 96
#set_proofgrid_per_engine_max_jobs_per_session 96

# JG's coverage experiment
# check_cov -init -model { branch statement expression toggle functional } -type { stimuli coi proof bound }
