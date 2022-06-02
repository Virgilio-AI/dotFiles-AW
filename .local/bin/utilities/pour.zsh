#!/usr/bin/zsh
###############################
# Author: Virgilio Murillo Ochoa
# Date: 01/June/2022 - Wednesday
# personal github: Virgilio-AI
# linkedin: https://www.linkedin.com/in/virgilio-murillo-ochoa-b29b59203
# contact: virgiliomurilloochoa1@gmail.com
# web: virgiliomurillo.com
# #########################################



# home/folder
homeFolder=$1
# git/repo/folder
gitRepoFolder=$2

# for lazygit execution after ending the sync
lazygit=$3


# crate the folder for the logs

mkdir -p /tmp/water_linux/Log/
touch /tmp/water_linux/Log/pour.txt


# functions


function SyncFolder()
{
	src=$1
	target=$2
	mkdir -p ${target::-1} |& tee -a /tmp/water_linux/Log/pour.txt

	if [[ -d ${src::-1} ]]
	then
		rsync -aAXv $src $target |& tee -a /tmp/water_linux/Log/pour.txt
	fi
}









# --------------------------------------------------------------
# the actual code of the installation

# ==========================
# ========== Sync the .confi folder ======
# ==========================
# nvim:
# the first one has so much folders to ignore so will just create the folder here
mkdir -p $gitRepoFolder/.config/nvim |& tee /tmp/water_linux/Log/pour.txt
rsync -aAXv $homeFolder/.config/nvim/ $gitRepoFolder/.config/nvim/ |& tee -a /tmp/water_linux/Log/pour.txt

#
### the next ones we can use the function
#



# awesome:
SyncFolder $homeFolder/.config/awesome/ $gitRepoFolder/.config/awesome/
# mpd:
SyncFolder $homeFolder/.config/mpd/ $gitRepoFolder/.config/mpd/
# ncmpcpp:
SyncFolder $homeFolder/.config/ncmpcpp/ $gitRepoFolder/.config/ncmpcpp/
# neofetch:
SyncFolder $homeFolder/.config/neofetch/ $gitRepoFolder/.config/neofetch/
# ranger:
SyncFolder $homeFolder/.config/ranger/ $gitRepoFolder/.config/ranger/
# zsh:
SyncFolder $homeFolder/.config/zsh/ $gitRepoFolder/.config/zsh/



# ==========================
# ========== sync the .local files ======
# ==========================

# bin:
SyncFolder $homeFolder/.local/bin/ $gitRepoFolder/.local/bin/
# etc:
SyncFolder $homeFolder/.local/etc/ $gitRepoFolder/.local/etc/
# lib:

# suckless files
# dwm:
SyncFolder $homeFolder/.local/src/dwm/ $gitRepoFolder/.local/src/dwm/
# dwmblocks:
SyncFolder $homeFolder/.local/src/dwmblocks/ $gitRepoFolder/.local/src/dwmblocks/
# dmenu:
SyncFolder $homeFolder/.local/src/dmenu/ $gitRepoFolder/.local/src/dmenu/
# awesome:
SyncFolder $homeFolder/.local/src/awesome/ $gitRepoFolder/.local/src/awesome/
# st:
SyncFolder $homeFolder/.local/src/st/ $gitRepoFolder/.local/src/st/

# use () instead of [[]] for some examples
if [[ $lazygit == "lazygit" ]]
then
	cd $gitRepoFolder
	lazygit
fi
