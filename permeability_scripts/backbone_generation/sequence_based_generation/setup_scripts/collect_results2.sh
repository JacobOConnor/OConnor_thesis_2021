cd pdbs
rm parallel_tasks.txt
touch parallel_tasks.txt
for f in `cat arrangements.txt`;
do
	echo "cd $f/results && cp ../../setup_scripts/plotcisdata.sh . && cp ../../setup_scripts/gnuplot_script_cis.txt . && cp ` find /projects/boinc-results/cispro_b/ -name cispro_b*.all.out.bz2 | grep "${f}" ` . && rm *.all.out -f && bzip2 -d *.bz2 && ./plotcisdata.sh && mv energy_plot.png $f.png && cd ../.." >> parallel_tasks.txt
done
cd ..
cat pdbs/parallel_tasks.txt | parallel -j 4
