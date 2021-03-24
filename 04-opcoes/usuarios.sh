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
# Versão 4: Arrumando bug quando não tem opções, basename no nome do programa,
#     -V extraindo direto dos cabeçalhos, adicionadas opções --help e --version
# Versão 5: Adicionando opções -s e --sort
# Versão 6: Adicionadas opções -r, --reverse, -u, --uppercase, leitura de múltiplas opções (loop)
#
# Severino, Março de 2021
#
ordenar=0 # A saída deverá ser ordenada?
inverter=0 # A saída deverá ser invertida?
maiusculas=0 # A saída deverá ser em maiúscula:
MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]
OPÇÕES:
    -r, --reverse    Inverte a listagem
    -u, --uppercase  Mostra a listagem em MAIÚSCULA
    -s, --sort       Ordena a listagem alfabeticamento
    -h, --help       Mostra esta tela de ajuda e sai
    -V, --version    Mostra a versão do programa e sai
"

# Tratamento das opções da linha de comando
while test -n "$1"
do
    case "$1" in
	# Opções que ligam/desligam chaves
        -s | --sort) ordenar=1 ;;
        -r | --reverse) inverter=1 ;;
        -u | --uppercase) maiusculas=1 ;;
	# Opções de processamento
        -h | --help)
	    echo "$MENSAGEM_USO"
	    exit 0
        ;;
        -V | --version)
	    echo -n $(basename "$0")
	    # Extrai a versão diretamente dos cabeçalhos do programa
	    grep '^# Versão' $0 | tail -1 | cut -d: -f1 | tr -d \#
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
    
    # Opção $1 já processada, a fila deve andar
    shift
done

# Processamento

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena a listagem (se necessário)
test "$ordenar" = 1 && lista=$(echo "$lista" | sort)

# Inverte a listagem (se necessário)
test "$inverter" = 1 && lista=$(echo "$lista" | tac)

# Converte para maiúscula (se necessário)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z)

# Mostra o resultado para o usuário
echo "$lista" | tr : \\t

