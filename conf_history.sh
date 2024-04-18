#!/usr/bin/env/bash
## NOME.............: conf_history.sh
## VERSÃO...........: 1.0
## DESCRIÇÃO........: Insere cabeçalhos em novos scripts ou em existentes.
## DATA DA CRIAÇÃO..: 09/12/2018
## ESCRITO POR......: Maurício G. Paiva
## E-MAIL...........: mauriciodez@gmail.com
## DISTRO...........: Debian GNU/Linux 8 (jessie)
## LICENÇA..........: GPLv3
## PROJETO..........: https://github.com/mauriciodez/gera_cabecalho.git

BASH_CONF=$(find /root/ -iname .bashrc)
LINE_CONF='1500'
CABE_CONF='ADD_CONF_BASH'

grep -q "$CABE_CONF" "$BASH_CONF" && { echo configuração já realizada no arquivo "$BASH_CONF" ; exit 0 ; }

# Adicionando data de execução aos comandos do histórico
BASH_CONF=$(find /root/ -iname .bashrc)
cat >> "$BASH_CONF" << EOF
#### $CABE_CONF ####
HISTTIMEFORMAT="%d/%m/%y %T"
HISTCONTROL=ignoreboth
HISTFILESIZE=$LINE_CONF
HISTSIZE=$LINE_CONF
EOF
