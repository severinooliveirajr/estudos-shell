#!/bin/bash
#
# usuarios.sh
#
# Mostra os logins e nomes de usuários do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Severino, Março de 2021
#
cut -d : -f 1,5 /etc/passwd | tr : \\t

