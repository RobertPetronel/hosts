echo "AbRobert"
nume=$1
shift
ip=$1
shift
server=$1

# verificare:
ip_corect=$(nslookup "$nume" "$server" | awk '/Address: / {print $2; exit}')

if [[ "$ip_corect" == "$ip" ]]; then
    echo "Corect"
else
    echo "Gresit"
fi
