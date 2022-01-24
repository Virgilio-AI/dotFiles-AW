# so this is the pdf that will be used 
dialog --title "book printing utility" --yesno "Are you ready to start?" 15 50

if test -f "INPUT.txt"; then
	dialog --title "book printing utility" --msgbox "warning the INPUT.txt file exist, delete it first" 15 50
	exit 1
fi

if [[ $? == 1 ]]
then
	exit 1
fi

OUTPUT="INPUT.txt"
>$OUTPUT
dialog --stdout --title "Client Name" \
--backtitle "Setup" \
--inputbox "enter the number of pages" 0 0 >$OUTPUT
number=$(<$OUTPUT)
rm $OUTPUT

cadena="1"
if [[ $(( $number % 4 )) == 0 ]] 
then
	round=$number
else
	round=$(($number + 4 - $(($number%4)) ))
fi

for (( i = 2; i<= $round ; i++))
do
	if [[ $(( $i%4 )) ==  2 ]] || [[ $(( $i%4 )) == 3 ]]
	then
		tempint=$(($i + 1))
		if [[ $tempint -gt $number ]]
		then
			cadena+=",{}"
		else
			cadena+=",$tempint"
		fi
	elif [[ $(( $i%4 )) == 0 ]]
	then
		tempint=$(($i - 2))
		cadena+=",$tempint"
	else
		cadena+=",$i"
	fi
done
dialog --title "answer" --msgbox "$cadena" 50 50



# usage:
# sh bookPrinter.sh NameOfTargetDir.pdf
pdfjam $1 "$cadena" -o halfBook_$1
#echo $cadena


