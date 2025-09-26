transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab1/OR_gate/Gates.vhdl}
vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab1/OR_gate/DUT.vhdl}
vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab1/OR_gate/or_nand.vhd}

vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab1/OR_gate/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
