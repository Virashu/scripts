#!/bin/sh

# Control variable
# Possible values: NONE, FULL, LOW, CRITICAL
last="NONE"
last_status="Discharging"

# Default values for LOW/CRITICAL status
low=20
critical=15
delay=5

while true; do

  # If battery is plugged, do stuff
  battery="/sys/class/power_supply/BAT1"
  if [ -d $battery ]; then

    capacity=$(cat $battery/capacity)
    status=$(cat $battery/status)
		
		if [ "$status" != "$last_status" ]; then
			notify-send -t 1000 "$status"
			last_status=$status
		fi

    # If battery full and not already warned about that
    if [ "$last" != "FULL" ] && [ "$status" = "Full" ]; then
      notify-send -t 1000 "Battery full"
      last="FULL"
    fi

    # If low and discharging
    if [ "$last" != "LOW" ] && [ "$status" = "Discharging" ] && \
       [ $capacity -le $low ] && [ $capacity -gt $critical ]; then
      notify-send -t 2000 "Battery low: $capacity%"
      last="LOW"
    fi

    # If critical and discharging
    if [ "$status" = "Discharging" ] && [ $capacity -le $critical ]; then
      notify-send -u critical -t 2000 "Battery very low: $capacity%"
      if [ $critaware -eq 1 ]; do
        pkill picom
        pkill komorebi
      fi
      last="CRITICAL"
    fi
  fi
	#last_status=$status
  sleep $delay
done
