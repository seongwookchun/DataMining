
# raspberry pi hardware status monitoring
unset l_temp
declare -a l_temp    # 최대 크기는 2분으로 잡는다. 1 element/sec
                     # sh 파일을 반복해서 실행하는 경우에,
                     # 해당 변수가 초기화되지 않음에 유의한다.
unset l_voltage
declare -a l_voltage

echo initializing l_temp
echo l_temp : ${l_temp[@]}
echo l_voltage : ${l_voltage[@]}
echo number of elements : ${#l_temp[@]}


while :
do
    sleep 0.5
    clear

    cur_temp=$(vcgencmd measure_temp|grep -Po "temp=\K[0-9\.]+")
    cur_voltage=$(vcgencmd measure_volts core|grep -Po "volt=\K[0-9\.]+")
    #cur_temp=$(awk '{print $1}' <<<"${tmp}")
    echo cur_temp : "$cur_temp" C
    l_temp+=("$cur_temp")
    echo cur_voltage : "$cur_voltage" V
    l_voltage+=("$cur_voltage")

    echo l_temp :
    echo "${l_temp[@]}"
    echo l_volt :
    echo ${l_voltage[@]}

    $avg_temp=
    echo avg_temp : $avg_temp
    #echo num of elements : ${#l_temp[@]}

    if [ ${#l_temp[@]} -ge 3 ]
        then
	l_temp=("${l_temp[@]:1}")
        l_voltage=("${l_voltage[@]:1}")
	#echo maintaining num of elements
        #echo maintained nb : ${#l_temp[@]}

    else
	echo appending
    fi

done

