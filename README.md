# wso2-dna-system

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


desplegar apps:

docker cp carbonapps/dnasport_1.0-SNAPSHOT.car wso2mi:/home/wso2carbon/wso2mi-4.0.0/repository/deployment/server/carbonapps


renovar certificado para comunicación mi --> is

> keytool -delete -alias "wso2carbon" -keystore wso2carbon.jks

> keytool -genkey -alias wso2carbon -keyalg RSA -keysize 2048 -keystore wso2carbon.jks -dname "CN=wso2is, OU=Is,O=Wso2,L=SL,S=WS,C=LK" -storepass wso2carbon -keypass wso2carbon

> keytool -export -alias wso2carbon -keystore wso2carbon.jks -file wso2carbon.pem

> keytool -delete -alias "wso2carbon" -keystore client-truststore.jks

> keytool -import -alias wso2carbon -file wso2carbon.pem -keystore client-truststore.jks -storepass wso2carbon

> docker cp security/client-truststore.jks wso2is:/home/wso2carbon/wso2is-5.11.0/repository/resources/security/

> docker cp security/wso2carbon.jks wso2is:/home/wso2carbon/wso2is-5.11.0/repository/resources/security/

> docker cp security/client-truststore.jks wso2mi:/home/wso2carbon/wso2mi-4.0.0/repository/resources/security/