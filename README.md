# Manual de Uso de los Scripts

## instalacion.sh

Este script se encarga de instalar las dependencias necesarias y construir una imagen. Aquí tienes cómo usarlo:

```bash

./instalacion.sh
```

Este script no requiere argumentos adicionales, y creará una imagen llamada **ubuntu-so**.

Recuerda que debes tener permisos de administrador (sudo) para ejecutar algunos de estos comandos, así que pedirá tu clave de root del ordenador donde estés realizando la instalación.

Este proceso solo hay que realizarlo una vez (a menos de que desinstales la imagen por defecto).

## ejecutar.sh

Este script se utiliza para ejecutar un contenedor basado en la imagen especificada. Aquí tienes cómo usarlo:

```bash

./ejecutar.sh [nombre_de_la_imagen]

    [nombre_de_la_imagen] (opcional): Si deseas utilizar una imagen diferente a la predeterminada, puedes proporcionar el nombre de la imagen como argumento.
```

Ejemplo de uso para la imagen por defecto:

```bash

./ejecutar.sh ubuntu-so
```

Ejemplo de uso para otra imagen llamada mi-ubuntu:

```bash

./ejecutar.sh mi-ubuntu
```

Recuerda que una vez salgas de este bash (usando *exit* o Ctrl-D o Ctrl-C, todos los cambios que no se hayan realizado en tu directorio de trabajo actual se perderán, incluyendo instalación de paquetes, modificación de archivos, etc.).

## guardar-contenedor.sh

Este script se utiliza para crear una nueva imagen a partir de un contenedor que esté en ejecución, lo que te permitirá mantener los cambios realizados (paquetes instalados, archivos de configuración editados, etc.). Aquí tienes cómo usarlo:

```bash
./guardar-contenedor.sh <id_contenedor> <nueva_imagen>

    <id_contenedor>: Debes proporcionar el ID del contenedor en ejecución. 
    <nueva_imagen>: Es el nombre que deseas darle a la nueva imagen que se creará.
```

El ID del contenedor se puede saber mediante 
```bash
podman ps
```
y buscando el ID en la columna correspondiente, o bien directamente cuando salga algo como **root@ce81789e7b08:/mnt/disco_local** en el prompt, el ID vendría dado por la cadena: ce81789e7b08.

Ejemplo de uso:

```bash

./guardar-contenedor.sh ce81789e7b08 mi_nueva_imagen
```

## desinstalacion.sh

Este script se encarga de eliminar una imagen y todos los contenedores basados en esa imagen, se utiliza para liberar espacio en disco. Aquí tienes cómo usarlo:

```bash

./desinstalacion.sh <nombre_de_la_imagen>

    <nombre_de_la_imagen>: Debes proporcionar el nombre de la imagen que deseas eliminar.
```

Ejemplo de uso:

```bash

./desinstalacion.sh ubuntu-so
```

## exportar.sh

Este script permite exportar nuestro contenedor a un archivo para llevárnoslo a otra máquina (por ejemplo en un USB).

Aquí tienes cómo usarlo:

```bash
./exportar.sh
```

Esto creará el fichero `ubuntu-so.tar` en el lugar donde ejecutes el script.

## importar.sh

Este script permite importar nuestro contenedor si no tenemos ninguna imagen llamada `ubuntu-so` a nuestro sistema.

Aquí tienes cómo usarlo:

```bash
./importar.sh
```

Esto leerá el fichero `ubuntu-so.tar` en el lugar donde ejecutes el script y creará la imagen correspondiente del contenedor.




