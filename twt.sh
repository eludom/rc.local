# Aliases for using twtxt
#
# See https://github.com/buckket/twtxt
# Also see https://github.com/prologic/twtxt and https://twtxt.net/
#

# twtxt timeline
alias twl='twtxt timeline --ascending'

# twtxt twit
alias twt='twtxt tweet'

# twtxt publish
alias twp='scp ~/twtxt.txt gmj@port111.com:~/public_html/george/'

function twtp () {
    # twtxt twit and post
    twt "$*"
    twp
}
