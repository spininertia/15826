echo "Running FDNQ on dataset 0"
./fdnq.pl -q2 dataset0.dat

echo "Plotting correlation integral for dataset 0"
echo "set term png; set logscale x; set logscale y; set output'dataset0.png'; plot 'dataset0.dat.points' with linespoints" | gnuplot 
convert dataset0.png dataset0.pdf

echo "Running FDNQ on dataset 1"
./fdnq.pl -q2 dataset1.dat
echo "Plotting correlation integral for dataset 1"
echo "set term png; set logscale x; set logscale y; set output'dataset1.png'; plot 'dataset1.dat.points' with linespoints" | gnuplot 
convert dataset1.png dataset1.pdf

echo "Running FDNQ on dataset 2"
./fdnq.pl -q2 dataset2.dat
echo "Plotting correlation integral for dataset 2"
echo "set term png; set logscale x; set logscale y; set output'dataset2.png'; plot 'dataset2.dat.points' with linespoints" | gnuplot 
convert dataset2.png dataset2.pdf

echo "Running FDNQ on dataset 3"
./fdnq.pl -q2 dataset3.dat
echo "Plotting correlation integral for dataset 3"
echo "set term png; set logscale x; set logscale y; set output'dataset3.png'; plot 'dataset3.dat.points' with linespoints" | gnuplot 
convert dataset3.png dataset3.pdf

echo "Running FDNQ on dataset 4"
./fdnq.pl -q2 dataset4.dat
echo "Plotting correlation integral for dataset 4"
echo "set term png; set logscale x; set logscale y; set output'dataset4.png'; plot 'dataset4.dat.points' with linespoints" | gnuplot 
convert dataset4.png dataset4.pdf
