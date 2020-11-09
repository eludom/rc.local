# Aliases for viewing the newest file in a directoy

alias tfnf='tail -f `ls -1t | head -1`' # tail follow newest file
alias tnf='tail `ls -1t | head -1`'    # tail newest file
alias hnf='head `ls -1t | head -1`'    # head newest file
alias lnf='less `ls -1t | head -1`'    # less newest file
alias cnf='cat `ls -1t | head -1`'     # cat newest file
alias lsnf='ls -1t | head -1'          # ls newest file
