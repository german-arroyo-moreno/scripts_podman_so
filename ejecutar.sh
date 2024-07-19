#!/bin/bash

# Nombre de la imagen (por defecto)
imagen="ubuntu-so"

# Verificar si se proporcionó un argumento para la imagen
if [ $# -eq 1 ]; then
  imagen="$1"
fi

podman run -it --rm --name "$imagen"  -v "$(pwd)":/mnt/disco_local -w /mnt/disco_local "$imagen" bash
