# 
#  AutoCommit multiple repos
#

sudo rsync -aAXv --delete ~/.config/ ~/Documents/GitRepos/dotFiles-AW/.config/
sudo rsync -aAXv --delete ~/.local/ ~/Documents/GitRepos/dotFiles-AW/.local/
sudo rsync -aAXv --delete ~/images/ ~/Documents/GitRepos/dotFiles-AW/images/
sudo rsync -AXv ~/Documents/GitRepos/installationGuide-AW/main.pdf ~/Documents/GitRepos/archiso-AW/airootfs/root/InstallationGuide.pdf

# sync all files first
rsync
cd $HOME/Documents/GitRepos
for f in *; do
	if [ -d "$f" ]; then
		cd $f
		git status | grep -q "deleted\|modified\|untracked files present"  ;
		if [ $? -eq 0 ] # if it found the words
		then
			st -T "floating" -g "=150x50+250+100" -e sh -c "lazygit " ;
		fi
		cd ..
	fi
done
