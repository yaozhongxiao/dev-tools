we perform two small modification for opengrok, there are:  
(1). add customized opengrok webapp war package: opengrok-0.13-rc10/lib/mychain.war  
(2). add customized source sync & indexing & deploy & start script in opengrok-0.13-rc10/source  

### 0. download the dev-tools/opengrok submodule  
(1). git clone and get the dev-tools/opengrok submodule  
(2). place tomcat and opengrok to your predefined directory, in example  
    tomcat is placed at /opt/yaozhongxiao/apache-tomcat-9.0.10  
    opengrok is placed at /opt/yaozhongxiao/opengrok-0.13-rc10  

### 1. sync code by repo_sync.sh (skip this step if you manage source code by hand)  
(1). setup the repo_conf in repo_sync.sh according to the rules;  
the the source code could be synced by repo_sync.sh root_path direcly  

```
  8 # TODO(): add users source code to sync  
  9 # each git in repo conf with uri#branch#path
 10 #repo_conf=("git@github.com:yaozhongxiao/dev-tools.git#opengrok#./" \
 11 #           "git@github.com:yaozhongxiao/Golang.git#develop#./")
```

(2). execute ./repo_sync.sh source_root to sync all the source code into source_root directory  

### 2. generate source code indexing for opengrok
(1). setup opengrok_path in opengrok_indexing.sh  

```
opengrok_path="/opt/yaozhongxiao/opengrok-0.13-rc10"
```

(2). execute ./opengrok_indexing.sh webapp source_root to generate indexing for source 
code located in "source_root"; where webapp is the webapp name which will be access from browser like http://ip:port/webapp 

### 3. deploy the opengrok code search service
(1).setup tomcat directory and opengrok directory with following command in opengrok_deploy.sh  

```
 16 OPENGROK_TOMCAT_BASE=/opt/yaozhongxiao/apache-tomcat-9.0.10
 17 OPENGROK_BASE=/opt/yaozhongxiao/opengrok-0.13-rc10
```

(2).execute ./opengrok_deploy webapp to deploy the opengrok code search to tomcat which located in OPENGROK_TOMCAT_BASE; the webapp should be the same with the webapp in the opengrok_indexing

(3). after deployed, go to the $OPENGROK_TOMCAT_BASE/webapps/webapp directory, which webapp is set by indexing and deployment. set the CONFIGURATION to the real configuration.xml in configuration.xml 

```
  5   <context-param>
  6     <description>Full path to the configuration file where OpenGrok can read its configuration</description>
  7     <param-name>CONFIGURATION</param-name>
  8     <param-value>/opt/yaozhongxiao/opengrok-0.13-rc10/source/indexing/test/configuration.xml</param-value>
  9   </context-param>
```

### 4. start opengrok code search web service
setup the OPENGROK_TOMCAT_BASE in opengrok_start.sh

```
 7 OPENGROK_TOMCAT_BASE=/opt/yaozhongxiao/apache-tomcat-9.0.10
 8
```
execute ./opengrok_start.sh to start the tomcat and opengrok code searching

### [opengrok setup step by step](opengrok_step_by_step.md)

All the opengrok auto management scripti is based on the
[opengrok setup step by step](./opengrok_step_by_step.md), if you want to known
what happen exactly, go further step there.
