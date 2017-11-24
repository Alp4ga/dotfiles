#start X at login
if status --is-login
   if test -z "$DISPLAY" -a $XDG_VTNR = 1
      exec startx
   end
end

##
# EXPORTS
##

set -g -x EDITOR "emacs"
set -g -x USER_NICKNAME "Eliott"
set -g -x PAGER "most"
set -g -x PATH $PATH /home/alpaga/bin

##
# IMPORT
##

source /home/alpaga/.config/fish/aliases