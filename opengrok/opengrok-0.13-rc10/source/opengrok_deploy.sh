#!/bin/sh
#****************************************************************#
# ScriptName: opengrok_deploy.sh 
# Author: zhongxiao.yzx
# Create Date: 2018-08-22
#***************************************************************#
exec="" # echo | ""

echo "$0 webapp (webapp default is 'mychain')"

opengrok_webappname="mychain"
if [ ! -z $1 ];then
    opengrok_webappname=$1
fi

OPENGROK_TOMCAT_BASE=/opt/yaozhongxiao/apache-tomcat-9.0.10
OPENGROK_BASE=/opt/yaozhongxiao/opengrok-0.13-rc10
OPENGROK_WEBAPP=mychain.war

echo ""
echo "$0 try to deploy $opengrok_webappname in ${OPENGROK_TOMCAT_BASE}"
if [ ! -d $OPENGROK_TOMCAT_BASE ];then
    echo "can not find tomcat in ${OPENGROK_TOMCAT_BASE}"
    exit
fi

echo "cp -r $OPENGROK_BASE/lib/$OPENGROK_WEBAPP $OPENGROK_TOMCAT_BASE/webapps/${opengrok_webappname}.war"
$exec cp -r $OPENGROK_BASE/lib/$OPENGROK_WEBAPP $OPENGROK_TOMCAT_BASE/webapps/${opengrok_webappname}.war
