# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize brew zsh-syntax-highlighting zsh-autosuggestions web-search zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


function xtr {
  if [ -z "$1" ]; then
	# display usage if no parameters given
	echo "Usage: xtr <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
	if [[ -f "$1" ]]; then
	  NAME=${1%.*}
	  #mkdir $NAME && cd $NAME
	  case "$1" in
		*.tar.bz2)   tar xvjf ./"$1"    ;;
		*.tar.gz)    tar xvzf ./"$1"    ;;
		*.tar.xz)    tar xvJf ./"$1"    ;;
		*.lzma)      unlzma ./"$1"      ;;
		*.bz2)       bunzip2 ./"$1"     ;;
		*.rar)       unrar x -ad ./"$1" ;;
		*.gz)        gunzip ./"$1"      ;;
		*.tar)       tar xvf ./"$1"     ;;
		*.tbz2)      tar xvjf ./"$1"    ;;
		*.tgz)       tar xvzf ./"$1"    ;;
		*.zip)       unzip ./"$1"       ;;
		*.Z)         uncompress ./"$1"  ;;
		*.7z)        7z x ./"$1"        ;;
		*.xz)        unxz ./"$1"        ;;
		*.exe)       cabextract ./"$1"  ;;
		*)           >&2 echo "xtr: '$1' - unknown archive method" ;;
	  esac
	else
	  >&2 echo "'$1' - file does not exist"
	  return 1
	fi
  fi
}

# install bat, fzf, zoxide
# eval "$(zoxide init zsh)"
alias vim=nvim
alias amindi=amin
alias amin='curl "wttr.in/Lausanne?lang=en"'
alias sed='gsed'
alias opti='ssh zuka@m54bf64914820.dyn.epfl.ch -p 22'
alias ddgo=ddg
alias -g ...='../..'
alias ls="ls -h --color='auto'"
alias lsa="ls -a"
alias please='sudo $(fc -ln -1)'
alias pls='sudo $(fc -ln -1)'
alias gst='git status'
alias c='clear'
# alias cat='bat'
alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range :500 {}"'

bindkey "\e\e" sudo-command-line                  # [Esc] [Esc] add sudo 
      zle -N sudo-command-line
      sudo-command-line() {
            [[ -z $BUFFER ]] && zle up-history
            if [[ $BUFFER == sudo\ * ]]; then
                  LBUFFER="${LBUFFER#sudo }"
            else
                  LBUFFER="sudo $LBUFFER"
            fi
      }


if [[ -z $TMUX ]]; then
  function ts {
    local sessions=$(tmux list-sessions 2>/dev/null | sort -n)
    local actions="q: Exit\n${sessions}\nr: Most recent session\nn: New session"
    local selection=$(echo -e "$actions" | fzf -i --exact -d ':' -n 1 --tac --no-sort | awk -F ':' '{print $1}')
    case $selection in
      'n')    tmux new >/dev/null 2>&1 ;;
      'r')    tmux attach >/dev/null 2>&1 ;;
      'q'|'') return 0 ;;
      *)      tmux attach -t $selection >/dev/null 2>&1 ;;
    esac
    ts
  }
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# Really?
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export OPENAI_API_KEY=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
export PATH=/Users/zuka/.local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
