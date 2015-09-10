if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

# export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# 2014-07-18 added by h1-the-swan
# Enable colors for the directory listing
alias ls='ls -GFh'
# The 'G' option enables the coloring
# The 'F' option adds '/' for directories, '|' for pipes, '@' for symlinks (and others?)
# The 'h' option formats file sizes in human readable units
#
# Change colors to look better on black background:
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# Use vi key-bindings:
bindkey -v

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

zle -N newtab

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

# Added by JP 2015-09-10
# The following is standard with emacs key bindings, but not with vi key bindings enabled
# http://unix.stackexchange.com/questions/44115/how-do-i-perform-a-reverse-history-search-in-zshs-vi-mode
bindkey "^R" history-incremental-search-backward
# The following should allow the use of up and down arrows (after starting a history search with Control-R)
# http://www.techrepublic.com/blog/linux-and-open-source/enhanced-history-searching-in-zsh/
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
