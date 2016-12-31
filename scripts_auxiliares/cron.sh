#!/bin/bash --login
APPDIR=$(dirname $0)/..
cd $APPDIR
if rbenv local >/dev/null 2>&1;
then
    rbenv local;   
fi

dia=$(date +%w)

# Executar todos sabado
if [[ ${dia} -eq 6 ]]
then
  RAILS_ENV=development rake videos:clean
fi
