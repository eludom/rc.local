# function for interactively selecting anaconda/python3

# add path to the front if not there
anaconda() {
    if [ "$1" == "on" ]; then
        echo  pathfirst $1
	pathfirst /home/gmj/anaconda3/bin
    elif [ "$1" == "off" ]; then
	echo  pathrm /home/gmj/anaconda3/bin
	pathrm /home/gmj/anaconda3/bin
    else
        echo 'usage: anaconda [on|off]'
    fi
}





