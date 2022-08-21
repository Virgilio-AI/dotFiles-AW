#!/usr/bin/zsh
###############################
# Author: Virgilio Murillo Ochoa
# Date: 06/February/2022 - Sunday
# personal github: Virgilio-AI
# linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# contact: virgiliomurilloochoa1@gmail.com
# #########################################

name=$2
IF=$1
enableDiff=$3
enableInput=$4

folder=.code-runner/$name
for (( i=1;i<=IF;i++ )); do
	# use () instead of [[]] for some examples
	if [[ $enableInput == "y" ]]
	then
		nvim $folder/.${name}_In${i}.txt
	fi
	# use () instead of [[]] for some examples
	if [[ $enableDiff == "y" ]]
	then
		nvim $folder/.${name}_Out${i}_Correct.txt
	fi
done
