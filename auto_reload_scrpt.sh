#!/bin/bash

# Executa o 'flutter run' em segundo plano
flutter run &

# Echo e sleep em primeiro plano
echo "Sleeping for 20s"
sleep 20


export DISPLAY=:0
# Loop que executa após o sleep de 20s
for i in 1 2 3 4 5
do
    xdotool key 'r'
    sleep 2
done