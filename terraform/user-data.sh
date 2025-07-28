#!/bin/bash

# Update and install Docker
apt-get update
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create docker-compose.yml
cat <<EOF > /home/ubuntu/docker-compose.yml
version: '3'
services:
  frontend:
    image: yourdockerhub/frontend:latest
    ports:
      - "3000:3000"
    restart: unless-stopped
  
  user:
    image: praysap/user-service:latest
    ports:
      - "3001:3001"
    restart: unless-stopped
  
  products:
    image: praysap/product-service:latest
    ports:
      - "3002:3002"
    restart: unless-stopped
  
  orders:
    image: praysap/order-service:latest
    ports:
      - "3003:3003"
    restart: unless-stopped
  
  cart:
    image: praysap/cart-service:latest
    ports:
      - "3004:3004"
    restart: unless-stopped
EOF

# Pull and run containers
#docker-compose -f /home/ubuntu/docker-compose.yml up -d