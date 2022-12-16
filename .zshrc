
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/tranthien/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GOPATH=/Users/tranthien/Me/SelfStudy/golang

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tranthien/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tranthien/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tranthien/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tranthien/Desktop/google-cloud-sdk/completion.zsh.inc'; fi
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
