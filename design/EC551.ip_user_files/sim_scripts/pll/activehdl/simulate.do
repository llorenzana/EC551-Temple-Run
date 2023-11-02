onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+pll  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.pll xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {pll.udo}

run 1000ns

endsim

quit -force
