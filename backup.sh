#!/bin/bash
# # # # # # Calidad # # # # # 
# Dependencies

# apt-get install lolcat -y
# apt-get install figlet -y
# apt-get install nodejs -y
# apt-get install npm -y
# npm i pm2 -g


RED="31"
GREEN="32"
PURPLE="95"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"
LIGHPURPLE="\e[1;${PURPLE}m"

# # # # # # # # # # # # # # # # # # # # # # # # # 

# Banner
figlet MOVE-SFTP | lolcat
echo "===================="
echo "      Calidad" | lolcat
echo "===================="
# Variables
namescript=ScriptCalidad
repet=/home/steven/backup.sh
rutaOrigen=/mnt/point/sftp/Calidad/Calidad/Carga/
rutaDestino=/mnt/point/sftp/Calidad/Calidad/Descarga/
fichero=/mnt/point/sftp/Calidad/Calidad/Carga/*

#cd /mnt/point/sftp/Calidad/Calidad/Carga/
documents=`ls /mnt/point/sftp/Calidad/Calidad/Carga/ | wc -l | awk '{print $1}'`;

for filename in `ls $rutaOrigen`; 
	do 
	if [ -f $rutaDestino$filename ];
then
	echo "Enviando $documents documentos a ${BOLDGREEN}Descarga${ENDCOLOR}"
	mv "$rutaOrigen$filename" "${rutaOrigen}01_${filename}"
	mv "${rutaOrigen}01_${filename}" "${rutaDestino}01_${filename}"
	sh $repet 
	sh $repet
	sh $repet 
	sh $repet 
	sh $repet 
	chattr +a $rutaDestino$filename*
	echo "$(date +%F_%H-%M-%S) |creator:"$USER" | script:$namescript | se pasaron $documents  archivos a la ruta indicada $rutaDestino"  >> /var/log/logs_carga.txt
else
	echo "No, no existe $filename enviando archivo a $rutaDestino --> cantidad $document"
	mv "$rutaOrigen$filename" "$rutaDestino"
	chattr +a $rutaDestino$filename*
	echo "$(date +%F_%H-%M-%S) |creator:"$USER"| script:$namescript | se pasaron $documents  archivos a la ruta indicada $rutaDestino"  >> /var/log/logs_carga.txt
fi
	done





