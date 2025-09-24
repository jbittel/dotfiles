### General
alias ls="eza --long --all"
alias mkdir="mkdir -pv"
alias cat="batcat"
alias xx="exit"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias python='python3'

alias ag='ag --nobreak --nogroup --noheading --column'

alias docker-prune="docker system prune --all --volumes"

alias whatami="lsb_release -a && printf '\n' && uname -a"

### Git
git_main_branch() {
    # Check if main exists and use instead of master; taken from ohmyzsh
    command git rev-parse --git-dir &>/dev/null || return
    local branch
    for branch in main trunk; do
        if command git show-ref -q --verify refs/heads/$branch; then
            echo $branch
            return
        fi
    done
    echo master
}

alias aa="git aa"
alias bb="git bb"
alias cm="git cm"
alias di="git di"
alias ff="git ff"
alias pu="git pu"
alias st="git st"

alias com="git com"
alias rem="git rem"

dctjest() {
    eval ${BASH_ALIASES[dctjs]} ${@#"ui/"}
}

dctjests() {
    eval ${BASH_ALIASES[dctjs]} "-- --updateSnapshot" ${@#"ui/"}
}

uvsh() {
    local venv_name=${1:-'.venv'}
    venv_name=${venv_name//\//}

    local activator="${venv_name}/bin/activate"
    echo "[INFO] Activate Python venv: ${venv_name} (via ${activator})"

    if [[ ! -f ${activator} ]]; then
        echo "[ERROR] Python venv not found: ${venv_name}"
        return
    fi

    . "${activator}"
}

wo() {
    local dir="${HOME}/code/${1}"
    cd "${dir}"
    echo "[INFO] Moving to ${dir}"
    uvsh
}
