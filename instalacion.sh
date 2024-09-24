#!/bin/bash

# Function to detect package manager and install Podman
install_podman() {
    if command -v apt &>/dev/null; then
        sudo apt update
        sudo apt install -y podman
    elif command -v yum &>/dev/null; then
        sudo yum install -y podman
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y podman
    elif command -v zypper &>/dev/null; then
        sudo zypper install -y podman
    elif command -v pacman &>/dev/null; then
        sudo pacman -Syu podman
    else
        echo "No se ha encontrado un menejador de paquetes compatible. Por favor instale el paquete podman de forma manual antes de continuar."
        exit 1
    fi
}

# Check if Podman is already installed
if command -v podman &>/dev/null; then
    echo "Podman ya está instalado."
else
    install_podman
    echo "Podman se ha instalado correctamente."
fi

# Check if the registries.conf file exists
if [ -e "$HOME/.config/containers/registries.conf" ]; then
    echo "El archivo \"$HOME/.config/containers/registries.conf\" ya existe. Debería contener la siguiente línea:"
    echo "unqualified-search-registries = ['nvcr.io', 'docker.io', 'quai.io']"
    echo "------------------------------------"
else
    # Create directory for container configuration
    mkdir -p "$HOME/.config/containers/"
    
    # Configure unqualified registries
    echo "unqualified-search-registries = ['docker.io', 'nvcr.io', 'quai.io']" > "$HOME/.config/containers/registries.conf"
    
    echo "Se ha creado el archivo \"$HOME/.config/containers/registries.conf\" con la configuración necesaria."
    echo "------------------------------------"
fi

# Continue with the build process
podman build -t ubuntu-so .
