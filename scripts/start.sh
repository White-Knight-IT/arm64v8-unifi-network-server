#!/bin/bash

mongod --fork --logpath /var/log/mongodb/mongod.log

sleep 5

service unifi start

while [ 5 -gt 4 ];
do
  sleep 60
done
