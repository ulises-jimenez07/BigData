###################################################################
#Script Name	:  How to install Sqoop in Ubunto 20.04                                                                        
#Description	:                                                                                 
#Args           :                                                                                           
#Author       	: Ulises Jimenez                                                
#Email         	: ulises.jimenez07@gmail.com                                           
###################################################################

#Get bin files for sqoop
wget https://archive.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.bin__hadoop-2.0.4-alpha.tar.gz
#Decompresss
tar -xvf sqoop-1.4.6.bin__hadoop-2.0.4-alpha.tar.gz
#Configure environment variables
echo export SQOOP_HOME=~/sqoop-1.4.6.bin__hadoop-2.0.4-alpha export PATH=$PATH:$SQOOP_HOME/bin>~/.bashrc
source ~/.bashrc
sudo cp /usr/lib/hive/conf/hive-site.xml $SQOOP_HOME/conf
sudo ln -s /usr/share/java/mysql-connector-java-8.0.27.jar $SQOOP_HOME/lib
cd $SQOOP_HOME/conf
mv sqoop-env-template.sh sqoop-env.sh
echo export HADOOP_COMMON_HOME=/usr/lib/hadoop > sqoop-env.sh
echo export HADOOP_MAPRED_HOME=/usr/lib/hadoop-mapreduce > sqoop-env.sh
echo export SQOOP_HOME=~/sqoop-1.4.6.bin__hadoop-2.0.4-alpha export PATH=$PATH:$SQOOP_HOME/bin>~/.bashrc
source ~/.bashrc


#Test sqoop connection
 sqoop list-databases --connect jdbc:mysql://34.75.67.253 --username sqoop_user --password Example123
sqoop import --connect jdbc:mysql://[Host]/[DataBase] --table  --username [User] --password [Password]