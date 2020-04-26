#!/usr/bin/env bash 

CUR_DIR=`pwd`
account=admin
ip=100.88.63.85
port=""

echo "" >> .bashrc
echo "export LANG=\"zh_CN.UTF-8\"" >> .bashrc
echo "export LANG=\"en_US.UTF-8\"" >> .bashrc

# move vim
scp -r ${account}@${ip}:/home/admin/.vimrc .
scp -r ${account}@${ip}:/home/admin/.vim .
sudo yum install ctags

scp -r ${account}@${ip}:/home/admin/.clang-format .
scp -r ${account}@${ip}:/home/admin/.commit_template .
scp -r ${account}@${ip}:/home/admin/.git-completion.bash .
scp -r ${account}@${ip}:/home/admin/.gitconfig . 

echo "" >> .bashrc
echo "source .git-completion.bash" >> .bashrc

# move dev_tool
scp -r ${account}@${ip}:/home/admin/dev_tools .
echo "" >> .bashrc
echo "PATH=\${PATH}:${CUR_DIR}/dev_tools" >> .bashrc
