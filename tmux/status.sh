#!/bin/sh
 battery=$(
for i in $BATTERIES;do 
  a=$(upower -i $i|grep "percentage:\|state:\|time");
  echo $a \
  | sed -e 's/state: //g' \
                -e 's/fully-charged/#\[bg=#1e1e1e,fg=#f02e6e\]/' \
                -e 's/discharging/#\[bg=#1e1e1e,fg=#f2b482\]/' \
                -e 's/charging/#\[bg=#1e1e1e,fg=#9ceb4f\]/' \
                -e 's/time to full: //' \
                -e 's/pending-charge//' \
                -e 's/time to empty: //' \
                -e 's/percentage: //' \
 | awk '{if (NF == 2) print  $0 ""; else print $1  $4 " "$2 substr($3,0,1)}';
                done)

 # battery_time=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1| awk ' NR==19{ if ($1 == "time") print "["$4 substr($5,0,1)"]" }')
 date="#[bg=#1e1e1e,fg=#63f2f1]"$(date +" "%d/%b)
 time="#[bg=#1e1e1e,fg=#62d196]"$(date +" "%H:%M)
 worktime="#[bg=#1e1e1e,fg=#f02e6e] "$($HOME/.config/env/dots/tmux/timer.sh -S)
 cpu=$(ps -aux | awk '{print $3}' | tail -n+2 | awk '{s+=$1} END {printf "#[fg=#ffe6b3,bg=#1e1e1e] %.1f%",s/'$(nproc)'}')
 # ram=$(free|awk 'NR==2{printf "#[bg=#1e1e1e,fg=#87dfeb] ɤ%.1f%",($3/$2)*100}')
 ram=$(free -m |awk 'NR==2{printf "#[bg=#1e1e1e,fg=#87dfeb] %.1f/%.1f",$3/1000,$2/1000}')
 storage=$(df / |awk 'NR==2{printf "#[bg=#1e1e1e,fg=#d4bfff] %.1f Gb",$4/1000000}')
echo -n $battery$battery_time$time$worktime$date$cpu$ram$storage
