#!/bin/bash

if [ $# -lt 1 ];
then
	echo "Usage: ./recieve.sh [output filename]"
	exit 1
fi

echo "Waiting for checksum sender..."

shasum="$(nc -l 1235)"

echo "Waiting for file sender..."
sleep 0.5

nc -l 1234 | openssl enc -aes-256-cbc -d -base64 -k your_password_here -out a.xz; rm -f a; xz -d a.xz

if [ "$shasum" != "$(openssl dgst -sha256 a | awk '{print $2}')" ];
then
	echo "SHA MISMATCH!"
	rm a
	exit 1
else
	echo "SHA-256 checks suceeded. Your file is now at the location: $1."
fi


mv a "$1"
