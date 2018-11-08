#!/bin/sh

instance_name() {
    # Generate a random string, consisting of two lowercase dictionary
    # words joined by a comma, e.g. "detentions-northerly"
    local WORDS="$(shuf -n2 /usr/share/dict/words | sed "s/'s//" | tr "[:upper:]" "[:lower:]" | paste -sd "-")"
    echo "$WORDS"
}

termite --name=$(instance_name)
