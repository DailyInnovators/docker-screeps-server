#!/bin/bash
version=$(curl https://raw.githubusercontent.com/screeps/screeps/master/package.json | tac | jq -r .version)
git clone git@github.com:DailyInnovators/docker-screeps-server.git
pushd docker-screeps-server
sed -i 's/^ENV SCREEPS_VERSION.*$/ENV SCREEPS_VERSION '$version'/i' Dockerfile
git commit -a -m "Auto Update to screeps "$version
git push origin master --tags
popd
rm -rf docker-screeps-server
