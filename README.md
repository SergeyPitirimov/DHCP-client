# DHCP-client
Dynamic host configuration protocol client on 100 Mb/s copper wire in VHDL.

Data flow consists of four steps:
1. Client sends broadcast DHCP DISCOVER packet.
2. Router answers with DHCP OFFER packet.
3. Client sends DHCP REQUEST packet to the router.
4. Router answers with DHCP ACKNOWLEDGE packet to the client.

Hardware requirements:
1. Ethernet copper wire connection rate is 100 Mb/s.
2. FPGA clock rate is 50 MHz.

Top level source file name is Trader.vhd. Top level testbench source file name is Trader_tb.vhd.

Implementation in programmable hardware consumes 12500 logic elements and 1610 registers.
