# Set up default bro path
# May want to add to /etc/environment and/or other places
#export PATH=/usr/local/bro/bin:$PATH

# alias to look at LONG bro logs in a sensible fashion
# arrow keys will scroll left and right
broLessFunc() {
  #do things with parameters like $1 such as
  zcat $1 | sed -e 's/\#fields//' -e 's/\#types//' | column -t | less -RS
}
alias bl=broLessFunc
