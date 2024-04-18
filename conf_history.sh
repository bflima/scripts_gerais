#!/usr/bin/env/bash

## INFO ##
## NOME.............: conf_history.sh
## VERSÃO...........: 1.0
## DESCRIÇÃO........: Atualiza bash history com ajustes de tamanho, data e hora
## DATA DA CRIAÇÃO..: 18/04/2024
## ESCRITO POR......: Bruno Lima
## E-MAIL...........: bruno@lc.tec.br
## DISTRO...........: Debian GNU/Linux 12
## LICENÇA..........: GPLv3
## Git Hub..........: https://github.com/bflima

BASH_CONF=$(find /root/ -iname .bashrc)
LINE_CONF='1500'
CABE_CONF='ADD_CONF_BASH'

grep -q "$CABE_CONF" "$BASH_CONF" && { echo configuração já realizada no arquivo "$BASH_CONF" ; exit 0 ; }

# Adicionando data de execução aos comandos do histórico
BASH_CONF=$(find /root/ -iname .bashrc)
cat >> "$BASH_CONF" << EOF
#### $CABE_CONF ####
HISTTIMEFORMAT="%d/%m/%y %T "
HISTCONTROL=ignoreboth
HISTFILESIZE=$LINE_CONF
HISTSIZE=$LINE_CONF
EOF

# Gravar sessão
history -w
