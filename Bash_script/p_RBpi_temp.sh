# raspberry pi hardware status monitoring
unset l_temp
declare -a l_temp    # 최대 크기는 2분으로 잡는다. 1 element/sec
                     # sh 파일을 반복해서 실행하는 경우에,
                     # 해당 변수가 초기화되지 않음에 유의한다.
echo initializing l_temp
echo l_temp : ${l_temp[@]}
echo number of elements : ${#l_temp[@]}


while :
do
#for ((i=0; i<=10; i++))
#do
#    echo $i
    sleep 0.5
    cur_temp=$(vcgencmd measure_temp|grep -Po "temp=\K[0-9\.]+")
    #cur_temp=$(awk '{print $1}' <<<"${tmp}")
    l_temp+=("$tmp")

    cur_temp=${l_temp[0]}
    echo temperature: $tmp
    echo num of elements : ${#l_temp[@]}

    if [ ${#l_temp[@]} -ge 3 ]
        then
	unset l_temp[2]
	unset l_temp[0]    # array의 첫번째 원소를 지우면 문제가 발생한다.
	echo maintaining num of elements
        echo maintained nb : ${#l_temp[@]}
    else
	echo appending
    fi
done

