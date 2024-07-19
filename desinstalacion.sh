#!/bin/bash

# Verificamos si se ha proporcionado un argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <nombre_de_la_imagen>"
    podman image ls
    exit 1
fi

# Guardamos el nombre de la imagen en una variable
imagen=$1

# Primero, detenemos y eliminamos todos los contenedores basados en la imagen
contenedores=$(podman ps -a | grep "$imagen" | awk '{print $1}')
for contenedor in $contenedores; do
    echo "Deteniendo y eliminando contenedor $contenedor..."
    podman stop $contenedor
    podman rm $contenedor
done

# Luego, eliminamos la imagen en sí
echo "Eliminando la imagen $imagen..."
podman rmi "$imagen"

echo "Proceso completado."
