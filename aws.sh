# AWS Aliases and path settings

pathfirst ~/.local/bin


awsRmAll () {
    # Remove all objects in an AWS bucket
    #
      aws s3 ls s3://$1 | sed 's/.*4 //' | sed 's/^/aws s3 rm s3:\/\/'$1'\//' | tee /dev/tty | cat
}

#

alias awsrmall=awsRmAll


# command line stuff

complete -C aws_completer aws
