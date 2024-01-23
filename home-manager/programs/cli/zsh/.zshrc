# =============[ VI mode ]=============
bindkey -v
export KEYTIMEOUT=1

## VI MODE: Yank selected buffer to Clipboard
function vi-yank-wl {
  zle vi-yank
  echo "$CUTBUFFER" | wl-copy
}
zle -N vi-yank-wl
bindkey -M vicmd 'y' vi-yank-wl
