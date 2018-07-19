wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get -y install esl-erlang
sudo apt-get -y install elixir
yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
sudo apt-get -y install inotify-tools
rm erlang*.deb*
