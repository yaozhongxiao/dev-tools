#!/bin/sh
#****************************************************************#
# ScriptName: repo_sync.sh 
# Author: zhongxiao.yzx
# Create Date: 2018-08-21
#***************************************************************#

# TODO(): each git in repo conf with uri#branch#path
repo_conf=("git@github.com:yaozhongxiao/ichain.git#0.9.2#./" \
           "git@github.com:yaozhongxiao/ichain-0.10.git#develop#./")


exec="" # echo | ""
log=":" # echo | ":"

opengrok_path="/opt/yaozhongxiao/opengrok-0.13-rc10"
repo_root="$opengrok_path/source/mychain"

echo "$0 source_root (default is '$repo_root')"
if [ ! -z $1 ];then
    repo_root=$1
    if [ "x/" != "x${repo_root:0:1}" ];then
        repo_root=`pwd`/$repo_root
    fi
fi

function git_sync() {
    local git_url=$1
    local project_name=${git_url##*/}
    project_name=${project_name%.*}
    local git_branch=$2
    local git_path="$repo_root/$3"
    local project_path="$git_path/$project_name"
    echo "git_sync $git_url $git_branch $project_path"
    # try to remove the project root 
    if [ -d $project_path ];then
        echo "rm -rf $project_path"
        $exec rm -rf $project_path
    fi
    mkdir -p $git_path
    cd $git_path
    echo ""
    echo "current path : `pwd`"
    echo ""

    echo "git clone $git_url"
    $exec git clone $git_url
    echo ""

    cd $project_path
    echo "git checkout -b $project_name-$git_branch remotes/origin/$git_branch"
    $exec git checkout -b $project_name-$git_branch remotes/origin/$git_branch
    echo ""
}

function main() {
    echo ""
    echo "try to sync ${#repo_conf[@]} projects in $repo_root"
    echo ""
    for git_conf in ${repo_conf[@]}
    do 
        echo "${git_conf}"
    done

    for git_conf in ${repo_conf[@]}
    do
        echo ""
        echo $git_conf
        echo "----------------------------------------------------------------------" 
        $log "git_conf : $git_conf"
        local git_url=${git_conf%%#*}
        $log "git_uri : $git_url"
        $log ""

        git_conf=${git_conf#*#}
        $log "git_conf : $git_conf"
        local git_branch=${git_conf%%#*}
        $log "git_branch : $git_branch"
        $log ""

        git_conf=${git_conf#*#}
        $log "git_conf : $git_conf"
        local git_path=$git_conf
        $log "git_path : $git_path"
        $log ""

        echo "git_url : $git_url"
        echo "git_branch: $git_branch"
        echo "git_path: $git_path"
        echo ""
        git_sync $git_url $git_branch $git_path
    done
}

main
