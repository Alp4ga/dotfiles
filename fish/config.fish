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

set -g -x JAVA_HOME /usr/local/jdk1.8.0_151
set -g -x PATH $PATH $JAVA_HOME/bin

set -g -x ANDROID_HOME /home/alpaga/Documents/Softwars/Android/Sdk
set -g -x PATH $PATH $ANDROID_HOME/tools
set -g -x PATH $PATH $ANDROID_HOME/platform-tools
##
# IMPORT
##

source /home/alpaga/.config/fish/aliases