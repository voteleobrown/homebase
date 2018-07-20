sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' >/tmp/neo4j.list
sudo mv /tmp/neo4j.list /etc/apt/sources.list.d
sudo apt-get update
sudo apt-get -y install neo4j
sudo service neo4j status

echo "======================================================"
echo "          Important Neo4j Locations:                  "
echo " /etc/neo4j/neo4j.conf                                "
echo " /var/lib/neo4j/data                                  "
echo "======================================================"
