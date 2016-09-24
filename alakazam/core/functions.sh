#used to actually display .motd and whatnot
display() {
  if [ -e ~/houdini/${motdLeft} ]; then
    export GREP_COLOR=35
    paste ~/houdini/${motdLeft} | egrep --color -A5 "[^\"PKXYdb8\.\+\-]"
    export GREP_COLOR='1;31' # set back to default
  fi
}

#used to set tab titles in iTerm2 and similar clients
setTerminalTitle() {
    echo -ne "\033]0;"$*"\007"
}
