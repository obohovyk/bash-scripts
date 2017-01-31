#!/bin/bash

APP="http://example.com:8080"
CURL="/usr/bin/curl"
COUNT=0
PROBES=4

while [ "${CHK}" != "200" ]; do
    echo "Continue starting..."
    sleep 30
    (( COUNT++ ))
    CHK=`${CURL} --silent -I ${APP}| head -1| awk {'print $2'}`

    if [ ${COUNT} -ge ${PROBES} ]; then
        echo "[ERROR]: Server failed to start after ($PROBES) probes."
        exit 1
    fi
done

echo "Server successfully started."