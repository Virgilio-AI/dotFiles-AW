#lias Lines configured by zsh-newuser-install
	if [[ $list ]]
	then

	fi
HISTFILE=$XDG_HOME_CONFIG/zsh/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch notify

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
if [[ ${KEYMAP} == vicmd ]] ||
	[[ $1 = 'block' ]]; then
	echo -ne '\e[1 q'
elif [[ ${KEYMAP} == main ]] ||
	[[ ${KEYMAP} == viins ]] ||
	[[ ${KEYMAP} = '' ]] ||
	[[ $1 = 'beam' ]]; then
	echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rockhight/.config/.zshrc'

autoload -Uz compinit
# End of lines added by compinstall
#

compinit -d /$XDG_HOME_CONFIG/zsh/.zcompdump
#path variables
alias ls='ls -a --color=auto'
alias rm='rm -rfd'
alias cp='cp -r'
alias umount='umount -v'
alias mount='mount -v'
alias grep='grep --color'
alias lg="lazygit"
alias gitsa='git submodule add'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias cpd='pwd|pbcopy'
alias nv="nvim"
#alias pacman="sudo pacman"


# alias for pacman -> greping errors and warnings
alias tree='tree -a'
alias unrar='unrar e'
# for creating notebooks
alias create-notebook='python $HOME/.local/bin/create-notebook.py'
# alias for shutdown commiting all


pacman()
{
	# create the folder if it doesn't exists
	file=~/.personalMetadata
	if [[ ! -d $file ]]
	then
		mkdir $file
	fi

	# for getting all the installed packages automatically
	

	stri=$@
	list=("${(@s[ ])stri}")
	if [[ ${list[1]} == "-S" || ${list[1]} == "-Sy" ]]
	then
		echo "This is a file to download"
		for (( i=1;i<$#list ; i++)); do
			var=$((i + 1))
			echo "${list[$var]}"
			echo "${list[$var]}" >> $file/pacmanPackages.txt
		done

	fi

#	echo "$list" >> $file/pacmanPackages.txt
#	echo "$list"

	sudo pacman $@

}
paru()
{

	# create the folder if it doesn't exists
	file=~/.personalMetadata
	if [[ ! -d $file ]]
	then
		mkdir $file
	fi

	# for getting all the installed packages automatically
	

	stri=$@
	list=("${(@s[ ])stri}")
	if [[ ${list[1]} == "-S" || ${list[1]} == "-Sy" ]]
	then
		echo "This is a file to download"
		for (( i=1;i<$#list ; i++)); do
			var=$((i + 1))
			echo "${list[$var]}"
			echo "${list[$var]}" >> $file/paruPackages.txt
		done

	fi

#	echo "$list" >> $file/pacmanPackages.txt
#	echo "$list"

	command paru $@

}

shutdown()
{
# if number of parameters equal cero
	if [ $# -eq 0 ]  ; then 
		shutdown -c
		sh gitAutoCommit.zsh
		sudo shutdown
	else
		sudo shutdown $@
	fi
}

# commit all before reboot
reboot()
{
# if number of parameters equal cero
	if [ $# -eq 0 ]  ; then 
		sh gitAutoCommit.zsh
		sudo reboot
	else
		sudo reboot $@
	fi
}

####################################3 prompt 


parse_git_branch() {
    git_status="$(git status 2> /dev/null)"
    pattern="On branch ([^[:space:]]*)"
    if [[ ! ${git_status} =~ "(working (tree|directory) clean)" ]]; then
        state="*"
    fi
    if [[ ${git_status} =~ ${pattern} ]]; then
      branch=${match[1]}
      branch_cut=${branch:0:35}
      if (( ${#branch} > ${#branch_cut} )); then
          echo "(${branch_cut})…${state}"
      else
          echo "(${branch})${state}"
      fi
    fi
}

setopt PROMPT_SUBST
set -o GLOB_SUBST

# neofetch --gtk-shorthand off --gtk2 off --gtk3 off --color_blocks off
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## change sudo default editor
SUDO_EDITOR=/usr/bin/nvim
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR
export MANPAGER='nvim +Man!'


precmd() { print "" }
PROMPT='%S%F{green}%n%s%f%B%~%F{yellow} $(parse_git_branch)%f %F{red}$%f%b'



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
