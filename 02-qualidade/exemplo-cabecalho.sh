#!/bin/bash
#
# move_arquivos.sh - Verifica em diretórios específicos se os respectivos arquivos já
#                     estão disponíveis, movendo-os para o diretório de trabalho.
#
# Site      : http://site-da-empresa.com.br/nome-do-programa
# Autor     : Severino Oliveira <severino.oliveirajr@gmail.com>
# Manutenção: Elis Regina Oliveira <elisreginaoliveira@hotmail.com
#
# --------------------------------------------------------------------------------------------
# Este programa recebe como parâmetro um prefixo de arquivo de configuração. A partir desse
# arquivo, obtem a lista de diretórios de origem para pesquisa de arquivos e o diretório de
# trabalho, para o qual os arquivos devem ser movidos.
#
# Exemplos:
#	$ ./move_arquivos.sh recargas
#	$ ./move_arquivos.sh contratos
#
# --------------------------------------------------------------------------------------------
#
# Histórico:
#
#	v1.0 2021-02-10, Severino Oliveira:
#	   - Versão inicial procurando no arquivo de recargas
#	v1.1 2021-02-15, Severino Oliveira:
#	   - Adicionado procura no arquivo de contratos
#	   - Ajustado a procura no arquivo de recargas
#
# Referência: Shell Script Professional
# Licença: GPL. 
