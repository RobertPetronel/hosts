#!/bin/bash

cat "/etc/hosts" | while IFS= read -r linie; do
    if [[ $linie == \#* || -z $linie ]]; then
        continue
    fi
    read -r adresa domeniu _ <<< "$linie"
    adresa_corecta=$(nslookup "$domeniu" 8.8.8.8 | awk '/Address: / {print $2; exit}')
    if [[ -z "$adresa_corecta" ]]; then
        continue
    fi
    if [[ "$adresa" != "$adresa_corecta" ]]; then
        echo "Bogus IP for $domeniu in /etc/hosts"
    fi
done