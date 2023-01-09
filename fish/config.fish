if status is-interactive
    # Commands to run in interactive sessions can go here
	pokemon-colorscripts -r --no-title &
	# starship init fish | source &
	thefuck --alias | source &
	~/.config/fish/tty.sh &
end


set -l teal 94e2d5
set -l flamingo f2cdcd
set -l mauve cba6f7
set -l pink f5c2e7
set -l red f38ba8
set -l peach fab387
set -l green a6e3a1
set -l yellow f9e2af
set -l blue 89b4fa
# set -l gray 1f1d2e
set -l gray 4ea13b
set -l black 191724
    
# Completion Pager Colors
set -g fish_pager_color_progress $gray
set -g fish_pager_color_prefix $mauve
set -g fish_pager_color_completion $peach
set -g fish_pager_color_description $gray

# Some config
set -g fish_greeting

# Git config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '✚'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_upstream_ahead ''
set -g __fish_git_prompt_char_upstream_behind ''
set -g __fish_git_prompt_char_upstream_diverged 'ﱟ'
set -g __fish_git_prompt_char_upstream_equal ''
set -g __fish_git_prompt_char_upstream_prefix ''''


set -g man_blink -o $teal
set -g man_bold -o $pink
set -g man_standout -b $gray
set -g man_underline -u $blue


# Directory abbreviations
# abbr -a -g l 'ls'
# abbr -a -g la 'ls -a'
# abbr -a -g ll 'ls -l'
# abbr -a -g lal 'ls -al'
abbr -a -g d 'dirs'
abbr -a -g ho 'cd $HOME'


# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Exports
export VISUAL="vim"
export EDITOR="$VISUAL"

# Term
switch "$TERM_EMULATOR"
case '*kitty*'
	export TERM='xterm-kitty'
case '*'
	export TERM='xterm-256color'
end


# User abbreviations
abbr -a -g ytmp3 'youtube-dl --extract-audio --audio-format mp3'				# Convert/Download YT videos as mp3
abbr -a -g cls 'clear'																								# Clear
abbr -a -g h 'history'																								# Show history
abbr -a -g upd 'paru -Syu --noconfirm'																								# Update everything
abbr -a -g please 'sudo'																						# Polite way to sudo
abbr -a -g fucking 'sudo'																						# Rude way to sudo
abbr -a -g sayonara 'shutdown now'																	# Epic way to shutdown
abbr -a -g stahp 'shutdown now'																		# Panik - stonk man
abbr -a -g ar 'echo "awesome.restart()" | awesome-client'							# Reload AwesomeWM
abbr -a -g shinei 'kill -9'																						# Kill ala DIO
abbr -a -g kv 'kill -9 (pgrep vlc)'																			# Kill zombie vlc
abbr -a -g priv 'fish --private'																				# Fish incognito mode
abbr -a -g sshon 'sudo systemctl start sshd.service'										# Start ssh service
abbr -a -g sshoff 'sudo systemctl stop sshd.service'										# Stop ssh service
abbr -a -g untar 'tar -zxvf'																					# Untar
abbr -a -g genpass 'openssl rand -base64 20'													# Generate a random, 20-charactered password
abbr -a -g sha 'shasum -a 256'																			# Test checksum
abbr -a -g cn 'ping -c 5 8.8.8.8'																			# Ping google, checking network
abbr -a -g ipe 'curl ifconfig.co'																				# Get external IP address
abbr -a -g ips 'ip link show'																					# Get network interfaces information
abbr -a -g wloff 'rfkill block wlan'																			# Block wlan, killing wifi connection
abbr -a -g wlon 'rfkill unblock wlan'																		# Unblock wlan, start wifi connection
abbr -a -g ff 'firefox'																								#

# Source plugins
# Useful plugins: archlinux bang-bang cd colorman sudope vcs
if test -d "$HOME/.local/share/omf/pkg/colorman/"
	source ~/.local/share/omf/pkg/colorman/init.fish
end

# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

function wa
    set -f APPID "6HV6YJ-QGK36VKQQJ" # Get one at https://products.wolframalpha.com/api/
    echo $argv | string escape --style=url | read question_string
    set -f url "https://api.wolframalpha.com/v1/result?appid="$APPID"&i="$question_string
    curl -s $url
end

# Get terminal emulator
# set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')

# Neofetch
# switch "$TERM_EMULATOR"
# case '*kitty*'
#       neofetch --backend 'kitty'
# case '*tmux*' '*login*' '*sshd*' '*konsole*'
#	neofetch --backend 'ascii' --ascii_distro 'arch_small' 
# case '*'
# 	neofetch --backend 'w3m' --xoffset 34 --yoffset 34 --gap 0
# end


alias bat='bat --theme="Catppuccin-mocha"'
alias hc=herbstclient
alias code='code-insiders'
set MOZ_ENABLE_WAYLAND 1
set XDG_CURRENT_DESKTOP sway


# Created by `pipx` on 2022-09-11 05:02:32
set PATH $PATH /home/flicko/.local/bin
nvm use v19.3.0

set --export POSH_THEME /home/loco/.poshthemes/night-owl.omp.json
set --global POWERLINE_COMMAND "oh-my-posh"
set --global POSH_PID $fish_pid
set --global CONDA_PROMPT_MODIFIER false
set --global omp_tooltip_prompt ""
set --global has_omp_tooltip false
set --global omp_transient 0

# template function for context loading
function set_poshcontext
  return
end

function fish_prompt
    set --local omp_status_cache_temp $status
    # clear from cursor to end of screen as
    # commandline --function repaint does not do this
    # see https://github.com/fish-shell/fish-shell/issues/8418
    printf \e\[0J
    if test "$omp_transient" = "1"
      /usr/local/bin/oh-my-posh print transient --config $POSH_THEME --shell fish --error $omp_status_cache --execution-time $omp_duration --stack-count $omp_stack_count --shell-version $FISH_VERSION
      return
    end
    set --global omp_status_cache $omp_status_cache_temp
    set --global omp_stack_count (count $dirstack)
    set --global omp_duration "$CMD_DURATION$cmd_duration"
    # check if variable set, < 3.2 case
    if set --query omp_lastcommand; and test "$omp_lastcommand" = ""
      set omp_duration 0
    end
    # works with fish >=3.2
    if set --query omp_last_status_generation; and test "$omp_last_status_generation" = "$status_generation"
      set omp_duration 0
    end
    if set --query status_generation
      set --global --export omp_last_status_generation $status_generation
    end
    set_poshcontext
    /usr/local/bin/oh-my-posh print primary --config $POSH_THEME --shell fish --error $omp_status_cache --execution-time $omp_duration --stack-count $omp_stack_count --shell-version $FISH_VERSION
end

function fish_right_prompt
    if test "$omp_transient" = "1"
      echo -n ""
      set omp_transient 0
      set has_omp_tooltip false
      return
    end
    if test -n "$omp_tooltip_prompt"
      echo -n $omp_tooltip_prompt
      set omp_tooltip_prompt  ""
      set has_omp_tooltip true
      return
    end
    set has_omp_tooltip false
    /usr/local/bin/oh-my-posh print right --config $POSH_THEME --shell fish --error $omp_status_cache --execution-time $omp_duration --stack-count $omp_stack_count --shell-version $FISH_VERSION
end

function postexec_omp --on-event fish_postexec
  # works with fish <3.2
  # pre and postexec not fired for empty command in fish >=3.2
  set --global --export omp_lastcommand $argv
end

# fix tooltip not resetting on SIGINT (ctrl+c)
function sigint_omp --on-signal INT
    commandline --function repaint
end

# perform cleanup so a new initialization in current session works
if test "$(string match -e '_render_transient' $(bind \r --user 2>/dev/null))" != ''
  bind -e \r
end
if test "$(string match -e '_render_tooltip' $(bind \x20 --user 2>/dev/null))" != ''
  bind -e \x20
end

# tooltip

function _render_tooltip
  commandline --function expand-abbr
  set omp_tooltip_command (commandline --current-buffer | string split --allow-empty -f1 ' ' | string collect)
  if not test -n "$omp_tooltip_command"
    return
  end
  set omp_tooltip_prompt (/usr/local/bin/oh-my-posh print tooltip --config $POSH_THEME --shell fish --error $omp_status_cache --shell-version $FISH_VERSION --command $omp_tooltip_command)
  commandline --insert " "
  if not test -n "$omp_tooltip_prompt"
    if test "$has_omp_tooltip" = "true"
      commandline --function repaint
    end
    return
  end
  commandline --function repaint
end

if test "false" = "true"
  bind \x20 _render_tooltip
end

# transient prompt

function _render_transient
  if commandline --paging-mode
    commandline --function accept-autosuggestion
    return
  end
  set omp_transient 1
  commandline --function repaint
  commandline --function execute
end

if test "true" = "true"
  bind \r _render_transient
end

# legacy functions
function enable_poshtooltips
  return
end
function enable_poshtransientprompt
  return
end
fish_add_path /home/loco/.local/bin
fish_add_path /home/loco/.dotnet/tools/
oh-my-posh init fish --config ~/.poshthemes/atomic.omp.json  | source
