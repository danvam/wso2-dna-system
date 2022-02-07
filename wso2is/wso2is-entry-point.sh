#!/bin/sh
#wso2is-entrypoint.sh
cp -R /home/wso2carbon/shared/lib/* /home/wso2carbon/wso2is-5.11.0/repository/components/lib
cp /home/wso2carbon/shared/conf/* /home/wso2carbon/wso2is-5.11.0/repository/conf
# cp /home/wso2carbon/shared/security/* /home/wso2carbon/wso2is-5.11.0/repository/resources/security/
# 5.11.0
/home/wso2carbon/docker-entrypoint.sh