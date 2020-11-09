# source this.
# Set Java HOME per location of javac

# Helper functions
PROG=`basename "$0" | tr -d '\n'`

function info()  { echo ${PROG}\: info: "$@" 1>&2; }
function warn()  { echo ${PROG}\: warning: "$@" 1>&2; }
function error() { echo ${PROG}\: error: "$@" 1>&2; }
function debug() { [[ -v DEBUG ]] && echo ${PROG}\: debug: "$@" 1>&2 || true ; }
function die()   { echo ${PROG}\: fatal: "$@" 1>&2 && exit 1; }


if [ -z "$JAVA_HOME" ]; then
    JAVA_PATH=$(which javac)

    if [ -z "$JAVA_PATH" ]; then
        unset JAVA_PATH
        #warn "javac not installed."
    else
        export JAVA_HOME=$(dirname $(dirname $(readlink -f "$JAVA_PATH")))
    fi
fi
