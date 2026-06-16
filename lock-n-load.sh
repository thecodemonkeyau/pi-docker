# if you have ipv6 isntalled you need to specify the ipv4 interface apparently
docker swarm init --advertise-addr 192.168.68.222

sudo mkdir -p /docker/portainer

# FIXME: bad
sudo chmod 777 /docker/portainer

# lock this down
# sudo chown docker-user /docker/portainer
# sudo cmod 755 /docker/portainer

docker stack deploy -c portainer-agent-stack.yml portainer
