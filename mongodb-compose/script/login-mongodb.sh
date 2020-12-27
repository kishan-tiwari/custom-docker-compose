#!/usr/bin/env bash
source .env

echo "########### Enter choice for login ##########"

echo  "1. Login as a administrator " 
echo  "2. Login as custom user " 

read -p "Please enter your choice : " choice

if [ $choice -eq 1 ]; then 
  echo "############### Login As Administrator ###############"
  sleep 1
  docker exec -it $CONTAINER_NAME mongo  -u ${MONGO_ROOT_USERNAME} -p ${MONGO_ROOT_PASSWORD}
elif [ $choice -eq 2 ]; then 
  echo "############### Login As Custom User ###############"
  sleep 1
  docker exec -it $CONTAINER_NAME mongo ${CUSTOM_DB} -u ${CUSTOM_USER} -p ${CUSTOM_USER_PASSWORD}
else 
  exit 1
fi

