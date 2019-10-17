#!/bin/bash

set -e
set -v

sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y golang-go

go get mvdan.cc/sh/cmd/shfmt
sudo mv ~/go/bin/shfmt /usr/bin/shfmt

rm -rf ~/go/
sudo add-apt-repository -r -y ppa:longsleep/golang-backports
sudo apt-get purge -y golang-go
sudo apt-get autoremove --purge -y
