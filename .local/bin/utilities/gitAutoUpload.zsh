#!/usr/bin/zsh
# ###############################
# # Author: Virgilio Murillo Ochoa
# # Date: 25/January/2022 - Tuesday
# # personal github: Virgilio-AI
# # linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# # contact: virgiliomurilloochoa1@gmail.com
# # #########################################
#
#


# for configuring the main stuff
#
folder=$HOME/Documents/AutoUpdate
logFile=/tmp/utilities/gitAutoUpdate


# setopt +o nomatch



# ==========================
# ========== This section is personal for me ======
# ==========================

# ==========================
# ========== sync the folders of arch water linux ======
# ==========================
mkdir /tmp/utilities
touch /tmp/utilities/gitAutoUpdate

echo " # ========== sync the folders of arch water linux ====== " | tee -a $logFile
echo " # ========== sync the folders of arch water linux ====== " | tee -a $logFile
echo " # ========== sync the folders of arch water linux ====== " | tee -a $logFile
echo " # ========== sync the folders of arch water linux ====== " | tee -a $logFile
echo " # ========== sync the folders of arch water linux ====== " | tee -a $logFile

rsync -aAXv --delete --exclude=.git ~/.local/src/dwm/ $folder/Arch-Water_programs/dwm/ | tee -a $logFile
rsync -aAXv --delete --exclude=.git ~/.local/src/dmenu/ $folder/Arch-Water_programs/dmenu/| tee -a $logFile
rsync -aAXv --delete --exclude=.git ~/.local/src/dwmblocks/ $folder/Arch-Water_programs/dwmblocks/| tee -a $logFile
rsync -aAXv --delete --exclude=.git ~/.local/src/st/ $folder/Arch-Water_programs/st/| tee -a $logFile

# ==========================
# ========== dot files is better ======
# ==========================
#

echo " # ========== sync the folders of dot files ====== " | tee -a $logFile
echo " # ========== sync the folders of dot files ====== " | tee -a $logFile
echo " # ========== sync the folders of dot files ====== " | tee -a $logFile
echo " # ========== sync the folders of dot files ====== " | tee -a $logFile

rsync -aAXv --delete --exclude={'.git','BraveSoftware','cfiles','Electron','google-chrome','libreoffice','qutebrowser','Udeler','GeoGebra','GIMP','inkscape','unity3d','unityhub','UnityHub','FreeCAD'} ~/.config/ $folder/dotFiles-AW/.config/ | tee -a $logFile
rsync -aAXv --delete --exclude={'qutebrowser','.git','Proteus 7 Professional'} ~/.local/ $folder/dotFiles-AW/.local/ | tee -a $logFile
rsync -aAXv --delete --exclude=.git ~/images/ $folder/dotFiles-AW/images/ | tee -a $logFile
rsync -aAXv --exclude=.git $folder/installationGuide-AW/main.pdf $folder/archiso-AW/airootfs/root/InstallationGuide.pdf | tee -a $logFile

# for zsh files and profile file

# ==========================
# ========== sync auto archiso ======
# ==========================
#

echo " # ========== sync the archiso folders ====== " | tee -a $logFile
echo " # ========== sync the archiso folders ====== " | tee -a $logFile
echo " # ========== sync the archiso folders ====== " | tee -a $logFile
echo " # ========== sync the archiso folders ====== " | tee -a $logFile


rsync -aAXv --delete --exclude=out ~/.config/zsh/ $folder/archiso-AW/airootfs/root/autoInstaller-AW/zdotdir/ | tee -a $logFile
rsync -aAXv --delete --exclude=out /etc/zsh/ $folder/archiso-AW/airootfs/root/autoInstaller-AW/etcZdotdir/ | tee -a $logFile
rsync -aAXv --delete --exclude=out /etc/profile $folder/archiso-AW/airootfs/root/autoInstaller-AW/profile | tee -a $logFile


# ==========================
# ========== sync the autoInstaller profile ======
# ==========================
#
#



echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile
echo " # ========== sync the autoInstaller folders ====== " | tee -a $logFile

rsync -aAXv --delete ~/.config/zsh/ $folder/autoInstaller-AW/zdotdir/ | tee $logFile
rsync -aAXv --delete $ZDOTDIR $folder/autoInstaller-AW/etcZdotdir/ | tee $logFile
rsync -aAXv --delete /etc/profile $folder/autoInstaller-AW/profile | tee $logFile




# ==========================
# ========== this section is for everyone ======
# ==========================

commit(){
	git pull
	git add .
	git commit -m "auto update"
	git push
}


# this is the function to recurse the folder correctly
recurseFolder(){
	# :h for name only
	# :t for name with extension
	level=$2
	# echo "level is: $level"
	# use () instead of [[]] for some examples
	if (( level > 3 )) ;
	then
		return 0
	fi

	for file in $1/* ; do
		# check if the current iteration is a folder
		if [[ -d $file ]]
		then
			# cd into the folder
			cd $file
			# check if changes have been done
			git status 2>&1 | grep -q "deleted\|modified\|untracked files present"  ;
			if [[ $? -eq 0 ]]
			then
				# commit the doned changes to the branch upload
				commit $file
			else
				git status 2>&1 | grep -q "nothing to commit"  ;
				# use () instead of [[]] for some examples
				if [[ $? -eq 0 ]]
				then
					continue
				else
					recurseFolder $file $((level+1))
					level=$((level - 1))
					# echo "end recurse"
				fi
			fi
		fi
	done
}

echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder
echo "===============================" | tee -a $folder
echo "The Main Program has started" | tee -a $folder

recurseFolder $folder 0

