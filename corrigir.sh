#!/bin/bash

container='arquivos-redirecionamentos'
tag='dev'

docker_dir="`which docker`"

if [[ "${docker_dir}" == "" ]]; then
	echo "ERRO: O docker parece nao estar instalado!"
	echo "Se você estiver em um sistema Debian, execute 'sudo apt install docker'"
	exit 1
fi

sudo docker rm "$container:$tag"

sudo docker build -f .Dockerfile -t ${container}:${tag} . 
	
sudo docker run --stop-timeout 60 ${container}:${tag}
