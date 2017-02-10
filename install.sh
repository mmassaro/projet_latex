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
    PLTX=~/.projet_latex
  else
    echo "Projet LaTeX is already installed"
    exit
  fi

  printf "Cloning Projet LaTeX ...\n"
  hash git >/dev/null 2>&1 || {
    echo "ERROR : git is not installed"
    exit 1
  }

  env git clone https://github.com/mmassaro/projet_latex.git $PLTX || {
    printf "ERROR : git clone of projet_latex repo failed\n"
    exit 1
  }

  echo "In order to use the Projet LaTeX in the future, you need to add these lines"
  echo "in your shell config"
  echo "  source $PLTX/lib/get_param.sh"
  echo "  source $PLTX/lib/projet_latex.sh"
}

main
