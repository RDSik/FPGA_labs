set part     "xc7z020clg484-1"
set syn_top  "uart_top"
set sim_top  "uart_top_tb"
set language "Verilog"

set project_dir [file normalize "project"]
set path [file dirname [info script]]

create_project -force $syn_top $project_dir -part $part

set_property target_language $language [current_project]
set_property top $syn_top [current_fileset]
set_property top $sim_top [get_filesets sim_1]

add_files -norecurse labs/1/sw_led.v
add_files -norecurse labs/2/sw_led_wrapper.v
add_files -norecurse labs/2/top.v
add_files -norecurse labs/2/user_and.v
add_files -norecurse labs/2/user_or.v
add_files -norecurse labs/2/user_not.v
add_files -norecurse labs/3/ROM_4x6.v
add_files -norecurse labs/3/sin_rom.v
add_files -norecurse labs/4/rom.v
add_files -norecurse labs/4/uart_tx.v
add_files -norecurse labs/4/uart_top.v

add_files -norecurse labs/3/ROM_4x6_data.dat
add_files -norecurse labs/3/sin_val.dat

add_files -fileset sim_1 labs/1/sw_led_tb.v
add_files -fileset sim_1 labs/2/top_tb.v
add_files -fileset sim_1 labs/3/ROM_4x6_tb.v
add_files -fileset sim_1 labs/3/sin_rom_tb.v
add_files -fileset sim_1 labs/4/uart_top_tb.v

add_files -fileset constrs_1 -norecurse top.xdc

file copy -force labs/3/ROM_4x6_data.dat $path
file copy -force labs/3/sin_val.dat $path

set_property strategy Flow_PerfOptimized_high [get_runs synth_1]
set_property strategy Performance_ExtraTimingOpt [get_runs impl_1]

start_gui

launch_runs synth_1
wait_on_run synth_1
open_run synth_1 -name synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
