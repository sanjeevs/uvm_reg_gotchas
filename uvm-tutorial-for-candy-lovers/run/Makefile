#
# Makefile
#

help:
	@echo "Usage: make SIMULATOR TEST=name"

# conditionals
#-------------------------------------------------------------------------------
srm_package    := $(SRM_HOME)/src/srm_pkg.sv
tutorial_files := no_source_code.sv
testname       := no_test
src_dir        := .

tutorial_files := $(src_dir)/$(TEST).sv
testname := jelly_bean_reg_test

# constants
#-------------------------------------------------------------------------------

ifeq "$(SRM)" "1"
compile_files := $(srm_package) $(tutorial_files)
compile_opts  := +incdir+$(SRM_HOME)/src 
else
compile_files := $(tutorial_files)
endif

run_opts      := +UVM_TESTNAME=$(testname) 
top_module    := top

include incisive.mk
include modelsim.mk
include questa.mk
include vcs.mk

clean: clean_incisive clean_vcs
	rm -rf *.sv *.dat

clean_all: clean_incisive clean_vcs clean_modelsim clean_questa 
