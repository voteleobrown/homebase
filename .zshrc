# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 1 not-numeric
zstyle ':completion:*' prompt '%e'
zstyle :compinstall filename '/home/waterhouse/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=250
SAVEHIST=250
setopt beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install



### Waterhouse Custom ###
autoload -U colors && colors

## APPEARANCE ##
zle_highlight=(default:bold) 				# PROMPT BOLD BY DEFAULT
## KEY BINDINGS ##


## PROMPT ##

# If running with privileges, make the username red, otherwise white. 
if (( EUID != 0 )); then

	PROMPT="%{$fg[cyan]%}%n  %{$fg[white]%}%~ >>%{$reset__color%}"
else
	PROMPT="%{$fg[red]%]%n %{$fg[white]%}%~ >>%{reset_color%}"
fi

# Date and time on the right
RPROMPT="%{$fg[cyan]%}$(date +"%a %m/%d") %t %{$reset_color%}"

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


#########################################
#					#
# 		ALIASES 		#
#					#
#########################################


## Networking ##
alias ping='ping -c 5'				# Hit me 5 times
alias fastping='ping -c 100 -s.2'		# Go fast
alias wtfismyip='wget -qO - https://wtfismyip.com/text'
alias ipinfo='echo "wget -qO - https://ipinfo.io/<ip>"'

##  Network Security ##
alias ipfailedtoroot='grep "Failed password for root from" /var/log/authlog | cut -d " " -f 11 | sort | uniq -c | more'
alias ipfailedinvusr='grep "Failed password for invalid user" /var/log/authlog | cut -d " " -f 13 | sort | uniq -c | more'
alias listening='netstat -na -f inet | grep LISTEN'
alias listen2ssh='tcpdump port 22 and host not ' 		# ex. "listen2ssh <your own connected ip>" - watch ssh traffic that isn't you.
alias invaliduserlist='cat /var/log/authlog | grep "sshd.*Invalid" | more'
alias sshsuccesslist='cat /var/log/authlog | grep "sshd.*Accepted" | more'

## System ##
alias top10ram='ps aux | sort -rnk 4 | head'
alias process='ps ax | grep -v grep | grep '
alias timestamp='date "+%Y%m%d%H%M%S"'
alias HUP='kill -HUP '


## Sourcing ##
alias reprof='. ~/.profile'
alias retmux='. ~/.tmux.conf'


## Preferred Switches ##

alias tmux='tmux -u'				# UTF-8 mode
alias su='su -'					# Adopt user shell
alias wget='wget -c'				# Resume by default
alias ls='ls -F'

## Alternative Commands ##
alias del='yes | rm -r'

# Keep it short
alias c='clear'
alias h='history'
alias j='jobs'
alias t='date +"%r %Z"'
alias q='exit'

# Quick chmod ;-) [from strcat.de/dotfiles/dot.zshaliases]
alias rw-='chmod 600'
alias r--='chmod 644'
alias rwx='chmod 700'
alias r-x='chmod 755'

# Quick cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gb='cd --'				# "Go back."
alias wwi='cd -'				# "Where was I?"


# ls shortcuts
alias lad='ls -d -- .*(/)'				# Only show dot-directories
alias lsa='ls -a -- .*(.)'				# Only show dot-files
alias lsd='ls -d -- *(/)'				# Only show directories
alias lse='ls -ld -- (*/^F)'				# Only show empty directories
alias lsen='ls -d *(/om[1])'				# Newest directory
alias lsx='ls -l -- *(*) | head $@ @&> /devl/null'	# Only show executables
