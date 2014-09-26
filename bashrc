
PATH=/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias annotate='bundle exec annotate -i -m -p before'
alias dbreset='rake db:drop db:create db:migrate db:seed; RAILS_ENV=test rake db:drop db:create db:migrate db:seed'
alias brake='bundle exec rake'
export EDITOR="/usr/bin/gvim"
alias root='ssh -l ubuntu '
alias d='ssh -l deploy '
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

__git_ps2 (){
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        if [ "$b" = "refs/heads/master" ] ; then
          printf "\033[1;31m(%s)\033[0m " "${b##refs/heads/}";
        elif [ "$b" = "refs/heads/develop" ] ; then
          printf "\033[0;33m(%s)\033[0m " "${b##refs/heads/}";
        else
          printf "\033[0;32m(%s)\033[0m " "${b##refs/heads/}";
        fi
    fi
}
PS1=$PS1'$(__git_ps2)\$ '

alias release="git log --pretty=format:'%h - %ci %n%s%n%b%n' --merges --first-parent master..develop > release.txt"
