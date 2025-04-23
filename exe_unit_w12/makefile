
EXAMPLE     = exe_unit_w12
MODEL_FILES = ${EXAMPLE}.sv
RTL_FILES   = ${EXAMPLE}_rtl.sv
TB_FILES    = exe_unit_w12_tb.sv

rtl: 
    # Uruchomienie syntezy yosys
	yosys -s run.ys | tee synth.log

sim: compile
    # Wykonanie skompilowanego programu symulacji
	./${EXAMPLE}.iveri.run

compile: clear
    # Kompilacja modulow verilog do programu wykonywalnego
	iverilog -g2005-sv                               \
	    ${MODEL_FILES} ${RTL_FILES} ${TB_FILES}      \
		-o ${EXAMPLE}.iveri.run                  \
		    |& tee ${EXAMPLE}.iveri.log

waves:
    # Uruchomienie przegladarki przebiegow GTKWave
	gtkwave exe_unit_w12.vcd &
	
clear:
    # Usuwanie wyniku kompilacji Icarus Verilog
	if [ -f ${EXAMPLE}.iveri.run ] ; \
	    then rm ${EXAMPLE}.iveri.run ; fi
