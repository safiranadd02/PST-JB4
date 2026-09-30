## Clock signal (100 MHz - Pin W5)
set_property PACKAGE_PIN W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Input Data sw(7 downto 0) -> d(7 downto 0)
set_property PACKAGE_PIN V17 [get_ports {d[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[0]}]
set_property PACKAGE_PIN V16 [get_ports {d[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[1]}]
set_property PACKAGE_PIN W16 [get_ports {d[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[2]}]
set_property PACKAGE_PIN W17 [get_ports {d[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[3]}]
set_property PACKAGE_PIN W15 [get_ports {d[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[4]}]
set_property PACKAGE_PIN V15 [get_ports {d[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[5]}]
set_property PACKAGE_PIN W14 [get_ports {d[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[6]}]
set_property PACKAGE_PIN W13 [get_ports {d[7]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {d[7]}]

## Output Serial -> sout (led0 - Pin U16)
set_property PACKAGE_PIN U16 [get_ports sout]					
set_property IOSTANDARD LVCMOS33 [get_ports sout]

## Buttons
# btnC -> load (Tombol Tengah)
set_property PACKAGE_PIN U18 [get_ports load]						
set_property IOSTANDARD LVCMOS33 [get_ports load]
# btnU -> rst (Tombol Atas)
set_property PACKAGE_PIN T18 [get_ports rst]						
set_property IOSTANDARD LVCMOS33 [get_ports rst]