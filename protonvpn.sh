# aliases for use with protonvpn

if which protonvpn; then
    info defining protonvpn aliases

    alias pvc='sudo protonvpn c -f && ping -c 3 8.8.8.8 && speedtest'
    alias pvd='sudo protonvpn d'
    alias pvs='sudo protonvpn s'
    alias st=speedtest
fi
