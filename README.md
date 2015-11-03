# bash-ini-parser

Easy to use parser, designed to enable discovery

**Please look at *example.sh* to see how to use it**

##How to use the script##
Put the bash-ini-parser file somewhere your script can read it
in the script, source the file
```bash
. bash-ini-parser
```

###To load a config file###
```bash
readini "config.ini"
```


###To get a list of all the sections###
To get a list of all of the section headers, use
```bash
get_sections
```

Which will return a space-delimited list of the header names.

**NOTE:** header names cannot contain special characters with this version of the script

###To get a list of all the keys in a section###
To get a list of all the keys within a section, use
```bash
get_keys "section"
```
Which will return a space-delimited list of the keys within the section


###To get the value of a particular key within a section###
Use
```bash
get_value "key" "section"
```

Which will return the value of that key if it is found.


###Load section variables into namespace###
```bash
load_section "section"
```

This will put the assigned value inside a variable for each key for use in your script.
