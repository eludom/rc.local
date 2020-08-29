# Functions and aliases for working wtih pass(1)
#
# Usage:
#   source passfuncs.sh
#
#     passurl pass-name  # print url
#     passuser pass-name # print user
#     passopen pass-name # print username, copy pasword to clipboard, open URL
#


# define browser to use
export passBrowser=brave-browser

passurlFunc () {
    # print the URL for a password stored in pass
    #
    # Assumes the URL is stored in a line like:
    #
    #   url: https://example.com

    pass $1 | grep -i '^url:' | sed 's/^[ \t]*url:[ \t]*//i'
}

passuserFunc () {
    # print the username for a password stored in pass
    #
    # Assumes the username is stored in a line like:
    #
    #   username: FOO

    pass $1 | grep -i '^username:' | sed 's/^[ \t]*username:[ \t]*//i'
}

passopenFunc () {
    # Print username, copy password to clipboard, open url in browser
    #
    # Usage: passopenFunc username [browser]
    #
    # Assumes the URL is stored in a line like:
    #
    #   username: FOO

    if [[ -z "${2}" ]]; then
        BROWSER="$passBrowser"
    else
        BROWSER="${2}"
    fi

    echo -n username: " "
    passuserFunc $1
    pass -c $1
    $BROWSER `passurl $1` &
}

passCopyFunc () {
    # Print username, copy password to clipboard
    #
    # Usage: passCopyFunc username
    #
    # Assumes the URL is stored in a line like:
    #
    #   username: FOO

    echo -n username: " "
    passuserFunc $1
    pass -c $1
}

alias passurl=passurlFunc
alias passc=passCopyFunc
alias passuser=passuserFunc
alias passopen=passopenFunc


#
# THIS IS NOT QUITE DEBUGGED
#
function passpath {
    #set -e -u
    # Print the path for string matched by pass-find
    #
    # This basically undoes the output of tree(1)
    # and rolls it into a '/' separated path
    # so that I can use it with things like "pass -c FOO"
    #
    # Usage passpath PATH
    #
    #

    # Make sure we have an argument

    if [ $# -eq 0 ]
    then
        echo "Usage: passpath NAME"
    else
        # if there is more than one match, print the tree
        count=`pass find $1 | grep $1 | grep -v "Search Term" | wc -l`

        if [ "$count" -gt "1" ]; then
            pass find $1
        else
            # only one patch, print the path
            pass find $1 | #
                grep -v Terms | # get rid of terms #
                tr '\n' '/' | # \n to /
                LC_ALL=C tr -dc '\0-\177' | # get rid of all non-ascii
                tr -d ' ' | # no spaces
                sed 's/\/$/\n/'  #fina / becomes newline
        fi # more than one match
    fi # no argument
}
