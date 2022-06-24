
#!/bin/bash

# Número default de nodos
N=${1:-3}


# Iniciar el contenedor de hadoop-master
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -dti --name hadoop-master  --net=hadoop  -P --hostname hadoop-master uracilo/hadoop  


# Inicializar el contenedor aprendiz o esclavo
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -dti --name hadoop-slave$i --net=hadoop -P --hostname hadoop-slave$i   uracilo/hadoop 
	i=$(( $i + 1 ))
done 

# Ingresar a nuestro contenedor master
sudo docker exec -it hadoop-master bash
