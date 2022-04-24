set terminal png size 1000,480
set output "graph1.png"
set key top left outside horizontal autotitle columnhead
set title "Geschlechterverteilung im Studium Informatik Sommersemester 2020/21"

set xtics nomirror scale 0

set ylabel "Anzahl der Student:innen"
set ytics out nomirror

set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"

set style data histogram
set style histogram rowstacked
set style fill solid border -1
set boxwidth 0.75

 plot "graph1.dat" using 2:xtic(1) title "Frauen Inland",   \
    "graph1.dat" using 3 title "Maenner Inland",   \
     "graph1.dat" using 4 title "Frauen Ausland",    \
     "graph1.dat" using 5 title "Maenner Ausland"    
     