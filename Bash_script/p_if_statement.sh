for ((i=0; i<10; i++))
do
    if [ $i -ge 5 ]
    then
        echo $i is greater or equal with 5
    else
        echo $i is less than 5
    fi
done
