#!/bin/sh

DICTIONARY_PATH="/usr/share/dict/words"

instance_name() {
    # Generate a random string, consisting of two lowercase dictionary
    # words joined by a comma, e.g. "detentions-northerly"
    local WORDS=$(shuf -n2 $DICTIONARY_PATH | sed "s/'s//" | tr "[:upper:]" "[:lower:]" | paste -sd "-")
    echo "$WORDS"
}

instance_number() {
    # Generate a random two digit zero padded number
    local NUMBER=$(seq -w 0 99 | shuf -n 1)
    echo "$NUMBER"
}

termite --name="$(instance_name):$(instance_number)"
