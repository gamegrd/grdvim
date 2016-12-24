#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

export SHELL=$system_shell


echo "compile YouCompleteMe"
echo "It will take a long time, just be patient!"
echo "If error,you need to compile it yourself"
echo "cd $CURRENT_DIR/bundle/YouCompleteMe/ && python install.py --clang-completer"

cd $CURRENT_DIR/bundle/
ycm=$CURRENT_DIR/bundle/YouCompleteMe/
echo "$ycm"

while  [ ! -d "$ycm" ];
do
    git clone https://github.com/Valloric/YouCompleteMe.git
done

cd $CURRENT_DIR/bundle/YouCompleteMe/
for (i=1;i<1024;i++)
do
    git submodule update --init --recursive
done
if [ `which clang` ]   # check system clang
then
    python install.py --clang-completer --system-libclang   # use system clang
else
    python install.py --clang-completer
fi

echo "Install Done!"
