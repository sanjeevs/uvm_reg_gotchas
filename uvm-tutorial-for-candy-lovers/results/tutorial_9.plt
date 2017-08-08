set xlabel "Number of 8b  registers"
set ylabel "Memory MB used"
set logscale x

set term png
set output "tutorial_9.png"
set title "Simulation Using Incisive 15.10, 64b"
plot "tutorial_9.dat" using 1:2 with linespoints title "UVM Reg Memory Used(MB)", \
     "tutorial_9.dat" using 1:3 with linespoints title "SRM Reg Memory Used(MB)"

