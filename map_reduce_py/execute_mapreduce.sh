#get files for testing
wget https://www.gutenberg.org/ebooks/20417.txt.utf-8
wget https://www.gutenberg.org/files/5000/5000-8.txt
wget https://www.gutenberg.org/files/4300/4300-0.txt


#create script file and write the python code
nano wc_mapper.py
nano wc_reducer.py

#add execution permission
chmod +x wc_mapper.py wc_reducer.py

#test mapper
echo "foo foo quux labs foo bar quux" | $HOME/wc_mapper.py

#test mapper and reducer
echo "foo foo quux labs foo bar quux" | $HOME/wc_mapper.py | sort -k1,1 | $HOME/wc_reducer.py

#test with a lager file
cat 20417.txt.utf-8 | $HOME/wc_mapper.py

#send local file to HDFS
hdfs dfs -copyFromLocal 20417.txt.utf-8 /user/example1


cd /usr/lib/hadoop-mapreduce/
#execute jar in Hadoop
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -file $HOME/wc_mapper.py    -mapper $HOME/wc_mapper.py -file $HOME/wc_reducer.py   -reducer $HOME/wc_reducer.py -input /user/example1/20417.txt.utf-8 -output /user/example1/gutenberg-output


#hadoop-streaming-3.2.3.jar

 #hadoop jar /usr/lib/hadoop/hadoop-streaming.jar -file $HOME/mapper.py    -mapper $HOME/mapper.py \
#-file $HOME/reducer.py   -reducer $HOME/reducer.py \
#-input /user/ulises/5000-8.txt -output /user/ulises/wc_res 