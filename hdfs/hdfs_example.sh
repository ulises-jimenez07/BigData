###################################################################
#Script Name	: Basic HDFS commands                                                                           
#Description	:                                                                                 
#Args           :                                                                                           
#Author       	: Ulises Jimenez                                                
#Email         	: ulises.jimenez07@gmail.com                                           
###################################################################


#example commands for HDFS

#list files in hsdfs
hdfs dfs -ls /

#create files and directories and move files from local to HDFS
echo "esto es un ejemplo" > mi_archivo.txt
hdfs dfs -ls /user/
hdfs dfs -mkdir /user/example1
hdfs dfs -copyFromLocal mi_archivo.txt /user/example1
hdfs dfs -ls /user/example1
hdfs dfs -get /user/example1/mi_archivo.txt

