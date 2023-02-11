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

# =============[ Plugins Specific Configuration ]=============
zstyle ':prezto:module:editor' key-bindings 'vi'

# =============[ Environment Variables ]=============
# Unclutter direnv verbosity
export DIRENV_LOG_FORMAT
