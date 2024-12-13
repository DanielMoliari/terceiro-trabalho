#!/bin/bash

if [[ ! -d /srv ]]; then

	echo -e "\nERRO: Pasta /srv nao existe!"
	exit 1
	
fi

permission="`sudo ls -la / | grep srv | awk '{ print $1 }'`"

if [[ "$permission" != "drwxr-x--x" ]]; then 
	echo -e "\nERRO: permissoes erradas em /srv! "
	exit 2
fi


if [[ ! -d /srv/alunos ]]; then

	echo -e "\nERRO: Pasta /srv/alunos nao existe!"
	exit 3
	
fi

permission="`sudo ls -la /srv | grep alunos | awk '{ print $1 }'`"

if [[ "$permission" != "drwxrwx---" ]]; then 
	echo -e "\nERRO: permissoes erradas em /srv/alunos! "
	exit 4
fi


if [[ ! -d /srv/professores ]]; then

	echo -e "\nERRO: Pasta /srv/professores nao existe!"
	exit 5
	
fi

permission="`sudo ls -la /srv | grep professores | awk '{ print $1 }'`"

if [[ "$permission" != "drwxrwx---" ]]; then 
	echo - "\nERRO: permissoes erradas em /srv/professores! "
	exit 6
fi

exit 0
