# Usa la imagen base de Ubuntu 20.04
FROM ubuntu:20.04

# Actualiza el sistema y realiza la instalación de los paquetes
RUN apt update && apt install -y bash fdisk cron at gcc make nano vim emacs adduser
