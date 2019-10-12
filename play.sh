#!/bin/bash
IFS_BACKUP=$IFS
IFS=$'\n'

amy_path=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
amy_list=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))

elma_path=($(find ~/Music -type d -name だから僕は音楽を辞めた -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
elma_list=($(find ~/Music -type d -name だから僕は音楽をを辞めた -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))

i=0
for e in ${amy_list[@]}; do
    echo ${e}
    if [ ! $(echo "${amy_path}/${e}" | xargs afplay) ]; then
        break
    fi
done
#amy = array($(ls ))
IFS=$IFS_BACKUP
