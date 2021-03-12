#!/bin/bash
#
# usuarios.sh
#
# Mostra os logins e nomes de usuários do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra usuários e nomes separados por TAB
# Versão 2: Adicionado suporte à opção -h
# Versão 3: Adicionado suporte à opção -V e opções inválidas
#
# Severino, Março de 2021
#
MENSAGEM_USO="
Uso: $(basename "$0") [-h] [-V]

    -h Mostra esta tela de ajuda e sai
    -V Mostra a versão do programa e sai
"

# Tratamento das opções da linha de comando
case "$1" in
    -h | --help)
	echo "$MENSAGEM_USO"
	exit 0
    ;;
    -V | --version)
	    echo $(basename "$0") Versão 3
	exit 0
    ;;
    *)
	if test -n "$1"
	then
	    echo Opção inválida: $1
	    exit 1
	fi
    ;;
esac

# Processamento

cut -d : -f 1,5 /etc/passwd | tr : \\t

