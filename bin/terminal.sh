#!/usr/bin/env bash
#
# Launches a terminal window with a unique instance name to provide
# a mnemonic device for keeping track of it.
#
set -o errexit
set -o nounset
set -o pipefail

readonly EMOTIONS_LIST="${HOME}/.dotfiles/etc/word-list-emotions.txt"
readonly NOUNS_LIST="${HOME}/.dotfiles/etc/word-list-nouns.txt"

# Get a random lowercase word from the provided wordlist
_get_word() {
    local wordlist="${1:-}"
    local word="$(shuf -n1 "${wordlist}" | tr "[:upper:]" "[:lower:]")"
    echo "${word}"
}

# Generate a random two digit zero-padded number
_get_number() {
    local number="$(seq -w 0 99 | shuf -n 1)"
    echo "${number}"
}

INSTANCE_NAME="$(_get_word ${EMOTIONS_LIST})-$(_get_word ${NOUNS_LIST})"

termite --name="${INSTANCE_NAME}"
