#!/bin/bash

# Verificar si se proporcionaron los argumentos correctos
if [ $# -ne 2 ]; then
  echo "Uso: $0 <id_contenedor> <nueva_imagen>"
  echo "Donde:"
  echo "  <id_contenedor>: ID del contenedor en ejecución."
  echo "                   de root@ce81789e7b08:/mnt/disco_local#"
  echo "                   sería este ID: ce81789e7b08"
  echo "  <nueva_imagen>: Nombre de la nueva imagen a guardar."
  exit 1
fi

# ID del contenedor en ejecución
id_contenedor="$1"

# Nombre de la nueva imagen
nueva_imagen="$2"

# Realizar commit del contenedor en una nueva imagen
podman commit "$id_contenedor" "$nueva_imagen"

echo "Se ha creado la nueva imagen: $nueva_imagen"

