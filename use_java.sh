# Set Java HOME per location of javac
[ ! -z "$JAVA_HOME" ] || export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
