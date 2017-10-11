#!/bin/bash
HOST="107.23.242.117"
CLUSTER="harshal-yb"
SERVICE="hive"
USER=$1
PASSWORD=$2
echo "Getting Current Hive service status"
STATE=$(/usr/bin/curl -s -X GET -u $USER:$PASSWORD 'http://'$HOST':7180/api/v1/clusters/'$CLUSTER'/services/'$SERVICE'/' | jq '.serviceState')

echo $STATE

if [ "$STATE" = "\"STARTED\"" ]
then 	echo "Stopping Service"
	/usr/bin/curl -s -X POST -u $USER:$PASSWORD 'http://'$HOST':7180/api/v1/clusters/'$CLUSTER'/services/'$SERVICE'/commands/stop'
	echo "Sleeping for 10 sec"
	sleep 10
fi

STATE=$(/usr/bin/curl -s -X GET -u $USER:$PASSWORD 'http://'$HOST':7180/api/v1/clusters/'$CLUSTER'/services/'$SERVICE'/' | jq '.serviceState')
if [ "$STATE" = "\"STOPPED\"" ]
then 	echo "Starting Service"
	/usr/bin/curl -s -X POST -u $USER:$PASSWORD 'http://'$HOST':7180/api/v1/clusters/'$CLUSTER'/services/'$SERVICE'/commands/start'
	echo "Sleeping for 10 sec"
	sleep 10
fi


echo "Getting Current Hive service status"
STATE=$(/usr/bin/curl -s -X GET -u $USER:$PASSWORD 'http://'$HOST':7180/api/v1/clusters/'$CLUSTER'/services/'$SERVICE'/' | jq '.serviceState')
echo $STATE

