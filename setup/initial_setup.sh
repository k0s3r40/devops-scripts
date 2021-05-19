sudo apt-get update
sudo apt-get  -y upgrade

echo Creating user $username

sudo useradd $username

echo User $username created

echo Add user to sudoers

echo $username:$(openssl rand -base64 12 ) | sudo chpasswd -e

usermod -aG sudo username

echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo User $username created

su $username
