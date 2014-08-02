
echo "Running 80/20 multifractal generation code"
python multifract2.py > mf2.dat

echo "Plotting the histogram of the 80/20 data"
echo "set term png; set output 'mf2.png';set style data histogram; set style histogram clustered gap 1; set style fill solid 0.1 border;set nokey; set xlabel 'time'; set ylabel '# disk access'; plot 'mf2.dat' using 2" | gnuplot
convert mf2.png mf2.pdf

echo "Running 70/20/10 multifractal generation code"
python multifract3.py > mf3.dat

echo "Plotting the histogram of the 70/20/10 data"
echo "set term png; set output 'mf3.png';set style data histogram; set style histogram clustered gap 1; set style fill solid 0.1 border; set nokey; set xlabel 'time'; set ylabel '# disk access'; plot 'mf3.dat' using 2" | gnuplot
convert mf3.png mf3.pdf

echo "Running FDNQ on the 80/20 multifractal "
./fdnq.pl  -q2 -h -r1 -R3000 mf2.dat

echo "Plotting the correlation integral of the 80/20, using FDNQ"
echo "set term png; set logscale x; set logscale y; set output'mf2_cr.png'; plot 'mf2.dat.points' with linespoints" | gnuplot
convert mf2_cr.png mf2_cr.pdf

echo "Running FDNQ on the 70/20/10 multifractal "
./fdnq.pl  -q2 -h -r1 -R3000 mf3.dat

echo "Plotting the correlation integral of the 70/20/10, using FDNQ"
echo "set term png; set logscale x; set logscale y; set output'mf3_cr.png'; plot 'mf3.dat.points' with linespoints" | gnuplot
convert mf3_cr.png mf3_cr.pdf

echo "Computing the exact correlation integral for the 80/20 multifractal "
python correlation_integral.py mf2.dat

echo "Plotting the exact correlation integral of the 80/20"
echo "set term png; set logscale x; set logscale y; set output'mf2_cr_exact.png'; plot 'mf2.dat.point' with linespoints" | gnuplot
convert mf2_cr_exact.png mf2_cr_exact.pdf

echo "Computing the exact correlation integral for the 70/20/10 multifractal "
python correlation_integral.py mf3.dat

echo "Plotting the exact correlation integral of the 70/20/10"
echo "set term png; set logscale x; set logscale y; set output'mf3_cr_exact.png'; plot 'mf3.dat.point' with linespoints" | gnuplot
convert mf3_cr_exact.png mf3_cr_exact.pdf
