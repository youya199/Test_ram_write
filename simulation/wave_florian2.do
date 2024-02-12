onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/i_clk
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/i_start_write
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/AWADDR
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/AWVALID
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/AWREADY
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/WSTRB
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/WLAST
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/WVALID
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/WDATA
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/WREADY
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/BVALID
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/BREADY
add wave -noupdate /tb_axi_florian_2/axi_master_3_florian_0/write_fsm_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99929062 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 343
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
WaveRestoreZoom {0 ps} {976008 ps}
