onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /addressfsm_tb/clock
add wave -noupdate /addressfsm_tb/reset
add wave -noupdate /addressfsm_tb/fetchaddressenable
add wave -noupdate /addressfsm_tb/direction
add wave -noupdate -radix hexadecimal -childformat {{{/addressfsm_tb/address_out[22]} -radix hexadecimal} {{/addressfsm_tb/address_out[21]} -radix hexadecimal} {{/addressfsm_tb/address_out[20]} -radix hexadecimal} {{/addressfsm_tb/address_out[19]} -radix hexadecimal} {{/addressfsm_tb/address_out[18]} -radix hexadecimal} {{/addressfsm_tb/address_out[17]} -radix hexadecimal} {{/addressfsm_tb/address_out[16]} -radix hexadecimal} {{/addressfsm_tb/address_out[15]} -radix hexadecimal} {{/addressfsm_tb/address_out[14]} -radix hexadecimal} {{/addressfsm_tb/address_out[13]} -radix hexadecimal} {{/addressfsm_tb/address_out[12]} -radix hexadecimal} {{/addressfsm_tb/address_out[11]} -radix hexadecimal} {{/addressfsm_tb/address_out[10]} -radix hexadecimal} {{/addressfsm_tb/address_out[9]} -radix hexadecimal} {{/addressfsm_tb/address_out[8]} -radix hexadecimal} {{/addressfsm_tb/address_out[7]} -radix hexadecimal} {{/addressfsm_tb/address_out[6]} -radix hexadecimal} {{/addressfsm_tb/address_out[5]} -radix hexadecimal} {{/addressfsm_tb/address_out[4]} -radix hexadecimal} {{/addressfsm_tb/address_out[3]} -radix hexadecimal} {{/addressfsm_tb/address_out[2]} -radix hexadecimal} {{/addressfsm_tb/address_out[1]} -radix hexadecimal} {{/addressfsm_tb/address_out[0]} -radix hexadecimal}} -subitemconfig {{/addressfsm_tb/address_out[22]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[21]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[20]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[19]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[18]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[17]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[16]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[15]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[14]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[13]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[12]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[11]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[10]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[9]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[8]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[7]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[6]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[5]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[4]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[3]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[2]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[1]} {-height 15 -radix hexadecimal} {/addressfsm_tb/address_out[0]} {-height 15 -radix hexadecimal}} /addressfsm_tb/address_out
add wave -noupdate /addressfsm_tb/addressready
add wave -noupdate /addressfsm_tb/DUT/state
add wave -noupdate -radix hexadecimal /addressfsm_tb/DUT/nextaddress
add wave -noupdate /addressfsm_tb/DUT/send
add wave -noupdate /addressfsm_tb/DUT/next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
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
WaveRestoreZoom {0 ps} {1348 ps}
