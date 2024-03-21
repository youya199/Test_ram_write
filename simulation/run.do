quietly set ACTELLIBNAME PolarFire
quietly set PROJECT_DIR "C:/Users/YanGao/Desktop/Yan/Test_ram_write"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap PolarFire "C:/Microchip/Libero_SoC_v2023.2/Designer/lib/modelsimpro/precompiled/vlog/polarfire"
if {[file exists COREFIFO_LIB/_info]} {
   echo "INFO: Simulation library COREFIFO_LIB already exists"
} else {
   file delete -force COREFIFO_LIB 
   vlib COREFIFO_LIB
}
vmap COREFIFO_LIB "COREFIFO_LIB"
if {[file exists COREAXI4SRAM_LIB/_info]} {
   echo "INFO: Simulation library COREAXI4SRAM_LIB already exists"
} else {
   file delete -force COREAXI4SRAM_LIB 
   vlib COREAXI4SRAM_LIB
}
vmap COREAXI4SRAM_LIB "COREAXI4SRAM_LIB"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/combine.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/turn_on_writer_block.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/enable_block.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/tow_AND_entop/tow_AND_entop.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREFIFO/3.0.101/rtl/vhdl/core/fifo_pkg.vhd"
vcom -2008 -explicit  -work COREAXI4SRAM_LIB "${PROJECT_DIR}/component/work/COREAXI4SRAM_C1/COREAXI4SRAM_C1_0/rtl/vhdl/core/misc_pkg.vhd"
vcom -2008 -explicit  -work COREAXI4SRAM_LIB "${PROJECT_DIR}/component/work/COREAXI4SRAM_C1/COREAXI4SRAM_C1_0/rtl/vhdl/core/XHDL_misc.vhd"
vcom -2008 -explicit  -work COREAXI4SRAM_LIB "${PROJECT_DIR}/component/work/COREAXI4SRAM_C1/COREAXI4SRAM_C1_0/rtl/vhdl/core/XHDL_std_logic.vhd"
vcom -2008 -explicit  -work COREAXI4SRAM_LIB "${PROJECT_DIR}/component/work/COREAXI4SRAM_C2/COREAXI4SRAM_C2_0/rtl/vhdl/core/misc_pkg.vhd"
vcom -2008 -explicit  -work COREAXI4SRAM_LIB "${PROJECT_DIR}/component/work/COREAXI4SRAM_C2/COREAXI4SRAM_C2_0/rtl/vhdl/core/XHDL_misc.vhd"
vcom -2008 -explicit  -work COREAXI4SRAM_LIB "${PROJECT_DIR}/component/work/COREAXI4SRAM_C2/COREAXI4SRAM_C2_0/rtl/vhdl/core/XHDL_std_logic.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/Simulation/CLK_GEN/1.0.1/CLK_GEN.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/CLK_GEN_C0/CLK_GEN_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/CLK_GEN_C1/CLK_GEN_C1.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/Simulation/PULSE_GEN/1.0.1/PULSE_GEN.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/PULSE_GEN_C4/PULSE_GEN_C4.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/Actel/Simulation/RESET_GEN/1.0.1/RESET_GEN.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/RESET_GEN_C0/RESET_GEN_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/SR13.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/32bit_counter.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/tb_SR13/tb_SR13.vhd"

vsim -L PolarFire -L presynth -L COREFIFO_LIB -L COREAXI4SRAM_LIB  -t 1ps -pli C:/Microchip/Libero_SoC_v2023.2/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll presynth.tb_SR13
add wave /tb_SR13/*
run 1000ns
