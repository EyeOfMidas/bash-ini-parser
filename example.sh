. bash-ini-parser
readini config_example.ini

get_sections
get_keys general
get_value general var1

for section in `get_sections`; do
	keys=`get_keys "$section"`
	echo [$section]
	for key in $keys; do
		echo $key = `get_value "$section" "$key"`
	done
done

