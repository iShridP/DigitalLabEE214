transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/Midsem/midsem_part2_24b1261/Gates.vhdl}
vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/Midsem/midsem_part2_24b1261/DUT.vhdl}
vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/Midsem/midsem_part2_24b1261/divisibility.vhd}

vcom -93 -work work {C:/Users/shrid/OneDrive/Documents/Desktop/Academics/Digital_lab/Midsem/midsem_part2_24b1261/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
