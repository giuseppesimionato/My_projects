UART INTERFACE WITH A FIR FILTER ON AN FPGA
-------------------------------------------

This report presents the implementation of an UART (Universal
Asynchronous Receiver-Transmitter) interface combined with a FIR (Finite
Impulse Response) Filter on an FPGA (Filed-Programmable Gate Array). The
FPGA is an Integrated Circuit designed to be configured after
manufacturing, for this reason the term \`field-programmable'. It is
composed by an array of logic blocks that can be reprogrammed: each
block is individually programmed to perform a logic function. It is
composed also by reconfigurable interconnections that allow the
different blocks to be wired together to create different
configurations. The device can be designed with the hardware description
language VHDL (Very High Speed Integrated Circuit Hardware Description
Language). The use of FPGA components has some advantages over ASICs
(Application Specific Integrated Circuits): they are in fact standard
devices whose functionality to be implemented is not set by the
manufacturer, who can therefore produce on a large scale at a low price.
Their generic nature makes them suitable for a large number of
applications in the consumer, communications, automotive and other
sectors. They are programmed directly by the end user, displaying design
times, verification by simulations and field testing of the application.
So, the big advantage over ASICs is that they allow the end user to make
any change or correct errors simply by reprogramming the device at any
time.
