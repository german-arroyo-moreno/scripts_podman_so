#!/bin/bash

# Verificar si Podman ya está instalado
if command -v podman &>/dev/null; then
    echo "Podman ya está instalado."
else
    # Actualizar el sistema
    sudo apt update
    
    # Instalar Podman
    sudo apt install -y podman
    
    echo "Podman se ha instalado correctamente."
fi

# Verificar si el archivo "$HOME/.config/containers/registries.conf" existe
if [ -e "$HOME/.config/containers/registries.conf" ]; then
    echo "El archivo \"$HOME/.config/containers/registries.conf\" ya existe. Debería contener la siguiente línea:"
    echo "unqualified-search-registries = ['nvcr.io', 'docker.io', 'quai.io']"
    echo "------------------------------------"
else
    # Crear directorio para la configuración de containers
    mkdir -p "$HOME/.config/containers/"
    
    # Configurar registros no calificados
    echo "unqualified-search-registries = ['docker.io', 'nvcr.io', 'quai.io']" > "$HOME/.config/containers/registries.conf"
    
    echo "Se ha creado el archivo \"$HOME/.config/containers/registries.conf\" con la configuración necesaria."
    echo "------------------------------------"
fi

# Continuar con el proceso de construcción
podman build -t ubuntu-so .
