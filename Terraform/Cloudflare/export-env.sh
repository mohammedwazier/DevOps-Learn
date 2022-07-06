#!/bin/sh -

## Usage:
##   . ./export-env.sh ; $COMMAND
##   . ./export-env.sh ; echo ${MINIENTREGA_FECHALIMITE}

unamestr=$(uname)
if [ "$unamestr" = 'Linux' ]; then

    export $(grep -v '^#' .env | xargs -d '\n')

elif [ "$unamestr" = 'FreeBSD' ]; then

    export $(grep -v '^#' .env | xargs -0)

else
    # export $(cat .env | xargs)
    # while IFS== read -r key value; do
    #     printf -v "$key" %s "$value" && export "$key"
    # done

    # printf $(cat .env | egrep -v "(^#.*|^$)" | xargs)
    set -a 
    printf $(set -a | echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)



    # printf $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)

fi
