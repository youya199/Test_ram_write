onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/i_clk
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/i_start_write
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/AWVALID
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/AWREADY
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/WVALID
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/WREADY
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/BVALID
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/BREADY
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_0/write_fsm_state
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/i_clk
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/i_start_write
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/AWVALID
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/AWREADY
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/WVALID
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/WREADY
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/BVALID
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/BREADY
add wave -noupdate /tb_axi_arbiter_mux/axi_master_florian_64bits_1/write_fsm_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10149400 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 413
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {82247 ps} {6220397 ps}
