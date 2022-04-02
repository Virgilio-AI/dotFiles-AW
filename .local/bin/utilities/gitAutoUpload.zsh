#!/usr/bin/zsh
# ###############################
# # Author: Virgilio Murillo Ochoa
# # Date: 25/January/2022 - Tuesday
# # personal github: Virgilio-AI
# # linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# # contact: virgiliomurilloochoa1@gmail.com
# # #########################################
# setopt +o nomatch


# ==========================
# ========== sync the folders of arch water linux ======
# ==========================


rsync -aAXv --delete --exclude=.git ~/.local/src/dwm/ ~/Documents/GitRepos/Arch-Water_programs/dwm/
rsync -aAXv --delete --exclude=.git ~/.local/src/dmenu/ ~/Documents/GitRepos/Arch-Water_programs/dmenu/
rsync -aAXv --delete --exclude=.git ~/.local/src/dwmblocks/ ~/Documents/GitRepos/Arch-Water_programs/dwmblocks/
rsync -aAXv --delete --exclude=.git ~/.local/src/st/ ~/Documents/GitRepos/Arch-Water_programs/st/

# ==========================
# ========== dot files is better ======
# ==========================

rsync -aAXv --delete --exclude={'.git','BraveSoftware','cfiles','Electron','google-chrome','libreoffice','qutebrowser','Udeler','GeoGebra','GIMP','inkscape','unity3d','unityhub','UnityHub','FreeCAD'} ~/.config/ ~/Documents/GitRepos/dotFiles-AW/.config/ ;
rsync -aAXv --delete --exclude={'qutebrowser','.git','Proteus 7 Professional'} ~/.local/ ~/Documents/GitRepos/dotFiles-AW/.local/ ;
rsync -aAXv --delete --exclude=.git ~/images/ ~/Documents/GitRepos/dotFiles-AW/images/ ;
rsync -aAXv --exclude=.git ~/Documents/GitRepos/installationGuide-AW/main.pdf ~/Documents/GitRepos/archiso-AW/airootfs/root/InstallationGuide.pdf ;

# for zsh files and profile file

# ==========================
# ========== sync auto archiso ======
# ==========================
rsync -aAXv --delete ~/.config/zsh/ ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/zdotdir/ ; 
rsync -aAXv --delete /etc/zsh/ ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/etcZdotdir/ ; 
rsync -aAXv --delete /etc/profile ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/profile ;


# ==========================
# ========== sync the autoInstaller profile ======
# ==========================

rsync -aAXv --delete ~/.config/zsh/ ~/Documents/GitRepos/autoInstaller-AW/zdotdir/ ; 
rsync -aAXv --delete $ZDOTDIR ~/Documents/GitRepos/autoInstaller-AW/etcZdotdir/ ; 
rsync -aAXv --delete /etc/profile ~/Documents/GitRepos/autoInstaller-AW/profile ; 


commitToUpload(){
	nameOfFolder = $1
	# check if branch upload exists
	git branch | grep -q "upload"
	if [ $? -ne 0 ]
	then
		git branch upload
	fi


	# check if changes have been done
	git status 2>&1 | grep -q "deleted\|modified\|untracked files present"  ;
	if [[ $? -ne 0 ]]
	then
		# commit the doned changes to the branch upload
		return
	fi

	# backup all the content into tmp folder
	mkdir -p /tmp/ArchWater/gitAutoUpload/$nameOfFolder/ ;
	rsync -aAXv --delete --exclude=.git . /tmp/ArchWater/gitAutoUpload/$nameOfFolder/ ;


	# go to the upload branch
	git checkout upload
	git add .
	git commit -m "update"
	git push origin upload
	git checkout master


	# copy all the files to master ( all the previously created files)
	rsync -aAXv --exclude=.git /tmp/ArchWater/gitAutoUpload/$nameOfFolder/ . ;
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
				commitToUpload $file
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

echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
echo "==============================="
echo "The Main Program has started"
folder=$HOME/Documents/GitRepos

recurseFolder $folder 0

