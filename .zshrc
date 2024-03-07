HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

setopt appendhistory
setopt hist_ignore_space

if [ "$(tty)" = "/dev/tty1" ]; then
  sway
fi

# Custom Aliases

# alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ssh='TERM=xterm-256color ssh'
alias vim='nvim'
alias ls='eza --git --color=auto --group-directories-first'
alias vimconf='vim ~/.config/nvim/init.vim'
alias swayconf='vim ~/.config/sway/config'
alias termconf='vim ~/.config/foot/foot.ini'
#alias rootconf='vim ~/.config/rootbar/config'
#alias rootstyle='vim ~/.config/rootbar/style.css'
#alias rootrestart='pkill -10 rootbar'
alias woficonf='vim ~/.config/wofi/config'
alias wofistyle='vim ~/.config/wofi/style.css'

alias maxbright='brightnessctl set $(brightnessctl max)'
#alias socks='ssh -nNq -D 8081 linode'
#alias irc='ssh linode -t screen -D -RR weechat weechat'
#alias botany='ssh team -t screen -D -RR botany'

alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias push='git remote | xargs -L1 git push --all'
alias ypush='yadm remote | xargs -L1 yadm push --all'

# Other stuffs

upload () {
  local file=$(basename $1)
  local url="https://f.salejandro.me/$file"
  local wm=$(wmctrl -m | grep -oP "(?<=^Name: ).*")

  if [ -z "$file" ]
  then
    echo "usage: upload <file>"
    return 22
  fi

  if [ ! -f $1 ]; then
    echo "file not found"
    :
  else
    scp $1 linode:~/f
    if [[ "$wm" = "wlroots wm" || "$wm" = "GNOME Shell" ]]; then
      printf "$url" | wl-copy -n
    else
      printf "$url" | xclip -se c
    fi

    notify-send "$url"
    echo "$url"
  fi

}

# Custom Enviroment Variables

export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin"
export PF_INFO="ascii os kernel uptime pkgs memory wm"
export PF_ASCII="linux"
export EDITOR='nvim'

source $HOME/.zplugrc

