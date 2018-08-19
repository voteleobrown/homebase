USERNAME=$1

pgen () {
   local PPASS=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)
   echo $PPASS
}

PPASS=$(pgen)

sudo -u postgres -H -- createuser $USERNAME
sudo -u postgres -H -- psql -c "ALTER USER $USERNAME with encrypted password '$PPASS';"
echo "Username: $USERNAME"
echo "Password: $PPASS"
