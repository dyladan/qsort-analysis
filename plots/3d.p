set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set ztic auto
set title "Picking a new sorting 'magic number' (char)"
set xlabel "magic number"
set ylabel "array size"
set zlabel ""
#set xr [1:900]
set dgrid3d 30,30
set hidden3d
#set yr [200:8000]
set output "3d/char.svg"
splot 'data/3d/char.dat' using 1:2:3 title "descending" with lines,\
      'data/3d/char.dat' using 1:2:4 title "ascending" with lines,\
      'data/3d/char.dat' using 1:2:5 title "random" with lines,\
      'data/3d/char.dat' using 1:2:6 title "sawtooth" with lines,\
      'data/3d/char.dat' using 1:2:7 title "dithered" with lines,\
      'data/3d/char.dat' using 1:2:8 title "organ pipe" with lines

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set ztic auto
set title "Picking a new sorting 'magic number' (doubles)"
set xlabel "magic number"
set ylabel "array size"
set zlabel ""
#set xr [1:900]
set dgrid3d 30,30
set hidden3d
#set yr [200:8000]
set output "3d/double.svg"
splot 'data/3d/double.dat' using 1:2:3 title "descending" with lines,\
      'data/3d/double.dat' using 1:2:4 title "ascending" with lines,\
      'data/3d/double.dat' using 1:2:5 title "random" with lines,\
      'data/3d/double.dat' using 1:2:6 title "sawtooth" with lines,\
      'data/3d/double.dat' using 1:2:7 title "dithered" with lines,\
      'data/3d/double.dat' using 1:2:8 title "organ pipe" with lines

set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set ztic auto
set title "Picking a new sorting 'magic number' (ints)"
set xlabel "magic number"
set ylabel "array size"
set zlabel ""
#set xr [1:900]
set dgrid3d 30,30
set hidden3d
#set yr [200:8000]
set output "3d/int.svg"
splot 'data/3d/int.dat' using 1:2:3 title "descending" with lines,\
      'data/3d/int.dat' using 1:2:4 title "ascending" with lines,\
      'data/3d/int.dat' using 1:2:5 title "random" with lines,\
      'data/3d/int.dat' using 1:2:6 title "sawtooth" with lines,\
      'data/3d/int.dat' using 1:2:7 title "dithered" with lines,\
      'data/3d/int.dat' using 1:2:8 title "organ pipe" with lines

