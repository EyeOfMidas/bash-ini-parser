#!/usr/bin/env bash

#first you must source the bash-ini-parser library into your shell
. bash-ini-parser

#readini reads in the file
readini "config_example.ini"
echo "===Contents of main config==="
#get_sections will return a list of all the section headers in the file
for section in `get_sections`; do
	#get_keys will return a list of all the keys within a specified section
	keys=`get_keys "$section"`
	echo [$section]
	for key in $keys; do
		#get_value will return the value of a key within a section
		echo $key = `get_value "$key" "$section"`
	done
done

echo ""
echo "==Loaded from file main=="
#load section takes the keys and values under the section and creates them as vars
load_section "general"
echo var1 = $var1
echo var2 = $var2

#########################
#### MULTIPLE FILES: ####
#########################

#when you read in multiple files, you can add a canonical name to prevent
#collisions and specify exact files. Without using a name, the old values will be overwritten
readini "config2_example.ini" "pool"
echo ""
echo "===Contents of pool config==="
#switch_file will change which config file is being used
switch_file "pool"
for section in `get_sections`; do
	keys=`get_keys "$section"`
	echo [$section]
	for key in $keys; do
		echo $key = `get_value "$key" "$section"`
	done
done

echo ""
echo "==Loaded from file pool=="
#whatever file was switched to last will be the main file, until the end of the script
load_section "general"
echo var1 = $var1
echo var2 = $var2
