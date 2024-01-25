# =============[ VI mode ]=============
bindkey -v
export KEYTIMEOUT=1

##: Yank selected buffer to Clipboard
function vi-yank-wl {
  zle vi-yank
  echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-wl
bindkey -M vicmd 'y' vi-yank-wl

# =============[ Key Quirks ]=============
##: CTRL L R Issues
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
