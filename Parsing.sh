#!/bin/bash

# PARSING DE URLS
if [ "$1" == "" ]
then
	# MODO DE USO
	echo -e "\e[01;33m#################### PARSING HOST ####################\e[0m"
	echo -e "\e[01;33m-> Criado por:\tLincoln Figueredo\e[0m"
	echo -e "\e[01;33m-> Modo de Uso:\t$0 www.URLalvo.com.br\e[0m"
	echo -e "\e[01;33m######################################################\e[0m"
else
	# REALIZANDO PARSING
	echo -e "\e[01;33m######################################################\e[0m"
	echo -e "\e[01;33m-> Realizando Parsing URLs em: $1\e[0m"
	echo -e "\e[01;33m######################################################\e[0m"
	wget -q "$1"

	# SALVANDO PARSING EM URLDOALVO.IP.TXT
	echo -e "\n\e[01;34m-> Parsing concluido! Salvando os resultados em: $1.ip.txt\e[0m\n"
	grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > "$1.ip"

	# RESOLVENDO PARSING E MOSTRANDO SEUS HOSTS
	echo -e "\e[01;35m######################################################\e[0m"
	echo -e "\e[01;35m-> Resolvendo Hosts...\e[0m"
	echo -e "\e[01;35m######################################################\e[0m"
	for url in $(cat "$1.ip"); do host $url | grep "has address"; done
fi
