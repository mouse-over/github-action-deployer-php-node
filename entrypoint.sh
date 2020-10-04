#!/bin/sh -l

echo "Task $1"
echo "Host/stage $2"

cd /github/workspace
mkdir /github/home/.ssh
chown -R $UID /github/home/.ssh

deployer --version
deployer $1 $2 -o build_path="/github/workspace" -vvv