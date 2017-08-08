#
# incisive.mk
#

# user definable variables

# NONE

# constants

incisive_compile_files := $(compile_files)
incisive_compile_opts  := $(compile_opts) -uvm +define+CL_USE_INCISIVE -64bit
incisive_run_opts      := $(run_opts) -l incisive_$(TEST).log

# targets

incisive: run_incisive

prep_incisive:

run_incisive: 
	irun -licq $(incisive_compile_opts) $(incisive_run_opts) $(incisive_compile_files)

clean_incisive:
	rm -rf ./INCA_libs *.history *.log
