#!/bin/bash

# author : govlog
# count and sort word frequency from most used to less used from file

# pure bash implementation :

#   _ only bash builtins !
#   _ no pipes !
#   _ no external executable ! 
#   _ no subshell !

declare -A wf

mapfile < words.txt 

for w in ${MAPFILE[*]};{
    [[ ! ${wf[$w]} ]] && wf[$w]=1 || (( wf[$w]++ ))
}

while (( ${#wf[*]} )) ; do

    unset most_f

    for w in ${!wf[@]};{
        f=${wf[$w]}
        (( f>most_f )) && (( most_f=f )) && most_w=$w
    }

    unset wf[$most_w]
    echo $most_w $most_f

done
