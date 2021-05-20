Digital ocean's doctl cheat sheet


1. Install doctl
2. list droplets
	-[x] doctl compute droplet list
3. create droplet
	-[x] doctl compute droplet create --image Debian-10-x64 --region lon1 --size s-1vcpu-1gb test --ssh-keys xx:xx:xx:xx:xx:xx:xx

4. delete droplet
	-[x] doctl compute droplet delete test

