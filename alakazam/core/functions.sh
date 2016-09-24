#used to set tab titles in iTerm2 and similar clients
setTerminalTitle() {
    echo -ne "\033]0;"$*"\007"
}
