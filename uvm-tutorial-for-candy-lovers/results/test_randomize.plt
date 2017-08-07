set xlabel "Number of 8b entires table"
set ylabel "CPU Time (sec)"

set term png
set output "test_randomize.png"
plot "test_randomize.dat" using 1:2 with linespoints title "Randomize time in Incisive 15.10, 64b Simulator"
