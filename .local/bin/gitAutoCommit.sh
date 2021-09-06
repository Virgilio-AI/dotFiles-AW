# 
#  AutoCommit multiple repos
#

sudo rsync -aAXv --delete --exclude=.git ~/.config/ ~/Documents/GitRepos/dotFiles-AW/.config/
sudo rsync -aAXv --delete --exclude=.git ~/.local/ ~/Documents/GitRepos/dotFiles-AW/.local/
sudo rsync -aAXv --delete --exclude=.git ~/images/ ~/Documents/GitRepos/dotFiles-AW/images/
sudo rsync -AXv --exclude=.git ~/Documents/GitRepos/installationGuide-AW/main.pdf ~/Documents/GitRepos/archiso-AW/airootfs/root/InstallationGuide.pdf

# for zsh files and profile file


sudo rsync -AXv /etc/profile ~/Documents/GitRepos/archiso-AW/airootfs/root/etc/profile
sudo rsync -AXv /etc/profile ~/Documents/GitRepos/autoInstaller-AW/profile

# work to do after you have users
# sudo rsync -AXv $ZDOTDIR/.zshrc ~/Documents/GitRepos/archiso-AW/airootfs/root/etc/zsh/zshrc
sudo rsync -AXv $ZDOTDIR/  ~/Documents/GitRepos/autoInstaller-AW/zdotdir/
sudo rsync -AXv /etc/zsh/  ~/Documents/GitRepos/autoInstaller-AW/etcZdotdir/



# tasks = check if all folders exists, if not create them
# \ modify the autoinstaller so that all of the files get installed by default

# sync all files first
cd $HOME/Documents/GitRepos
for f in *; do
	if [ -d "$f" ]; then
		cd $f
		git status | grep -q "deleted\|modified\|untracked files present"  ;
		if [ $? -eq 0 ] # if it found the words
		then
			st -e sh -c "lazygit " ;
		fi
		cd ..
	fi
done
