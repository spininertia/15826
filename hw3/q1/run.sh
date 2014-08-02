#Q1
bin/hadoop fs -copyFromLocal reddit_titles /
#Q2
cd ngram
bash compile.sh
cd ..
#Q3
bin/hadoop jar ngram/WordCount.jar WordCount /reddit_titles /output0
bin/hadoop fs -copyToLocal /output0 .
wc -l output0/part-00000

#Q5
bin/hadoop jar ngram/NGram.jar NGram /reddit_titles /output1 2 100
bin/hadoop fs -copyToLocal /output1 .
wc -l output1/part-00000

#Q6
sort -nrk 3 output1/part-00000 | head -n 20 

#Q7
bin/hadoop jar ngram/NGram.jar NGram /reddit_titles /output2 3 20
bin/hadoop fs -copyToLocal /output2 .
wc -l output2/part00000 

#Q8
sort -nrk 4 output2/part00000 | head -n 20
