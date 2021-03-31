#!/bin/bash

if [ $# != 3 ]
  then
    echo -e "No arguments supplied. \nUsage: $ akamai purge --edgerc /home/ec2-user/.edgerc invalidate --$ENV  --$PURGE_TYPE $URL"
    echo -e "$ akamai purge --edgerc /home/ec2-user/.edgerc invalidate --staging  --cpcode 123123"
    exit
fi

PURGE_TYPE=$1
ENV=$2
URL=$3


if [[ $PURGE_TYPE = "cpcode" ]]
then

  akamai purge --edgerc /home/ec2-user/.edgerc invalidate --$ENV  --$PURGE_TYPE 959078
  echo "PURGED BY CPCODE "

else 
 
   akamai purge --edgerc /home/ec2-user/.edgerc invalidate $URL --$ENV
   echo "PURGED BY URL"

fi
