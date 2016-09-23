#/bin/bash

if [[ $# != 1 || "$1" != "clean" && "$1" != "dirty" ]] ; then
    printf "\nusage: `basename $0` { clean | dirty }\n"
    printf "\n       clean performs a 'make dirclean'\n"
    printf "\n       dirty just runs 'make V=s'\n\n"
    exit 1
fi

log=build-$(date -Iseconds).log
echo "############## Starting ###########" > $log
date >> $log

if [ "$1" == "clean" ]; then
    make dirclean  V=s 2>&1 >> $log
fi

make V=s 2>&1 | tee -a $log

echo "################### END ####################" >> $log

date >> $log

