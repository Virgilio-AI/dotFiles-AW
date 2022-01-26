#!/usr/bin/zsh
###############################
# Author: Virgilio Murillo Ochoa
# Date: 25/January/2022 - Tuesday
# personal github: Virgilio-AI
# linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# contact: virgiliomurilloochoa1@gmail.com
# #########################################
setopt +o nomatch


# ==========================
# ========== sync the folders of arch water linux ======
# ==========================


sudo rsync -aAXv --delete --exclude=.git ~/.local/src/dwm/ ~/Documents/GitRepos/Arch-Water_programs/dwm/
sudo rsync -aAXv --delete --exclude=.git ~/.local/src/dmenu/ ~/Documents/GitRepos/Arch-Water_programs/dmenu/
sudo rsync -aAXv --delete --exclude=.git ~/.local/src/dwmblocks/ ~/Documents/GitRepos/Arch-Water_programs/dwmblocks/
sudo rsync -aAXv --delete --exclude=.git ~/.local/src/st/ ~/Documents/GitRepos/Arch-Water_programs/st/

# ==========================
# ========== dot files is better ======
# ==========================

sudo rsync -aAXv --delete --exclude={'.git','BraveSoftware','cfiles','Electron','google-chrome','libreoffice','qutebrowser','Udeler','GeoGebra','GIMP','inkscape','unity3d','unityhub','UnityHub','FreeCAD'} ~/.config/ ~/Documents/GitRepos/dotFiles-AW/.config/ ;
sudo rsync -aAXv --delete --exclude={'.git','Proteus 7 Professional'} ~/.local/ ~/Documents/GitRepos/dotFiles-AW/.local/ ;
sudo rsync -aAXv --delete --exclude=.git ~/images/ ~/Documents/GitRepos/dotFiles-AW/images/ ;
sudo rsync -aAXv --exclude=.git ~/Documents/GitRepos/installationGuide-AW/main.pdf ~/Documents/GitRepos/archiso-AW/airootfs/root/InstallationGuide.pdf ;

# for zsh files and profile file

# ==========================
# ========== sync auto archiso ======
# ==========================
sudo rsync -aAXv --delete ~/.config/zsh/ ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/zdotdir/ ; 
sudo rsync -aAXv --delete /etc/zsh/ ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/etcZdotdir/ ; 
sudo rsync -aAXv --delete /etc/profile ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/profile ;


# ==========================
# ========== sync the autoInstaller profile ======
# ==========================

sudo rsync -aAXv --delete ~/.config/zsh/ ~/Documents/GitRepos/autoInstaller-AW/zdotdir/ ; 
sudo rsync -aAXv --delete $ZDOTDIR ~/Documents/GitRepos/autoInstaller-AW/etcZdotdir/ ; 
sudo rsync -aAXv --delete /etc/profile ~/Documents/GitRepos/autoInstaller-AW/profile ; 




recurseFolder(){
	# :h for name only
	# :t for name with extension
	level=$2
	# echo "level is: $level"
	# use () instead of [[]] for some examples
	if (( level > 2 )) ;
	then
		return 0
	fi

	for file in $1/* ; do
		if [[ -d $file ]]
		then
			cd $file
			git status 2>&1 | grep -q "deleted\|modified\|untracked files present"  ;
			if [[ $? -eq 0 ]]
			then
				st -T "floating" -g "=150x49" -e zsh -c "lazygit " ;
			else
				recurseFolder $file $((level+1))
				level=$((level - 1))
				# echo "end recurse"
			fi
		fi
	done
}

folder=$HOME/Documents/GitRepos

recurseFolder $folder 0
