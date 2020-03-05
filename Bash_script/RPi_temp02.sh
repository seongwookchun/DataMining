modula=3
lcnt=0    # to start from 1 in the loop
idx=-1    # to start from 0 in the loop
int_max_temp=0
f_avg=$(vcgencmd measure_temp|grep -Po [0-9.]+)
while :
do
    clear
    ((lcnt += 1))
    ((idx += 1))
    ((idx %= $modula))
    int_cur_temp=$(vcgencmd measure_temp|grep -Po [0-9.]+)
    l_temp[$idx]=$int_cur_temp

    tmp_if=$(( $((10 * ${int_cur_temp:0:2})) - $((10 * ${int_max_temp:0:2})) ))
    if [ $tmp_if -gt 0 ]
    then
        int_max_temp=$int_cur_temp
    fi
    ################################
    # printing temperature monitor #
    ################################

    # calculating plot bars
    #if int_max_temp=0; then;
    echo elapsed : $lcnt
    for ((i=0; i<modula; i++))
    do
        echo $i. ${l_temp[$i]}
    done
    
    ((avg+=${int_cur_temp:0:2}))
    $avg=$((10**9 * $avg / $lcnt))e-9

    echo avg: $avg
    
    sleep 1
done
