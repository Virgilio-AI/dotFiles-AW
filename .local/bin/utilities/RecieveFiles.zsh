#!/usr/bin/zsh
###############################
# Author: Virgilio Murillo Ochoa
# Date: 21/October/2021 - Thursday
# personal github: Virgilio-AI
# linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# contact: virgiliomurilloochoa1@gmail.com
# #########################################

# use the command dragon to get the location of the file we want to drag
input=$( dragon-drag-and-drop --target )

# create and array of strings for iterating for each file
IFS=$'\n' array=$( echo $input )

# for to copy all files into desired direction
for line in $array ; do
	# variable to store file or http or https
	location=$line[1,4]
	# the length of the variable
	length=${#line}
	echo $location
	echo $line
	echo $length


	if [[ $location == "file" ]]
	then
		cp -rfd $line[7,$length] .
	elif [[ $location == "http" ]]
	then
		wget $line
	fi
done

