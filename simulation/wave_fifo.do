onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fifo/COREFIFO_C0_0/DATA
add wave -noupdate /tb_fifo/COREFIFO_C0_0/RCLOCK
add wave -noupdate /tb_fifo/COREFIFO_C0_0/RE
add wave -noupdate /tb_fifo/COREFIFO_C0_0/WE
add wave -noupdate /tb_fifo/COREFIFO_C0_0/DVLD
add wave -noupdate /tb_fifo/COREFIFO_C0_0/EMPTY
add wave -noupdate /tb_fifo/COREFIFO_C0_0/FULL
add wave -noupdate /tb_fifo/COREFIFO_C0_0/MEMRADDR
add wave -noupdate /tb_fifo/COREFIFO_C0_0/MEMRE
add wave -noupdate /tb_fifo/COREFIFO_C0_0/MEMWADDR
add wave -noupdate /tb_fifo/COREFIFO_C0_0/MEMWE
add wave -noupdate /tb_fifo/COREFIFO_C0_0/Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9236 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {10500 ps}
