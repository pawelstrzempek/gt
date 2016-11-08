set_property IOSTANDARD LVCMOS18 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {LED[0]}]
set_property PACKAGE_PIN U14 [get_ports {LED[7]}]
set_property PACKAGE_PIN U19 [get_ports {LED[6]}]
set_property PACKAGE_PIN W22 [get_ports {LED[5]}]
set_property PACKAGE_PIN V22 [get_ports {LED[4]}]
set_property PACKAGE_PIN U21 [get_ports {LED[3]}]
set_property PACKAGE_PIN U22 [get_ports {LED[2]}]
set_property PACKAGE_PIN T21 [get_ports {LED[1]}]
set_property PACKAGE_PIN T22 [get_ports {LED[0]}]
set_property PACKAGE_PIN Y9 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

create_clock -period 10.000 -name CLK -waveform {0.000 5.000}



create_clock -period 20.000 -name clk_sgn -waveform {0.000 10.000} [get_nets clk_out1]
