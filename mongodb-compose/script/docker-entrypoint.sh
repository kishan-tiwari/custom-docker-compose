#!/usr/bin/env bash
source .env

echo "##########################::Starting init script::###################################"

sleep 3

docker exec -it $CONTAINER_NAME mongo admin -u $MONGO_ROOT_USERNAME -p $MONGO_ROOT_PASSWORD --eval "
db=db.getSiblingDB('$CUSTOM_DB');
db.createCollection('test');
db.createUser({user: '${CUSTOM_USER}', pwd: '${CUSTOM_USER_PASSWORD}', roles: [{role: 'dbAdmin', db: '${CUSTOM_DB}'},{role: 'readWrite', db: '${CUSTOM_DB}'}]});
"

if [ $? -eq 0 ]; then
  echo "#######################::Entrypoint script executed successfully::#################"
fi

sleep 2

echo "###########################::Checking custom user ::#################################"

docker exec -it $CONTAINER_NAME mongo ${CUSTOM_DB} -u ${CUSTOM_USER} -p ${CUSTOM_USER_PASSWORD}   --eval "
db=db.stats();
"

if [ $? -eq 0 ]; then
  echo 'Custom user login successfully'
fi

