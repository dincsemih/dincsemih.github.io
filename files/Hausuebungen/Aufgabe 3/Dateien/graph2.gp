set terminal png size 800,500
set output 'graph2.png'

red = "#641E16"; green = "#1ABC9C"; blue = "#154360"; grey = "#7B7D7D";
set yrange [0:160]
set style data histogram
set style histogram cluster gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set ylabel "Anzahl der Student:innen"
set ytics out nomirror
set tics font "Arial, 12"
set key font "Arial, 12"

set title "Geschlechterverteilung im Studium Informatik Wintersemester 2019/20"
plot "graph1.dat" using 3:xtic(1) title "Maenner Inland" linecolor rgb blue,   \
     "graph1.dat" using 2 title "Frauen Inland" linecolor rgb red,   \
     "graph1.dat" using 5 title "Maenner Ausland" linecolor rgb grey,    \
     "graph1.dat" using 4 title "Frauen Ausland" linecolor rgb green
     