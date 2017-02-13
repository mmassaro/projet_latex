#                                      _
#                      _o)   __ _  ___/ /__  __ _  (o_
####################   /\\  /  ' \/ _  / _ `/  ' \ //\   #####################
#                      \_v /_/_/_/\_,_/\_, /_/_/_/ v_/
#                                     /___/
#
# Author:       Michel Massaro
# Version :     V0.1
# Date :        30/01/17
# Description : projet for latex
#
##############################################################################

main(){

  # XXX Il faut verifier que la version de bash ou de zsh soit bonne


  if [ -z "$PLTX" ]; then
    PLTX=$PWD
  else
    echo "Projet LaTeX is already installed"
    return 1
  fi

  source $PLTX/lib/get_param.sh

}

main
