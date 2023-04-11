# Export PATH
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
                                                                                                                                                                                                                                                                                                                                                                                           
# alias
alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vim='nvim'
alias s='ssh'

# git alias


# kube alias


#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=14'


# Select all suggestion instead of top on result only
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
bindkey $key[Up] up-line-or-history
bindkey $key[Down] down-line-or-history


##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt EXTENDED_HISTORY

# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal


# git state
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red  
#PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f %# '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

precmd() { vcs_info }


# Prompt
PROMPT="%F{45}┌[%f%F{45}%m%f%F{45}]─[%f%F{77}%D{%H:%M:%S-%d/%m/%y}%f%F{45}]─[%f%F{77}%d%f%F{45}]%f"$' %F{45}${vcs_info_msg_0_}%f \n'"%F{45}└╼%f%F{250}$USER%f%F{250}$%f "

# Tmux
if [ -z "$TMUX"  ] 
then 
  tmux attach -t tmux-session || tmux new -s tmux-session
fi

# ssh -t -p 22 user@hostname "tmux attach -t spauli-tmux || tmux new -s spauli-tmux"

#function tmux-connect {
#       TERM=xterm-256color ssh -p ${3:-22} $1$2 -t "tmux new-session -s $1 || tmux attach-session -t $1"
#}


# SSH-Agent
#if [ -z "$SSH_AUTH_SOCK" ] ; then
#  eval `ssh-agent -s` > /dev/null 2>&1
#  ssh-add ~/.ssh/id_rsa  
#fi
#