########################################
#                                      #
#			GIT	       #
#				       #
########################################

function gitit()
{
	local VAR=1
	inside_git_repo="$(git rev-parse --is-inside-work-tree 2> /dev/null)"
	if [ "$inside_git_repo" ]; then
    		# This is a valid git repository (but the current working
    		# directory may not be the top level.
    		# Check the output of the git rev-parse command if you care)
    		echo '(git) '
	else
    		# this is not a git repository
    		echo ''
	fi
}

#### END GIT ####
