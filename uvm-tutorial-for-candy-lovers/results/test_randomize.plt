set xlabel "Number of 8b entires table"
set ylabel "CPU Time (sec)"

set term png
set output "test_randomize.png"
set title "Simulation Using Incisive 15.10, 64b"
plot "test_randomize.dat" using 1:2 with linespoints title "UVM Reg Randomize Time(Sec)", \
     "test_randomize.dat" using 1:3 with linespoints title "SRM Reg Randomize Time(Sec)"
