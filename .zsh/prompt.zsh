#########################################
#				                        #
#	 	PROMPT       	                #
# 					                    #
#########################################

YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
RESET_COLOR="%{$reset__color%}"


function prompt_funk() {
	echo "$CYAN%n$YELLOW@$CYAN%m$YELLOW %~$CYAN $(git_info)%(?.%{$fg[blue]%}.%{$fg[red]%})%(!.#.❯)%{$reset_color%} "
}

PROMPT=$(prompt_funk)

# Date and time on the right
RPROMPT="%{$fg_bold[cyan]%}[$(date +"%a %m/%d") %t]%{$reset_color%}"

autoload -U add-zsh-hook
add-zsh-hook chpwd update_prompt
function update_prompt() {
	PROMPT=$(prompt_funk)
}

##### END PROMPT #####
