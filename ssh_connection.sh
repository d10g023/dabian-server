#!/bin/bash

echo "IP da maqina"
read ip

echo "User da maquia"
read user

clear
echo "A conectar à maquina de destino"
while true
do
        #Ping à maquina
        ping $ip -c 1 -w 1 > /dev/null

        #Se for possivel pingar a maquina vai fazer a conexão ssh
        if [ $? -eq 0 ]
        then
                ssh $user@$ip
                #Se a conexão for bem sucedida o script vai parar       
                if [ $? -eq 0 ]
                then
                        break
                fi
        fi
        sleep 1
done
