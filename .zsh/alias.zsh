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

alias ipfailedtoroot='grep "Failed password for root from" $zshrc_auth_log_path | cut -d " " -f 11 | sort | uniq -c | more'
alias ipfailedinvusr='grep "Failed password for invalid user" $zshrc_auth_log_path | cut -d " " -f 13 | sort | uniq -c | more'
alias listening='netstat -na -f inet | grep LISTEN'
alias listen2ssh='tcpdump port 22 and host not ' 		# ex. "listen2ssh <your own connected ip>" - watch ssh traffic that isn't you.
alias invaliduserlist='cat $zshrc_auth_log_path | grep "sshd.*Invalid" | more'
alias sshsuccesslist='cat $zshrc_auth_log_path | grep "sshd.*Accepted" | more'

## System ##
alias top10ram='ps aux | sort -rnk 4 | head'
alias process='ps aux | grep -v grep | grep '
alias timestamp='date "+%Y%m%d%H%M%S"'
alias HUP='kill -HUP '


## Sourcing ##
alias reprof='. ~/.profile && echo "Resourcing .profile"'
alias rezsh='.  ~/.zshrc && echo "Resourcing .zshrc"'

## Preferred Switches ##

alias tmux='tmux -u'				# UTF-8 mode
alias su='su -'					# Adopt user shell
alias wget='wget -c'				# Resume by default
alias ls='ls -F'

## Alternative Commands ##
alias del='yes | rm -r'
alias cp='cp -r'

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

#### END ALIASES ####
