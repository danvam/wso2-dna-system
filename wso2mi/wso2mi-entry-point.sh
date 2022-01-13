#!/bin/sh
#wso2mi-entrypoint.sh
cp -R /home/wso2carbon/shared/lib/* /home/wso2carbon/wso2mi-4.0.0/lib
cp /home/wso2carbon/shared/conf/* /home/wso2carbon/wso2mi-4.0.0/conf
# 4.0.0
/home/wso2carbon/docker-entrypoint.sh