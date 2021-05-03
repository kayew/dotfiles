# Lines configured by zsh-newuser-install
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

setopt hist_ignore_space

if [ "$(tty)" = "/dev/tty1" ]; then
  sway
fi

# Custom Aliases

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ssh='TERM=xterm-256color ssh'
alias vim='nvim'
alias vimconf='vim ~/.config/nvim/init.vim'
alias ls='exa --git --color=auto --group-directories-first'
alias swayconf='vim ~/.config/sway/config'
alias termconf='vim ~/.config/termite/config'
alias rootconf='vim ~/.config/rootbar/config'
alias rootstyle='vim ~/.config/rootbar/style.css'
alias rootrestart='pkill -10 rootbar'
alias woficonf='vim ~/.config/wofi/config'
alias wofistyle='vim ~/.config/wofi/style.css'

alias gaytrix='cmatrix | lolcat'
alias linode='ssh linode'
alias maxbright='brightnessctl set $(brightnessctl max)'
alias socks='ssh -nNq -D 8081 linode'
alias irc='ssh linode -t screen -D -RR weechat weechat'
alias botany='ssh team -t screen -D -RR botany'
alias mc-server='ssh minecraft -t screen -r 7189'
alias linode-lish='ssh -t kaewhyes@lish-newark.linode.com salejandro.me'
alias spacecore='ssh spacecore'

alias getip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias push='git remote | xargs -L1 git push --all'

# Other stuffs
launch-gnome(){
  MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
}

gscheme(){
  curl "$1" | grep -o "[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]" > $2
}

truecolortest () {
  awk 'BEGIN{
  s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
  for (colnum = 0; colnum<77; colnum++) {
    r = 255-(colnum*255/76);
    g = (colnum*510/76);
    b = (colnum*255/76);
    if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum+1,1);
    }
  printf "\n";
}'
}

random_scheme() {
  for _ in {1..16}
  do
    echo "#$(openssl rand -hex 3)"
  done | paleta
  blocks
}

sedcheat () {
  echo '==>sed quick guide<==
  :  # label
  =  # line_number
  a  # append_text_to_stdout_after_flush
  b  # branch_unconditional
  c  # range_change
  d  # pattern_delete_top/cycle
  D  # pattern_ltrunc(line+nl)_top/cycle
  g  # pattern=hold
  G  # pattern+=nl+hold
  h  # hold=pattern
  H  # hold+=nl+pattern
  i  # insert_text_to_stdout_now
  l  # pattern_list
  n  # pattern_flush=nextline_continue
  N  # pattern+=nl+nextline
  p  # pattern_print
  P  # pattern_first_line_print
  q  # flush_quit
  r  # append_file_to_stdout_after_flush
  s  # substitute
  t  # branch_on_substitute
  w  # append_pattern_to_file_now
  x  # swap_pattern_and_hold
  y  # transform_chars '
}

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

shitpost() {
  for c in `echo $* | fold -w 1`; do
    case "$c" in
      ' ') echo -n "  " ;;
      *) echo -n ":regional_indicator_$c: " ;;
    esac
  done
}

zoomlaunch() {
  cd /opt/zoom/
  unset QT_QPA_PLATFORM
  firejail ./ZoomLauncher
}
# Custom Enviroment Variables

export PLAN9=/home/sebastian/plan9
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/bin:$PLAN9/bin:$GOPATH/bin:$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/opt/GNAT/2020/bin:$HOME/.nimble/bin"
export GPG_TTY=$(tty)
export PF_INFO="ascii title os kernel uptime pkgs memory wm pallete"
export PF_ASCII="linux"
export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='kitty'
export OPENCV_LOG_LEVEL=ERROR
export MOZ_DISABLE_GMP_SANDBOX=1
export NNTPSERVER="news.tilde.club:119"

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
