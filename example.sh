. bash-ini-parser
readini "config_example.ini" "main"
readini "config2_example.ini" "pool"

echo "===Contents of main config==="
switch_file "main"
for section in `get_sections`; do
	keys=`get_keys "$section"`
	echo [$section]
	for key in $keys; do
		echo $key = `get_value "$section" "$key"`
	done
done
echo ""
echo "===Contents of pool config==="
switch_file "pool"
for section in `get_sections`; do
	keys=`get_keys "$section"`
	echo [$section]
	for key in $keys; do
		echo $key = `get_value "$section" "$key"`
	done
done

echo ""
echo "==Loaded from file main=="
switch_file "main"
load_section "general"
echo var1 = $var1
echo var2 = $var2

echo ""
echo "==Loaded from file pool=="
switch_file "pool"
load_section "general"
echo var1 = $var1
echo var2 = $var2
