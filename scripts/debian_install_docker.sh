#!/bin/bash

# This script automates the installation of Docker and Docker Compose on Debian.
# It follows the official Docker installation guide.

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting Docker and Docker Compose installation for Debian..."

# 1. Set up Docker's APT repository
# -----------------------------------------------------------------------------
echo "[1/4] Updating package list and installing prerequisites..."
apt-get update
apt-get install -y ca-certificates curl gnupg

echo "[2/4] Adding Docker's official GPG key..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "[3/4] Setting up the Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null


# 2. Install Docker Engine, CLI, and Compose
# -----------------------------------------------------------------------------
echo "[4/4] Installing Docker Engine, CLI, and Compose..."
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# 3. Post-installation steps (run Docker without sudo)
# -----------------------------------------------------------------------------
# Get the username of the user who invoked sudo
SUDO_USER=${SUDO_USER:-$(whoami)}
if [ -n "$SUDO_USER" ] && [ "$SUDO_USER" != "root" ]; then
    echo "Adding user '$SUDO_USER' to the 'docker' group..."
    usermod -aG docker "$SUDO_USER"
fi

# 4. Print completion message
# -----------------------------------------------------------------------------
echo ""
echo "✅ Docker installation complete!"
echo ""
echo "IMPORTANT: To run Docker commands without 'sudo', you must log out and log back in."
echo ""
echo "After logging back in, you can verify the installation by running:"
echo "  docker --version"
echo "  docker compose version"
echo "  docker run hello-world"
echo ""