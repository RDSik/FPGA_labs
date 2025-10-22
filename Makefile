PROJECT_DIR := project

TCL_FILE := project.tcl

.PHONY: project clean

project:
	vivado -mode tcl -source $(TCL_FILE)

clean:
	rm -rf $(PROJECT_DIR)
	rm *.log
	rm *.jou
