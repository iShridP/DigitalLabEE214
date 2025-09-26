transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab3/hamming_weight/Gates.vhdl}
vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab3/hamming_weight/DUT.vhdl}
vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab3/hamming_weight/hamming_weight.vhd}

vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/lab3/hamming_weight/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
