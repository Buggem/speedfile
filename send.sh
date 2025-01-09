#!/bin/bash


if [ $# -ne 3 ];
then
    	echo "Usage: ./send.sh [input filename] [ip address] [encryption password]"
        exit 1
fi


echo "Sending file checksum..."
openssl dgst -sha256 "$1" | awk '{print $2}' | nc $2 1235

sleep 1
echo "Sending file..."

xz -c $1 | openssl enc -aes-256-cbc -base64 -k "$3" | nc $2 1234
