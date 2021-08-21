# 
#  AutoCommit multiple repos
#

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
