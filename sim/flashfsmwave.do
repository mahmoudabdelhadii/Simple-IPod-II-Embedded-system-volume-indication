onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /flashfsm_tb/CLK50MHZ
add wave -noupdate /flashfsm_tb/CLK22KHZ
add wave -noupdate /flashfsm_tb/CLK
add wave -noupdate /flashfsm_tb/flash_mem_readdatavalid
add wave -noupdate /flashfsm_tb/flash_mem_waitrequest
add wave -noupdate /flashfsm_tb/flash_mem_readdata
add wave -noupdate /flashfsm_tb/reset
add wave -noupdate /flashfsm_tb/pause
add wave -noupdate /flashfsm_tb/direction
add wave -noupdate /flashfsm_tb/flash_mem_read
add wave -noupdate /flashfsm_tb/flash_mem_byteenable
add wave -noupdate /flashfsm_tb/data_out
add wave -noupdate /flashfsm_tb/flash_mem_address
add wave -noupdate /flashfsm_tb/DUT2/U6/clock
add wave -noupdate /flashfsm_tb/DUT2/U6/reset
add wave -noupdate /flashfsm_tb/DUT2/U6/fetchaddressenable
add wave -noupdate /flashfsm_tb/DUT2/U6/direction
add wave -noupdate /flashfsm_tb/DUT2/U6/addressready
add wave -noupdate /flashfsm_tb/DUT2/U6/state
add wave -noupdate /flashfsm_tb/DUT2/U6/nextaddress
add wave -noupdate /flashfsm_tb/DUT2/U6/send
add wave -noupdate /flashfsm_tb/DUT2/U6/next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1506 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {1596 ps} {3118 ps}
