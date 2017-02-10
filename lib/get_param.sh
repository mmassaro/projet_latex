# vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:
#
#                                   _      _
#                   _o)   __ _  ___/ /__ _/ /_  __ _  (o_
#################   /\\  /  ' \/ _  / _ `/ _  \/  ' \ //\   ##################
#                   \_v /_/_/_/\_,_/\_, /_/ /_/_/_/_/ v_/
#                                  /___/
#
# Author:       Michel Massaro
# Version :     V1.0
# Date :        20/01/17
# Description : 
#
#
##############################################################################


# XXX Bash/ksh : array from 0 !!! Zsh and other array from 1
# XXX KSH = meme traitement que bash
# XXX Deux choses prioritaires.
# 1: la fonction recherche doit rechercher exactement les termes
# 2: il faut verifier que les champs entrés sont bons
# XXX Le declare -g ne fonctionne pas avec les anciennes version de bash


bold=$(tput bold)
normal=$(tput sgr0)


function set_desc(){
    if [ "$1" = "add" ]; then
        if [ -z ${func_desc+x} ]; then
            func_desc=()
        fi

        _add_desc "$2"
    elif [ "$1" = "remove" ]; then
        if [ -z ${func_desc+x} ]; then
            echo "There is no function to set"
        else
            _remove_desc $2
        fi
    else
        echo "autre"
    fi
}


function set_opt_list(){
    if [ "$1" = "add" ]; then
        if [ -z ${opt_list+x} ]; then
            opt_list=()
        fi
        if [ -z ${opt_desc+x} ]; then
            opt_desc=()
        fi

        _add_opt $2 "$3"
    elif [ "$1" = "remove" ]; then
        if [ -z ${opt_list+x} ] || [ -z ${opt_desc+x} ]; then
            echo "There is no option list to set"
        else
            _remove_opt $2
        fi
    else
        echo "autre"
    fi
}

function _add_opt(){
    opt_list+=($1)
    opt_desc+=("$2")
}

function _add_desc(){
    func_desc+=("$1")
}


function _remove_desc(){
    if [ -z ${func_desc+x} ]; then
        echo "Error : Cannot remove option"
    else
        _get_index $1
        # XXX il faudrait pouvoir supprimer les exemples sans tout supprimer
        unset func_desc
    fi
}



function _remove_opt(){
    if [ -z ${opt_list+x} ] || [ -z ${opt_desc+x} ]; then
        echo "Error : Cannot remove option"
    else
        _get_index $1
        # XXX verifier si on a trouve
        if [ -z $BASH_SOURCE]; then
            im1=$index
            ip1=$((index+2))
            end=${#opt_list[@]}
        else
            im1=$((index-1))
            ip1=$((index+1))
            end=${#opt_list[@]}
            end=$((end-1))
        fi

        opt_list=(${opt_list[1,$im1]} ${opt_list[$ip1,$end]})
        opt_desc=(${opt_desc[1,$im1]} ${opt_desc[$ip1,$end]})
    fi
}


function _get_index(){
    index="$(echo ${opt_list[@]/$1//} | cut -d/ -f1 | wc -w | tr -d ' ')"
    last=${#opt_list[@]}
    if [ "$index" = "$last" ]; then
        echo "Error : Option $1 not found"
        # XXX valeur de retour pour l'erreur
        index=1000
    fi
}


function _get_index_silent(){
    index="$(echo ${opt_list[@]/$1//} | cut -d/ -f1 | wc -w | tr -d ' ')"
    last=${#opt_list[@]}
    if [ "$index" = "$last" ]; then
        index=1000
    fi
}



function _display_desc(){
    if [ -z ${func_desc+x} ]; then
        echo "Error : There is no description to display"
    else
        echo "${bold}DESCRIPTION${normal}"
        if [ -z $BASH_SOURCE ]; then
            _columnize_description 40 ${func_desc[1]}
        else
            _columnize_description 40 ${func_desc[0]}
        fi

        echo "${bold}EXAMPLE(S)${normal}"
        if [ -z $BASH_SOURCE ]; then
            for ((i=2; i<=${#func_desc[@]}; i++))
            do
                _columnize_example 40 ${func_desc[$i]}
            done
        else
            for ((i=1; i<${#func_desc[@]}; i++))
            do
                _columnize_example 40 "${func_desc[$i]}"
            done
        fi
    fi
}


function _display_opt(){
    if [ -z ${opt_list+x} ] || [ -z ${opt_desc+x} ]; then
        echo "Error : There is no option to display"
    else
        echo "${bold}OPTION(S)${normal}"
        if [ -z $BASH_SOURCE ]; then
            for ((i=1; i<=${#opt_list[@]}; i++))
            do
                _columnize_option 40 ${opt_list[$i]} ${opt_desc[$i]}
            done
        else
            for ((i=0; i<${#opt_list[@]}; i++))
            do
                _columnize_option 40 ${opt_list[$i]} "${opt_desc[$i]}"
            done
        fi
    fi
}


function display_man(){
    if [ -f "$1" ]; then
    #if [ -f "param_$1.sh" ]; then
        source $1
        #source param_$1.sh
        _display_desc
        _display_opt
        unset opt_list
        unset opt_desc
        unset func_desc
    else
        echo "There is no man entry for $1"
    fi
}




_columnize_option () {
    indent=$1;
    size=$(($(tput cols)-indent));
    option="$2";
    value=$3;
    while [ $(echo -n $value| wc -c) -gt 0 ] ;
    do
        printf "        ";
        tput bold;
        printf "%-11s" "$option";
        tput sgr0;
        printf "%-${indent}s\n" "${value:0:$size}";
        option="";
        value=${value:$size};
    done
}

_columnize_example () {
    indent=$1;
    size=$(($(tput cols)-indent));
    value=$2;
    symb="$ "
    while [ $(echo -n $value| wc -c) -gt 0 ] ;
    do
        printf "        ";
        printf "$symb";
        printf "%-${indent}s\n" "${value:0:$size}";
        symb="  "
        value=${value:$size};
    done
}

_columnize_description () {
    indent=$1;
    size=$(($(tput cols)-indent));
    value=$2;
    while [ $(echo -n $value| wc -c) -gt 0 ] ;
    do
        printf "        ";
        printf "%-${indent}s\n" "${value:0:$size}";
        value=${value:$size};
    done
}


function set_args(){
    array=()
    for args in $@;
    do
        array+=("$args")
    done

    export _SET_DEFAULT_="1"
    if [ -z $BASH_SOURCE ]; then
        source ${array[1]}
        #source param_${array[1]}.sh
    else
        source ${array[0]}
        #source param_${array[0]}.sh
    fi
    unset _SET_DEFAULT_

    if [ -z $BASH_SOURCE ]; then
        for ((i=1; i<=${#array[@]}; i++))
        do
            _get_index_silent ${array[$i]}
            if [[ $index != 1000 ]]; then
                opt=$(echo ${opt_list[$((index+1))]} | sed 's/-/m/')
                ptr_opt="$opt"
                declare -g "$ptr_opt"="${array[$((i+1))]}"
            fi
        done
    else
        for ((i=0; i<${#array[@]}; i++))
        do
            _get_index_silent ${array[$i]}
            if [[ $index != 1000 ]]; then
                opt=$(echo ${opt_list[$((index))]} | sed 's/-/m/')
                ptr_opt="$opt"
                declare -g "$ptr_opt"="${array[$((i+1))]}"
            fi
        done
    fi

    unset ptr_opt
    unset opt
    unset opt_desc
    unset opt_list
    unset func_desc
}






function test_set_params(){
    set_args $@
    echo $mtoto $mtutu $mtiti $mtata
}









