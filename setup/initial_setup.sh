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

su $username
