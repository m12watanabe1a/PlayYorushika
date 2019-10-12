#!/bin/zsh
while getopts s OPT
do
  case $OPT in
    "s" ) FLG_S="TRUE" ;;
      * ) echo "Usage: $CMDNAME [-s]"  1>&2
          exit 1 ;;
  esac
done

IFS_BACKUP=$IFS
IFS=$'\n'

amy_path=($(find ~/Music -type d -name だから僕は音楽を辞めた -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
amy_list=($(find ~/Music -type d -name だから僕は音楽を辞めた -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))
amy_len=(${#amy_list[@]})

elma_path=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1dn1 | sed 's/ /\\ /g'))
elma_list=($(find ~/Music -type d -name エルマ -print0 | xargs -0 ls -v1 | sed 's/ /\\ /g'))
elma_len=(${#elma_list[@]})

if [ $amy_len -eq $elma_len ] && [ $amy_len -gt 0 ]; then
    END=$amy_len
    for ((i=1;i<=$END;i++)); do
        p=i
        if [ "$FLG_S" = "TRUE" ]; then
            p=$(jot -r 1 1 ${amy_len})
        fi


        echo -e "amy:\t" ${amy_list[$p]/**\\ /} | sed 's/\.[^\.]*$//'
        $(echo "${amy_path}/${amy_list[$p]}" | xargs afplay)

        echo -e "elma:\t"${elma_list[$p]/**\\ /}
        $(echo "${elma_path}/${elma_list[$p]}" | xargs afplay)

    done
else
    echo "No valid music files"
fi
IFS=$IFS_BACKUP
exit 0
