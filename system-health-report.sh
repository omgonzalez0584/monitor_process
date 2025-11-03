#! /bin/bash
#Este scrip genera un reporte del estado de salud del servidor

#Variables que capturan los comandos de monitoreo
fecha=$(date)
cpu=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
memoria=$(free -h | awk '/^Mem:/ {print "Total:",$2,"Used:", $3, "Free:", $4}')
space=$(df -h | grep  -v ^tmpfs)
host=$(hostname)
up=$(uptime)
top5=$(ps -aux | head -6 | awk '{print $3, $4, $11}')
file=reporte_$(date '+%Y%m%d%H%M%S').log


#Desplegando comandos de monitoreo
echo "===================================================" >> $file   
echo "Fecha de ejecucion: $fecha" >> $file
echo "===================================================" >> $file 
echo "Porcentaje de CPU: $cpu%" >> $file
echo "===================================================" >> $file
echo "Estado de la memoria" >> $file
echo "$memoria" >> $file
echo "===================================================" >> $file
echo "Espacio en disco" >> $file
echo "$space" >> $file
echo "===================================================" >> $file 
echo "Top 5 CPU y Memoria"  >> $file
echo "$top5" >> $file
echo "===================================================" 
echo "Hostname: $host" >> $file
echo "Uptime: $up" >> $file
echo "===================================================" >> $file

cat $file
mkdir -p Logs
mv $file Logs/


