#########################################
#				                        #
#	 	PROMPT       	                #
# 					                    #
#########################################

YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
RESET_COLOR="%{$reset__color%}"


# Echoes a username/host string when connected over SSH (empty otherwise)
function ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '$CYAN%n$YELLOW@$CYAN%m$YELLOW' || echo '$CYAN%n$YELLOW@$CYAN%m$YELLOW' # echo '$CYAN'
}

function prompt_funk() {
	echo "$(ssh_info) %~$CYAN $(git_info)%(?.%{$fg[yellow]%}.%{$fg[yellow]%})%(!.#.❯)%{$reset_color%} "
}

PROMPT=$(prompt_funk)

# Date and time on the right
RPROMPT="%{$fg_bold[cyan]%}[$(date +"%a %m/%d") %t]%{$reset_color%}"

autoload -U add-zsh-hook
add-zsh-hook chpwd update_prompt
add-zsh-hook precmd update_prompt
function update_prompt() {
	PROMPT=$(prompt_funk)
}

##### END PROMPT #####
