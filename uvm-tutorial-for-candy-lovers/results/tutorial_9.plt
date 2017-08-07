set xlabel "Number of 8b  registers"
set ylabel "Memory MB used"
set logscale x

set term png
set output "tutorial_9.png"
plot "tutorial_9.dat" using 1:2 with linespoints title "Memory Used in Incisive 15.10, 64b Simulator"
