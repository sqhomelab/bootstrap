#!/usr/bin/env bash
set -e

ROOT=/opt/platform
OWNER=${SUDO_USER:-$USER}

echo "Updating system..."
sudo apt-get update

echo "Installing packages..."
sudo apt-get install -y curl git tree

echo "Installing Docker..."
curl -fsSL https://get.docker.com | sh

echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Creating platform structure..."

sudo mkdir -p $ROOT
sudo mkdir -p $ROOT/stacks
sudo mkdir -p $ROOT/data
sudo mkdir -p $ROOT/backups
sudo mkdir -p $ROOT/scripts

sudo chown -R $OWNER:$OWNER $ROOT

echo "Platform ready:"
tree $ROOT