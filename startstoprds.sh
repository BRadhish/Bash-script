#!/bin/bash
set -x

Usage(){

	echo -e 'Invalid syntax\nUsage: ./start-stop-rds.sh [start/stop] [profile] [db-cluster-identifier]\nEg. ./start-stop-rds.sh india-stage stage-fantasy-001'

	exit 1
}

StopRDS(){

	  aws rds --profile ${1} stop-db-cluster  --db-cluster-identifier ${2} > /dev/null 2>&1
	  if [ $? -ne 0 ] 
	   then
	  	 echo "DB instance ${2} is alerady stopped"
	   else 
	  	 echo "Stopping DB cluster" ${2}
	  fi 	 
}

StartRDS(){

	  aws rds --profile ${1} start-db-cluster --db-cluster-identifier ${2}  > /dev/null 2>&1
	  if [ $? -ne 0  ] 
	   then
	  	 echo "DB instance ${2} is alerady started"
	  else 
	  	 echo "Starting DB cluster" ${2}
	  fi	 
}

if [ $# -eq 0 ]
 then
	Usage
fi

Profile="$2"
Identifier="$3"

if [ $1 == 'start' ]
 then
 	
	StartRDS $Profile $Identifier

elif [ $1 == 'stop' ]
 then
 	StopRDS $Profile $Identifier

else
	Usage
fi
