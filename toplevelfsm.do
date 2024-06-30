# close any existing simulations
quit -sim

# compile our VHDL file
vcom toplevelfsm.vhd

# start the simulation - set timescale to nanoseconds
vsim -t ns toplevelfsm

# add the inputs to the wave
# first add a divider with a label
add wave -divider Inputs:
add wave Din Clk Init C R

# add the outputs to the wave
# first add a divider with a label
add wave -divider Outputs:
add wave Result ResultL ResultR Change ChangeL ChangeR Change_pulse Vend

# do initial run with default values - optional
#run 10 ns

# force values

force Din "000"
force Clk 0
force Init 1

run 30ns
#initialize

#force Din 5c
#QDN

force Din "001"
force Init 0
force Clk 0
run 10ns
force Clk 1
run 10ns

#10C
force Din "010"
force Clk 0
run 10ns
force Clk 1
run 10ns

#25C
force Din "100"
force Clk 0
run 10ns
force Clk 1
run 10ns

#reset
force Din "000"
force Clk 0
force Init 1
run 30ns

#force 5c
force Din "001"
force Init 0
force Clk 0
run 10ns
force Clk 1
run 10ns

#force 5C
force Din "001"
force Clk 0
run 10ns
force Clk 1
run 10ns

#force 5C
force Din "001"
force Clk 0
run 10ns
force Clk 1
run 10ns

#force 5C
force Din "001"
force Clk 0
run 10ns
force Clk 1
run 10ns

#force 5C
force Din "001"
force Clk 0
run 10ns
force Clk 1
run 10ns

# run
run 200ns
