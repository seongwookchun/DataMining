echo '''$ my_array=(foo bar baz)'''
my_array=(foo bar baz)
echo '''$ echo ${my_array}'''
echo ${my_array}
echo '''$ echo ${my_array[@]}'''
echo ${my_array[@]}

echo '''$ my_array+=(55.0)'''
my_array+=(55.0)
echo ${my_array[@]}

echo
echo '''$ echo ${#my_array}'''
echo ${#my_array}
echo '''$ echo ${#my_array[@]}'''
echo ${#my_array[@]}

