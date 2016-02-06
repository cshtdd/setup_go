#!/bin/sh

##this file must be executed from ~/.bash_profile so the $GOPATH variable gets set
##INSTALLATION STEPS: Execute the following command 
##echo "source ~/Cocoa/setup_go.sh" >> ~/.bash_profile

mkdir -p $HOME/devroot/go/src/github.com/camilin87
export GOPATH=$HOME/devroot/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

#echo $GOPATH
#echo $PATH
