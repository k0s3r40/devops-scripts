if [ -z "$username" ]
then
      echo "\$username is empty. Set username with export username='myusername'"
      exit
fi

sudo apt-get update

echo Creating user $username

adduser $username --disabled-password  -q

echo User $username created

echo Add user to sudoers

echo $username:$(openssl rand -base64 12 ) | sudo chpasswd -e

usermod -aG sudo $username

echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo User $username created

sudo su $username

sudo apt install postgresql postgresql-contrib -y

sudo -i -u postgres

sudo apt-get install nginx-full -y

sudo apt-get update

sudo apt install docker.io -y

sudo systemctl enable --now docker

sudo usermod -aG docker $username

echo Docker is installed

docker --version

sudo docker run hello-world

sudo apt install net-tools -y

sudo docker run -d -p 8080:80 docker/getting-started

echo started a docker at port 8080

echo visit website:

echo http://$(hostname -I |cut -d ' ' -f 1):8080



