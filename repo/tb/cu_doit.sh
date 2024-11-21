# Cleanup old files
name="control_unit"

rm -rf obj_dir
rm -f $name.vcd

# Run Verilator to generate C++ code for all Verilog files and the testbench
verilator -Wall --cc --trace $name.sv main_decoder.sv ALU_decoder.sv --exe tb.cpp --top-module $name

# Build the generated C++ project (note updated makefile name)
make -j -C obj_dir/ -f V$name.mk V$name

# Run the simulation executable (note updated executable name)
obj_dir/Vcontrol_unit

#source ./doit.sh