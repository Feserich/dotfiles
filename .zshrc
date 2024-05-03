# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable file history for zsh commands and some addtional settings
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt appendhistory
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# add all aliases, functions, extra to zsh
# We do this before the following so that all the paths work.
for file in ~/.{aliases,functions,extra}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

# To customize prompt, run `p10k configure` or edit ~/git_repos/dotfiles/.p10k.zsh.
[[ ! -f ~/git_repos/dotfiles/.p10k.zsh ]] || source ~/git_repos/dotfiles/.p10k.zsh

# enable vi navigation in zsh
bindkey -v

# enalbe fzf in zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

