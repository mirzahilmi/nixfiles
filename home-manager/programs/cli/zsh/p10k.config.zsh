###################################
if [[ $TERM_PROGRAM == 'vscode' ]] && [[ $TMUX == '' ]]; then
  tmux attach 
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/.config/zimfw/modules/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/p10k.zsh
###################################