#!/bin/sh
#****************************************************************#
# ScriptName: opengrok_indexing.sh
# Author: zhongxiao.yzx
# Create Date: 2018-08-22
#***************************************************************#
exec="" # echo | ""

echo "$0 webapp source_root (webapp default is 'mychain')"

opengrok_path="/opt/yaozhongxiao/opengrok-0.13-rc10"
opengrok_webappname="mychain"
if [ ! -z $1 ];then
    opengrok_webappname=$1
fi
indexing_root="${opengrok_path}/source/indexing/$opengrok_webappname"

source_root="${opengrok_path}/source/$opengrok_webappname"
if [ ! -z $2 ];then
    source_root=$2
    if [ "x/" != "x${source_root:0:1}" ];then
        source_root=`pwd`/$source_root
    fi
fi

echo ""
echo "$0 try to indexing for $opengrok_webappname with :"
echo "    source_root : $source_root"
echo "    index_root  : $indexing_root"

# indexing for the source code
# 1. remove the old indexing if exist
if [ -d ${indexing_root}/ ];then
    rm -rf ${indexing_root}/
fi
mkdir -p ${indexing_root}

# 2. export the OpenGrok environment variables
export OPENGROK_TOMCAT_BASE=/opt/yaozhongxiao/apache-tomcat-9.0.10
export OPENGROK_WEBAPP_CONTEXT=$opengrok_webappname

# export OPENGROK_INSTANCE_BASE=$indexing_root
echo "OPENGROK_WEBAPP_CONTEXT : $OPENGROK_WEBAPP_CONTEXT"

echo ""
echo "java $JAVA_OPTS -jar ${opengrok_path}/lib/opengrok.jar -P -S -v \
-s ${source_root} \
-d ${indexing_root} \
-W ${indexing_root}/configuration.xml \
-w $OPENGROK_WEBAPP_CONTEXT # webapp-context  ${OPENGROK_TOMCAT_BASE}/webapps/webapp-context"

sleep 5

echo ""
# java -jar ${opengrok_path}/lib/opengrok.jar for command help
$exec java $JAVA_OPTS -jar ${opengrok_path}/lib/opengrok.jar -P -S -v \
-s ${source_root} \
-d ${indexing_root} \
-W ${indexing_root}/configuration.xml \
-w $OPENGROK_WEBAPP_CONTEXT # webapp-context  ${OPENGROK_TOMCAT_BASE}/webapps/webapp-context
