#!/usr/bin/zsh
###############################
# Author: Virgilio Murillo Ochoa
# Date: 31/October/2021 - Sunday
# personal github: Virgilio-AI
# linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# contact: virgiliomurilloochoa1@gmail.com
# #########################################

function binCheck(){
	if (( $# < 2 )); then
		print "usage: binCheck <integer> <string>"
		exit -1
	fi
	line=$2
	idx=$1
	if [[ "${line:$idx:1}" == "_" ]]
	then
		for (( i=1; i<5; i++ )); do
			if [[ "${line:$((idx - i)):1}" != "0" && "${line:$((idx - i)):1}" != "1" || "${line:$((idx + i)):1}" != "0" && "${line:$((idx + i)):1}" != "1" ]]
						then
							return 1
			fi
		done
		return 0
	else
		return 1
	fi
}
# main program

Name=$1 ;
FileName="$Name".asm ;
outFile="$Name"_out.asm ;
touch $FileName ;
# the variable that will contain all the text in the file
FileContent=""


for line in "${(@f)"$(<$FileName)"}"
	{
		for (( i=0; i<${#line}; i++ )); do
			if ( ! binCheck $i "$line" ); then
				printf "${line:$i:1}" >> $outFile
				FileContent=$FileContent"${line:$i:1}"
			fi
		done
		FileContent=$FileContent"\n"
	}

echo $FileContent >> $outFile ; 
