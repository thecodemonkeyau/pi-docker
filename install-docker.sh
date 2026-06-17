# Install pre requisites
sudo apt update && sudo apt upgrade -y 
sudo apt install curl -y

# Fetch the install script and run it
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Set up the service
sudo systemctl enable docker
sudo systemctl start docker

# Set up the user
sudo usermod -aG docker $USER

# Might need to log out and in for this last bit to work to work
docker run hello-world || { echo "Log out and back in for the group change to take effect!" >&2; exit 1; }
