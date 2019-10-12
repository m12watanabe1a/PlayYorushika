#!/bin/bash
IFS_BACKUP=$IFS
IFS=$'\n'

amy_path=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
amy_list=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))

i=0
for e in ${amy_list[@]}; do
    echo "${amy_path}/${amy_list}" | xargs afplay
    let i++
done
#amy = array($(ls ))
IFS=$IFS_BACKUP
