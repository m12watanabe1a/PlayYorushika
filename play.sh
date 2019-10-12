#!/bin/bash
IFS_BACKUP=$IFS
IFS=$'\n'

amy_path=($(find ~/Music -type d -name だから僕は音楽を辞めた -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
amy_list=($(find ~/Music -type d -name だから僕は音楽を辞めた -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))
amy_len=(${#amy_list[@]})

elma_path=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
elma_list=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))
elma_len=(${#elma_list[@]})

if [ $elma_len -eq $amy_len ]; then
    END=$(expr $amy_len - 1)
    for ((i=0;i<=$END;i++)); do

        echo "amy:" ${amy_list[$i]//\\ / }
        $(echo "${amy_path}/${amy_list[$i]}" | xargs afplay)

        echo "elma: "${elma_list[$i]//\\ / }
        $(echo "${elma_path}/${elma_list[$i]}" | xargs afplay)

    done
else
    echo "The number of list is not the same"
fi
IFS=$IFS_BACKUP
