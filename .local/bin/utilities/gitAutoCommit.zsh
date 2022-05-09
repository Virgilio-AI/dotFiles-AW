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


mkdir /tmp/utilities
touch /tmp/utilities/gitAutoCommit


sudo rsync -aAXv --delete --exclude=.git ~/.local/src/dwm/ ~/Documents/GitRepos/Arch-Water_programs/dwm/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete --exclude=.git ~/.local/src/dmenu/ ~/Documents/GitRepos/Arch-Water_programs/dmenu/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete --exclude=.git ~/.local/src/dwmblocks/ ~/Documents/GitRepos/Arch-Water_programs/dwmblocks/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete --exclude=.git ~/.local/src/st/ ~/Documents/GitRepos/Arch-Water_programs/st/ | tee -a /tmp/utilities/gitAutoCommit

# ==========================
# ========== dot files is better ======
# ==========================
echo "Dot FIles" | tee -a /tmp/utilities/gitAutoCommit
echo "Dot FIles" | tee -a /tmp/utilities/gitAutoCommit
echo "Dot FIles" | tee -a /tmp/utilities/gitAutoCommit
echo "Dot FIles" | tee -a /tmp/utilities/gitAutoCommit
echo "Dot FIles" | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete --exclude={'.git','BraveSoftware','cfiles','Electron','google-chrome','libreoffice','qutebrowser','Udeler','GeoGebra','GIMP','inkscape','unity3d','unityhub','UnityHub','FreeCAD'} ~/.config/ ~/Documents/GitRepos/dotFiles-AW/.config/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete --exclude={'qutebrowser','.git','Proteus 7 Professional'} ~/.local/ ~/Documents/GitRepos/dotFiles-AW/.local/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete --exclude=.git ~/images/ ~/Documents/GitRepos/dotFiles-AW/images/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --exclude=.git ~/Documents/GitRepos/installationGuide-AW/main.pdf ~/Documents/GitRepos/archiso-AW/airootfs/root/InstallationGuide.pdf | tee -a /tmp/utilities/gitAutoCommit
# for zsh files and profile file

# ==========================
# ========== sync auto archiso ======
# ==========================
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit
echo "zsh" | tee -a /tmp/utilities/gitAutoCommit

sudo rsync -aAXv --delete ~/.config/zsh/ ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/zdotdir/  | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete /etc/zsh/ ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/etcZdotdir/  | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete /etc/profile ~/Documents/GitRepos/archiso-AW/airootfs/root/autoInstaller-AW/profile | tee -a /tmp/utilities/gitAutoCommit


echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
echo "sync the autoInstaller profile" | tee -a /tmp/utilities/gitAutoCommit
# ==========================
# ========== sync the autoInstaller profile ======
# ==========================

sudo rsync -aAXv --delete ~/.config/zsh/ ~/Documents/GitRepos/autoInstaller-AW/zdotdir/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete $ZDOTDIR ~/Documents/GitRepos/autoInstaller-AW/etcZdotdir/ | tee -a /tmp/utilities/gitAutoCommit
sudo rsync -aAXv --delete /etc/profile ~/Documents/GitRepos/autoInstaller-AW/profile | tee -a /tmp/utilities/gitAutoCommit




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
		if [[ -d $file ]]
		then
			cd $file
			git status 2>&1 | grep -q "deleted\|modified\|untracked files present"  ;
			if [[ $? -eq 0 ]]
			then
				st -T "floating" -g "=150x49" -e zsh -c "lazygit " ;
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

folder=$HOME/Documents/GitRepos

recurseFolder $folder 0
