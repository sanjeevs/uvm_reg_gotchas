#
# vcs.mk
#

# user definable variables

# NONE

# constants

vcs_compile_files := $(compile_files)
vcs_compile_opts  := $(compile_opts) -timescale=1ns/10ps -ntb_opts uvm -sverilog +define+CL_USE_VCS +prof 
vcs_run_opts      := $(run_opts) -l vcs_tutorial_$(TEST).log

# targets

vcs: run_vcs

prep_vcs:

run_vcs: 
	vcs $(vcs_compile_opts) $(vcs_compile_files)
	./simv -V $(vcs_run_opts)

clean_vcs:
	rm -rf ./simv ./simv.daidir ./simv.vdb ./csrc ucli.key vc_hdrs.h *.log *.prof
