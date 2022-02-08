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


elation_id: a728cfb4-60db-4290-b241-90a44095f4d6, Direction: request, Payload: [
wso2mi              |     {
wso2mi              |         "id": 8,
wso2mi              |         "descripcion": "ProductoPP",
wso2mi              |         "precioVenta": 183.12
wso2mi              |     },
wso2mi              |     {
wso2mi              |         "id": 9,
wso2mi              |         "descripcion": "ProductoLL",
wso2mi              |         "precioVenta": 40.92
wso2mi              |     }
wso2mi              | ]
wso2mi              | [2022-02-07 22:23:59,767]  INFO {LogMediator} - {api:SporttiaNavAPI} To: /US005/Product, MessageID: urn:uuid:a728cfb4-60db-4290-b241-90a44095f4d6, correlation_id: a728cfb4-60db-4290-b241-90a44095f4d6, Direction: request, Envelope: <?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body><spor:US005InsertProduct xmlns:spor="urn:microsoft-dynamics-schemas/codeunit/SporttiaIntegMngt">
wso2mi              |   <spor:xmlParam>
wso2mi              |     <x50:producto xmlns:x50="urn:microsoft-dynamics-nav/xmlports/x50015">
wso2mi              |       <x50:id>8</x50:id>
wso2mi              |       <x50:descripcion>ProductoPP</x50:descripcion>
wso2mi              |       <x50:precioVenta>183.12</x50:precioVenta>
wso2mi              |     </x50:producto>
wso2mi              |     <x50:producto xmlns:x50="urn:microsoft-dynamics-nav/xmlports/x50015">
wso2mi              |       <x50:id>9</x50:id>
wso2mi              |       <x50:descripcion>ProductoLL</x50:descripcion>
wso2mi              |       <x50:precioVenta>40.92</x50:precioVenta>
wso2mi              |     </x50:producto>
wso2mi              |   </spor:xmlParam>
wso2mi              | </spor:US005InsertProduct></soapenv:Body></soapenv:Envelope>
wso2mi              | [2022-02-07 22:23:59,777]  INFO {NTLMCalloutMediator} - Inside Mediator initClientoption : false
wso2mi              | [2022-02-07 22:24:00,013]  INFO {LogMediator} - {api:SporttiaNavAPI} To: http://10.210.209.189:7047/des_nav16/WS/DES_TYD/Codeunit/SporttiaIntegMngt, WSAction: urn:microsoft-dynamics-schemas/codeunit/SporttiaIntegMngt:US005InsertProduct, SOAPAction: urn:microsoft-dynamics-schemas/codeunit/SporttiaIntegMngt:US005InsertProduct, MessageID: urn:uuid:a728cfb4-60db-4290-b241-90a44095f4d6, correlation_id: a728cfb4-60db-4290-b241-90a44095f4d6, Direction: request, stockerrorprop = [001] El producto 8 ya existe., Cause = [001] El producto 8 ya existe., Envelope: <?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body/></soapenv:Envelope>
wso2mi              | [2022-02-07 22:24:00,038] ERROR {JsonUtil} - #toXml. Could not convert JSON Stream to XML. Cannot handle JSON input. Error>>> java.io.IOException: Unexpected symbol: NUMBER
wso2mi              | [2022-02-07 22:24:00,040] ERROR {PayloadFactoryMediator} - {api:SporttiaNavAPI} Error converting JSON to XML, please check your JSON Path expressions return valid JSON: 
wso2mi              | [2022-02-07 22:24:00,071]  INFO {LogMediator} - {api:SporttiaNavAPI} To: http://10.210.209.189:7047/des_nav16/WS/DES_TYD/Codeunit/SporttiaIntegMngt, WSAction: urn:microsoft-dynamics-schemas/codeunit/SporttiaIntegMngt:US005InsertProduct, SOAPAction: urn:microsoft-dynamics-schemas/codeunit/SporttiaIntegMngt:US005InsertProduct, MessageID: urn:uuid:a728cfb4-60db-4290-b241-90a44095f4d6, correlation_id: a728cfb4-60db-4290-b241-90a44095f4d6, Direction: request, MESSAGE = Executing default 'fault' sequence, ERROR_CODE = a:Microsoft.Dynamics.Nav.Types.Exceptions.NavNCLDialogException, ERROR_MESSAGE = [001] El producto 8 ya existe., Envelope: <?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body/></soapenv:Envelope>
^CGracefully stopping... (press Ctrl+C again to force)
