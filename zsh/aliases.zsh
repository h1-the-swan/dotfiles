alias reload!='. ~/.zshrc'

# 2015-07-18 added by h1-the-swan
# alias httpserver="python -m SimpleHTTPServer"

# 2015-07-27 added by h1-the-swan
# http://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
function httpserver() { 
    http-server || 
    {
	    echo "http-server could not be run. Do you have node.js and http-server installed? Trying Python's SimpleHTTPServer instead" ;
	    python -m SimpleHTTPServer; 
    }
}
# Add the above function to FPATH
fpath=( httpserver "${fpath[@]}" )
