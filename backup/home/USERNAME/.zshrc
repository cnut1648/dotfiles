# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

setopt append_history
setopt nomatch   # when no match print error
setopt extended_glob

autoload zmv # smart rename
alias zcp='zmv -C' zln='zmv -L'

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export EDITOR="nvim"

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias n='nvim'
alias diff='kitty +kitten diff'
alias img='kitty +kitten icat'

alias -g L='| less'
alias ipython=${HOME}/"miniconda3/envs/ds/bin/ipython"

export LESS='--quit-if-one-screen --mouse --wheel-lines=3 --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# use zsh
TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'


# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	###### default
	git # alias for git
	fancy-ctrl-z # <ctrl-z> twice to bring back bg jobs; no `fg` needed anymore
	extract # use `x` to extract
	colored-man-pages # man in a colored format
	sudo # press <ESC> twice to prepend sudo
	rand-quote # use `quote` to create random quote, below define <Ctrl-Q> to display
	dirhistory # <Alt-arrow> to navigate through directory
	ripgrep # completion for rg
	###### custom
	# see README of https://github.com/cnut1648/dotfiles for url
	fast-syntax-highlighting # add syntax highlight
	k # use `k` to list files, replace `ls -l`
	autoupdate # autoupdate custom plugins for @UPDATE_ZSH_DAYS
	fzf-tab # Replace zsh's default completion selection menu with fzf!
	you-should-use # remind of alias
	zsh-autosuggestions # show suggestions based on history
	zsh-completions # enhanced completion for `zsh` functions
    fzf-dir-navigator # ctrl-f to fzf -> cd
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'

# for fasd
eval "$(fasd --init auto)"
# should not use fasd plugin since it overwrite zoxide's `z`
# use `v` (file) and `o` (dir) to edit/open in file manager
alias v='f -e "$EDITOR"'
alias o='a -e xdg-open'
# for zoxide
eval "$(zoxide init zsh)"
# you-should-use hardcore mode
export YSU_HARDCORE=0

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

# prevent neovim ctrl+j insert navigation
bindkey -r "^J"

# fzf-Dir-navigator overwrite <C-F>, use <Alt-F> instead
bindkey "^F" forward-char
bindkey "^[f" fzf-dir-navigator

# bind <C-P> to recall last command w/o argument
# e.g. last command = `locate ABC CEF`
# <C-P> gives `locate `
bindkey -s '^P' '\e0\e_ '

print_quote() {echo;echo $(quote); zle reset-prompt}
# create new widget
zle -N print_quote
# bindkey to replace Ctrl+Q to quote
bindkey "^Q" print_quote

run_ranger () {
    echo
    ranger --choosedir=$HOME/.config/.rangerdir < $TTY
    LASTDIR=`< $HOME/.config/.rangerdir`
    cd "$LASTDIR"
    # zle reset-prompt won't refresh if using powerlevel10k theme
    zle accept-line
}
zle -N run_ranger
bindkey '^K' run_ranger

# bindkey "^H" backward-char
# bindkey "^L" forward-char # remove clear-screen widget
# bindkey "^F" clear-screen

source /usr/share/fzf/completion.zsh
# use fzf-tab instead of predefined keybind
# source /usr/share/fzf/key-bindings.zsh
export FZF_TAB_OPTS=(
    --ansi   # Enable ANSI color support, necessary for showing groups
    --expect='/' # For continuous completion
    '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
    --nth=2,3 --delimiter='\x00'  # Don't search FZF_TAB_PREFIX
    --layout=reverse --height=70%
    --tiebreak=begin -m --bind=tab:down,change:top,ctrl-space:toggle --cycle
    '--query=$query'   # $query will be expanded to query string at runtime.
    '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
    )

alias em=${HOME}'/.emacs.d/doom-emacs/bin/doom run'
alias doom=${HOME}'/.emacs.d/doom-emacs/bin/doom'


# cuda
export CUDA_HOME=/opt/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib64
export PATH=$PATH:$CUDA_HOME/bin

# android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME

# tomcat 8
export TOMCAT_HOME=/usr/share/tomcat8

# spark
export PYSPARK_DRIVER_PYTHON=${HOME}'/miniconda3/envs/ds/bin/python'
export PYSPARK_PYTHON=${HOME}'/miniconda3/envs/ds/bin/python'

# install from https://github.com/darkhz/adbtuifm
alias adbtui='/home/chris/go/bin/adbtuifm --remote=/sdcard/books --local=/home/chris/Downloads --mode ADB'
# alias rslsync='rslsync --log /home/chris/.config/rslsync/rlog --config /home/chris/.config/rslsync/rslsync.conf'

# init mcfly to overload Ctrl-R
eval "$(mcfly init zsh)"

alias ls="eza --icons=always "
alias cat="bat"

export BUNDLE_PATH=~/.gems

# not let zsh store failed commands
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }
