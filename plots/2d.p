set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Picking a new sorting 'magic number' (10000 char)"
set xlabel "magic number"
set ylabel "time (microseconds) "
set xr [1:255]
#set yr [200:8000]
set output "2d/char-smooth.svg"
plot 'data/2d/char.dat' using 1:2 title "descending" smooth bezier,\
     'data/2d/char.dat' using 1:3 title "ascending" smooth bezier,\
     'data/2d/char.dat' using 1:4 title "random" smooth bezier,\
     'data/2d/char.dat' using 1:5 title "sawtooth" smooth bezier,\
     'data/2d/char.dat' using 1:6 title "dithered" smooth bezier,\
     'data/2d/char.dat' using 1:7 title "organ pipe" smooth bezier

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Picking a new sorting 'magic number' (10000 unsigned long longs)"
set xlabel "magic number"
set ylabel "time (microseconds) "
#set xr [100:500]
#set yr [200:8000]
set output "2d/ull-smooth.svg"
plot 'data/2d/ull.dat' using 1:2 title "descending" smooth bezier,\
     'data/2d/ull.dat' using 1:3 title "ascending" smooth bezier,\
     'data/2d/ull.dat' using 1:4 title "random" smooth bezier,\
     'data/2d/ull.dat' using 1:5 title "sawtooth" smooth bezier,\
     'data/2d/ull.dat' using 1:6 title "dithered" smooth bezier,\
     'data/2d/ull.dat' using 1:7 title "organ pipe" smooth bezier

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Picking a new sorting 'magic number' (10000 ints)"
set xlabel "magic number"
set ylabel "time (microseconds) "
#set xr [100:500]
#set yr [200:8000]
set output "2d/int-smooth.svg"
plot 'data/2d/int.dat' using 1:2 title "descending" smooth bezier,\
     'data/2d/int.dat' using 1:3 title "ascending" smooth bezier,\
     'data/2d/int.dat' using 1:4 title "random" smooth bezier,\
     'data/2d/int.dat' using 1:5 title "sawtooth" smooth bezier,\
     'data/2d/int.dat' using 1:6 title "dithered" smooth bezier,\
     'data/2d/int.dat' using 1:7 title "organ pipe" smooth bezier

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Picking a new sorting 'magic number' (10000 char)"
set xlabel "magic number"
set ylabel "time (microseconds) "
set xr [1:255]
#set yr [200:8000]
set output "2d/char.svg"
plot 'data/2d/char.dat' using 1:2 title "descending" with lines,\
     'data/2d/char.dat' using 1:3 title "ascending" with lines,\
     'data/2d/char.dat' using 1:4 title "random" with lines,\
     'data/2d/char.dat' using 1:5 title "sawtooth" with lines,\
     'data/2d/char.dat' using 1:6 title "dithered" with lines,\
     'data/2d/char.dat' using 1:7 title "organ pipe" with lines

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Picking a new sorting 'magic number' (10000 unsigned long longs)"
set xlabel "magic number"
set ylabel "time (microseconds) "
#set xr [100:500]
#set yr [200:8000]
set output "2d/ull.svg"
plot 'data/2d/ull.dat' using 1:2 title "descending" with lines,\
     'data/2d/ull.dat' using 1:3 title "ascending" with lines,\
     'data/2d/ull.dat' using 1:4 title "random" with lines,\
     'data/2d/ull.dat' using 1:5 title "sawtooth" with lines,\
     'data/2d/ull.dat' using 1:6 title "dithered" with lines,\
     'data/2d/ull.dat' using 1:7 title "organ pipe" with lines

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Picking a new sorting 'magic number' (10000 ints)"
set xlabel "magic number"
set ylabel "time (microseconds) "
#set xr [100:500]
#set yr [200:8000]
set output "2d/int.svg"
plot 'data/2d/int.dat' using 1:2 title "descending" with lines,\
     'data/2d/int.dat' using 1:3 title "ascending" with lines,\
     'data/2d/int.dat' using 1:4 title "random" with lines,\
     'data/2d/int.dat' using 1:5 title "sawtooth" with lines,\
     'data/2d/int.dat' using 1:6 title "dithered" with lines,\
     'data/2d/int.dat' using 1:7 title "organ pipe" with lines

