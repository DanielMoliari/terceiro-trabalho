#!/bin/bash

if [[ ! -d /srv ]]; then

	echo -e "\nERRO: Pasta /srv nao existe!"
	exit 1
	
fi

owner=`ls -l / | grep srv | awk '{ print $3 }'`

group=`ls -l / | grep srv | awk '{ print $4 }'`

if [[ "$owner" != "root" ]]; then
	echo -e "\nERRO: Dono eh '$owner', deve ser 'root'!"
	exit 1
fi

if [[ "$group" != "gerente" ]]; then
	echo -e "\nERRO: Grupo eh '$group', deve ser 'gerente'!"
	exit 1
fi

exit 0
