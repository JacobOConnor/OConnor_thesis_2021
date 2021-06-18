grep SCORE *.out | grep -v fa_rep | awk '{if (NF == 24) {print $2,$22,$23} else {print $2,$23,$24}}' | awk '{if ($3 >= 7) {print}}' >results_7hbonds.txt
grep SCORE *.out | grep -v fa_rep | awk '{if (NF == 24) {print $2,$22,$23} else {print $2,$23,$24}}' | awk '{if ($3 == 6) {print}}' >results_6hbonds.txt
grep SCORE *.out | grep -v fa_rep | awk '{if (NF == 24) {print $2,$22,$23} else {print $2,$23,$24}}' | awk '{if ($3 == 5) {print}}' >results_5hbonds.txt
grep SCORE *.out | grep -v fa_rep | awk '{if (NF == 24) {print $2,$22,$23} else {print $2,$23,$24}}' | awk '{if ($3 == 4) {print}}' >results_4hbonds.txt
grep SCORE *.out | grep -v fa_rep | awk '{if (NF == 24) {print $2,$22,$23} else {print $2,$23,$24}}' | awk '{if ($3 == 3) {print}}' >results_3hbonds.txt
grep SCORE *.out | grep -v fa_rep | awk '{if (NF == 24) {print $2,$22,$23} else {print $2,$23,$24}}' | awk '{if ($3 <= 2) {print}}' >results_2hbonds.txt
gnuplot -persist "gnuplot_script.txt"
