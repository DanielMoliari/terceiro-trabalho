#!/bin/bash

function checkuser(){
	user=$1

	gid_aluno="`grep 'aluno' /etc/group | cut -f3 -d':'`"

	gid_user="`grep "$user" /etc/passwd | cut -f4 -d':'`"

	if [[ $gid_aluno -ne $gid_user ]]; then

		echo -e "\nERRO: Grupo de $user = $gid_user, esperava $gid_aluno!"
		
		return 1

	fi

	pasta_home="`grep "$user" /etc/passwd | cut -f6 -d':'`"

	if [[ "$pasta_home" != "/srv/alunos/$user" ]]; then

		echo -e "\nERRO: Pasta home de $user = '$pasta_home', deve ser /srv/alunos/$user!"
		
		return 2

	fi
	
	return 0
}

checkuser "maria"

[[ $? -ne 0 ]] && exit 1;

checkuser "joao"

[[ $? -ne 0 ]] && exit 1;

exit 0
