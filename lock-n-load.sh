# if you have ipv6 isntalled you need to specify the ipv4 interface apparently
docker_status=$(docker info --format '{{.Swarm.LocalNodeState}}')
ip_addr=$(ip -4 addr show wlan0 | grep -oP 'inet \K[\d.]+')

if [[ "error" == "${docker_status}" ]]; then
	echo "docker error"
	exit 1
fi

# if we arent in a swarm, init one
if [[ "inactive" == "${docker_status}" ]]; then
	docker swarm init --advertise-addr ${ip_addr}
fi

# mk the config dir and lock it down to an unprivileged user
sudo mkdir -p /docker/portainer
sudo chown -R 1000:1000 /docker/portainer

# deploy the portainer stack
docker stack deploy -c portainer-agent-stack.yml portainer
