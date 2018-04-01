zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 1 not-numeric
zstyle ':completion:*' prompt '%e'
zstyle :compinstall filename '/home/waterhouse/.zshrc'

autoload -Uz compinit
compinit


#### HISTORY ####

HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
HISTCONTROL=ignoredups

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

#### END HISTORY ####

setopt beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install



## APPEARANCE ##
autoload -U colors && colors

## EDITOR ##
# vim
if which vim &> /dev/null; then
	EDITOR='vim'
else
	EDITOR='vi'
fi
export EDITOR

## CALC ##
# zcalc > bc
autoload -U zcalc



source $HOME/.zsh/local.zsh
source $HOME/.zsh/os-specific.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/git.zsh
source $HOME/.zsh/prompt.zsh

if [ -z $(command -v ddate) ];then
   echo ''
else
   ddate
fi  
echo "$(w)"

