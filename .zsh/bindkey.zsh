########################
#                      #
#       BINDKEYS       #
#                      #
########################

# alt-x  : insert last command result
zmodload -i zsh/parameter
insert-last-command-output() {
   LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey '^[x' instert-last-command-output

# ctrl-space : print Git status
bindkey -s '^ ' ' git status --short^M'

# <ctrl-p> : git push
bindkey -s '^p' ' git push^M'
