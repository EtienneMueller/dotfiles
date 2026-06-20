### ALIASES
alias ll='ls -alh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'            # go back to previous directory
alias brewup='brew update && brew upgrade && brew cleanup'


### PACKAGE MANAGERS & TOOLS
eval "$(/opt/homebrew/bin/brew shellenv)"  # Homebrew


### PATH
export PATH="$HOME/.dotfiles/scripts:$PATH"


### SHELL OPTIONS
setopt INTERACTIVE_COMMENTS  # allow # comments in terminal


### PROMPT
# 1. Enable prompt expansion (CRITICAL for Zsh)
setopt PROMPT_SUBST

# 2. Colors using Zsh's built-in color mapping
autoload -U colors && colors

# 3. The logic function
parse_git_status() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$ "
        return
    fi

    local branch=$(git branch --show-current)
    local status_msg="clean"
    local color="%{$fg[green]%}"

    if [[ -n $(git status --porcelain 2>/dev/null | grep '^??') ]]; then
        status_msg="untracked"
        color="%{$fg[yellow]%}"
    elif [[ -n $(git status --porcelain 2>/dev/null | grep -v '^??') ]]; then
        status_msg="dirty"
        color="%{$fg[red]%}"
    fi

    # Detect whether the repo is local-only or has a remote
    local remote_url=$(git config --get remote.origin.url 2>/dev/null)
    local origin_label
    if [[ -z $remote_url ]]; then
        origin_label="%{$fg[magenta]%}local%{$reset_color%}"
    elif [[ $remote_url == *github.com* ]]; then
        origin_label="%{$fg[cyan]%}github%{$reset_color%}"
    else
        origin_label="%{$fg[cyan]%}remote%{$reset_color%}"
    fi

    echo "%{$fg[green]%}GIT:%{$fg[yellow]%}$branch ${color}${status_msg}%{$reset_color%} ${origin_label} %{$fg[blue]%}%~%{$reset_color%}$ "
}

# 4. Set the prompt to run the function
PROMPT='$(parse_git_status)'
