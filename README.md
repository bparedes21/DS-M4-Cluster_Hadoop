##### 1. Crear red para el cluster de hadoop

```
sudo docker network create --driver=bridge hadoop
```

##### 2. Inicializar el cluster 

```
cd DS-M4-Cluster_Hadoop 
sudo ./start-container.sh 
```
#### El comando anterior ejecuto de la siguiente manera:

```

sudo docker rm container(borrar c/u)
sudo docker pull uracilo/hadoop (descarga)
sudo docker images 
sudo docker network create --driver=bridge hadoop

(mofificacion de start-container)

ejecutar:
sudo chmod 666 start-container.sh
sudo sh start-container


  
```
#### detalles:
```
ls -ll (lista los directorios o archivos)
1-nano o 2-vi (editores)
en windows los script son .bath

```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
root@hadoop-master:~# 
```
- Iniciar con 2  esclavos y un maestro
- Entraremos al contenedor master

##### 3. Iniciar hadoop

```
./start-hadoop.sh
```
#### El comando anterior ejecuto de la siguiente manera:

```
sudo docker stop hadoop-slave2
sudo docker rm hadoop-slave2

chmod 777 start-hadoop.sh
./start-hadoop.sh
```
##### 4. Un archivo txt de un libro

```
wget https://raw.githubusercontent.com/uracilo/testdata/master/odisea.txt
```

##### 5. Crear un directorio

```
mkdir input
```

##### 6. Crear un archivo tipo tar.gz

```
tar -czvf input/odisea.tar.gz odisea.txt
```

-c: Generar archivo
-z: Comprimir con gzip.
-v: Progreso del proceso.
-f: Especificar nombre del archivo.


##### 7. Revisar los tamaños de nuestros archivos

```
ls -flarts input
```
##### 8. Crear y mover  directorio input al DFS de  HADOOP

```
hdfs dfs -mkdir -p test
hdfs dfs -put input
```

##### 9. Revisar nuestro input directorio en HADOOP

```
hdfs dfs –ls  input
```

##### 10. Leer las primeras lineas de nuestro archivo en HADOOP

```
hdfs dfs -cat  input/odisea.tar.gz | zcat | tail -n 20
```

##### 11. Eliminar el archivo en HADOOP

```
hdfs dfs –rm –f /user/rawdata/example/odisea.tar.gz
```

##### Plus ejecutar un trabajo en HADOOP

```
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output
```

##### Plus ver el resultado del trabajo en HADOOP

```
hdfs dfs -cat output/part-r-00000
```

Inspirado en https://github.com/kiwenlau/hadoop-cluster-docker
