#########################################
#                                       #
#              OS SPECIFIC              #
#                                       #
#########################################

if [ $OSTYPE = "linux-gnu" ]; then
	zshrc_auth_log_path='/var/log/auth.log'
elif [ $OSTYPE = "openbsd6.2" ]; then
	zshrc_auth_log_path='/var/log/authlog'
	zshrc_auth_log_path='/var/log/authlog'
fi

#### END OS SPECIFIC ####
