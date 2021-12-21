# wso2ei-ecosystem

**Docker User**


`
sudo groupadd docker
`

`
sudo adduser wso2carbon 
`

`
sudo usermod -aG docker wso2carbon
`

`
newgrp docker 
`

Editar:
  - /etc/subuid
    * incluir: wso2carbon:500000:65536 
  - /etc/subgid
    * incluir: wso2carbon:500000:65536

Nota: usar 500000 o algún valor superior al ultimo intervalo existente.

Editar o crear:
  - /etc/docker/daemon.json
    * Contenido:
```JSON
{
    "userns-remap": "wso2carbon",
    "debug": false,
    "restart": "on-failure"
}
```
**CENTOS 7**

Habilitar namespace

`
sudo grubby --args="namespace.unpriv_enable=1" --update-kernel="$(grubby --default-kernel)"
`

Permintir un número de namespaces mayor que cero

`
sudo echo "user.max_user_namespaces=15076" >> /etc/sysctl.conf
`

Permitir acceso de los contenedores a la ubicación de los archivos compartidos de configuración

`
chmod a+rwx /home/user/wso2-system/
`

Si fuera necesario reiniciar

`
sudo reboot
`

Reiniciar docker si no se ha reiniciado la máquina.

`
sudo /etc/init.d/docker restart
`

