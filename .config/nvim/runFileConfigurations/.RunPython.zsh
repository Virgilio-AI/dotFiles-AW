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
enableDiifParam=$3 # can be (y)es or (n)o
enableInput=$4

folder=.code-runner/$name
# set standar for enable input
if [[ $enableInput == "" ]]
then
	enableInput="Y"
fi
# use () instead of [[]] for some examples
if [[ $enableInput == "y" ]]
then
	enableInput="Y"
fi






# use () instead of [[]] for some examples
if [[ $IF == -1 ]]
then
	IF=0
	for (( i=1;i<200;i++ )); do
		file=$folder/.${name}_In${i}.txt
		file2=$folder/.${name}_Out${i}_Correct.txt
		# use () instead of [[]] for some examples
		if [[ -f $file2 ]]
		then
			enableDiifParam="y"
		fi
		if [[ -f $file2 ]]
		then
			IF=$((IF+1))
		else
			break
		fi
	done
fi

# use () instead of [[]] for some examples
if [[ $enableInput == "Y" ]]
then
	for (( i=1;i<=$IF;i++ )); do
		python ${name}.py < $folder/.${name}_In${i}.txt > $folder/.${name}_Out${i}.txt
	done
else
	for (( i=1;i<=$IF;i++ )); do
		python ${name}.py > $folder/.${name}_Out${i}.txt
	done
fi

echo "end of python running ================ "
# use () instead of [[]] for some examples
if [[ $enableDiifParam == "y" ]]
then
	echo " diff files: "
	errors="n"
	for (( i=1;i<=$IF;i++ )); do
		tempFile=$folder/.${name}_Out${i}.txt
		correctFile=$folder/.${name}_Out${i}_Correct.txt
		echo "===== $tempFile and $correctFile ====="
		diffVar=$(git diff --no-index $tempFile $correctFile)
		cpdiff $tempFile $correctFile
		# use () instead of [[]] for some examples
		if [[ $diffVar != "" ]]
		then
			errors="y"
		fi
	done
	# use () instead of [[]] for some examples
	if [[ $errors == "n" ]]
	then
		GREEN='\033[0;32m'
		BLUE='\033[0;34m'
		echo -e "${BLUE}+++++ ==== ${GREEN}Completed correctly ${BLUE} ===== +++++ "
	fi
else
	echo " outputOfTheFiles: "
	for (( i=1;i<=$IF;i++ )); do
		tmpOutFile=$folder/.${name}_Out${i}.txt
		echo "File $tmpOutFile : "
		cat $tmpOutFile
		echo " ================== "
	done
fi


