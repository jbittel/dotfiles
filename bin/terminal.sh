#!/bin/sh

EMOTIONS_LIST="$HOME/.dotfiles/etc/word-list-emotions.txt"
NOUNS_LIST="$HOME/.dotfiles/etc/word-list-nouns.txt"

_get_word() {
	# Get a random lowercase word from the provided wordlist
    local word="$(shuf -n1 $1 | tr "[:upper:]" "[:lower:]")"
    echo "$word"
}

_get_number() {
    # Generate a random two digit zero padded number
    local number=$(seq -w 0 99 | shuf -n 1)
    echo "$number"
}

INSTANCE_NAME="$(_get_word $EMOTIONS_LIST)-$(_get_word $NOUNS_LIST)"

termite --name=$INSTANCE_NAME
