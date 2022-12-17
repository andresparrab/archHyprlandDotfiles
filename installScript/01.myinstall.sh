#!/usr/bin/
# Install dependencies for lunarvim
#git clone https://github.com/andresparrab/archHyprlandDotfiles.git
sudo pacman -Syyu --noconfirm

# Install dependencies for lunarvim
sudo pacman --noconfirm --needed -S python python-pip cmake unzip ninja tree-sitter ripgrep curl neovim rustup flake8 fish fisher exa dotnet-sdk aspnet-runtime aspnet-runtime-6.0 fzf ghc sddm paru gvfs-smb thunar thefuck swappy viewnior tumbler brightnessctl lazygit vlc kodi jq

rustup default stable

# Install hyprland dependencies for flick0
# ------------------------------------------------------------------------------------------
# paru -S hyprland-git waybar-hyprland-git cava waybar-mpris-git kitty wofi xdg-desktop-portal-wlr tty-clock-git swaylockd grim slurp pokemon-colorscripts-git starship jq dunst wl-clipboard swaylock-effects-git
# git clone -b dreamy https://github.com/flick0/dotfiles
# cd dotfiles
# cp -r ./config/* ~/.config

# mkdir ~/.config/hypr/store
# touch ~/.config/hypr/store/dynamic_out.txt
# touch ~/.config/hypr/store/prev.txt
# touch ~/.config/hypr/store/latest_notif

# chmod +x ~/.config/hypr/scripts/tools/*
# chmod +x ~/.config/hypr/scripts/*
# chmod +x ~/.config/hypr/*

# # swww wallpaper changer/daemon
# git clone -b bezier https://github.com/flick0/swww
# cd swww
# cargo build --release
# cp ./target/release/swww ~/.config/hypr/scripts/tools/

# Rgb borders
# git clone https://github.com/flick0/rgb-rs
# cd rgb-rs
# cargo build --release
# cp ./target/release/rgb ~/.config/hypr/scripts/
# -----------------------------------------------------------------------------------

# second line is for install packages to the garden themes and from https://github.com/taylor85345/hyprland-dotfiles
paru -S hyprland-git eww-wayland icons-in-terminal rofi-lbonn-wayland-git dunst trayer mpvpaper macchina nitch nerd-fonts-inter socat geticons foot google-chrome



sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

# install Whitegoose nvim dependencies

# yay -S vim-plug 
# pip install debugpy
# pip install jedi-language-server
# pip install jupyter_client
# dotnet tool install -g Microsoft.dotnet-interactive
# dotnet interactive jupyter install

# add the paths to lunarvim
# echo fish_add_path $HOME/.local/bin >> .config/fish/config.fish
# echo fish_add_path $HOME/loco/.dotnet/tools >> .config/fish/config.fish

# bash

#git clone https://github.com/andresparrab/nvim.git

# ----------------------------------------------------------------------------------------------------------------------------

# echo oh-my-posh init fish --config ~/.poshthemes/night-owl.omp.json | source >> .config/fish/config.fish


# --------------------------------------------------------------------------------------------------------------

#mkdir  .config/nvim
#cp -r nvim/nvim/* .config/nvim/

# install latest stable ghc package from [community] or 2) install ncurses5-compat-libs from AUR for the prebuilt binaries installed by stack to work.


cd archHyprlandDotfiles
cp -vr archHyprlandDotfiles/* $HOME/.config/

chsh -s /usr/bin/fish
fish
