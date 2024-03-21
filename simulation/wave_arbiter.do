onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/i_clk
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/i_start_write
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/AWVALID
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/AWREADY
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/WVALID
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/WREADY
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/BVALID
add wave -noupdate /tb_axi_arbiter/axi_master_florian_64bits_0/BREADY
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {125172 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 466
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
WaveRestoreZoom {0 ps} {549801 ps}
