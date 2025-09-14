#!/bin/bash

if [ -f .env ]; then
    source .env
fi

if [ "$USERNAME" = "" ]; then
    echo "USERNAME=$USER" >> .env
fi

if [ "$USERID" = "" ]; then
    echo "USERID=$(id -u $USER)" >> .env
fi


