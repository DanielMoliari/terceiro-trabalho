#!/bin/bash

if [[ "`grep 'gerente' /etc/group | grep 'bruno'`" == "" ]]; then

	echo -e "\nERRO: 'bruno' nao estah no grupo 'gerente'!"

	exit 1
	
else

	exit 0
	
fi
