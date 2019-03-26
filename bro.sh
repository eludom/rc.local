# source this to set up bro env vars, aliases etc.

export PATH=/usr/local/bro/bin:$PATH

# alias to look at LONG bro logs in a sensible fashion
# arrow keys will scroll left and right

broLessFunc() {
    #Alias for listing or viewing bro logs
    #
    #  $1 = log name
    #  $2 = grep string (optional)
    #
    # "bl"              - list current bro logs
    # "bl dns.log"      - view current dns.log
    # "bl /usr/local/bro/logs/2018-12-16/dns.04:44:12-05:00:00.log.gz"
    #			- view a specific log
    #
    # Note: arrow keys will work for scrolling left/right

    # set up grep filter if $2 provided

    if [ -z "$2" ]; then
        grep=cat
    else
        grep="grep $2"
    fi

    # list current bro logs if no argument
    if [ -z "$1" ]; then
        ls -lt /usr/local/bro/logs/current/*
    else

        # use full path if given
        if [ -f $1 ]; then
            logfile=$1
        else
            # Default to viewing current bro log
            logfile=/usr/local/bro/logs/current/$1
        fi

        # use zcat if logfile ends in .gz
        if [[ $logfile == *.gz ]]; then
            cat=zcat
        else
            cat=cat
        fi

        # cat the logfile, pretty-printing columns and use less
        if [ -f $logfile ]; then
            $cat $logfile | sed -e 's/\#fields//' -e 's/\#types//' | $grep | column -t | less -RS
        else
            echo $logfile does not exist
        fi
    fi
}

# define an alias for it
alias bl=broLessFunc
