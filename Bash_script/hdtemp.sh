while :
do
    vcgencmd measure_temp
    vcgencmd measure_volts core
    sleep 1
    clear
done
