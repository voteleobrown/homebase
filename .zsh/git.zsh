########################################
#                                      #
#			GIT	       #
#				       #
########################################

source ~/.zsh/git-prompt.sh

function gitit()
{
        echo "$(__git_ps1 " (%s)")"

}



#### END GIT ####
