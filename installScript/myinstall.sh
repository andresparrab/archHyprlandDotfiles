#!/usr/bin/bash 
# Install dependencies for lunarvim
sudo pacman -Syyu --noconfirm

# Install dependencies for lunarvim
sudo pacman --noconfirm --needed -S python python-pip cmake unzip ninja tree-sitter curl neovim rustup flake8 fish fisher exa dotnet-sdk aspnet-runtime aspnet-runtime-6.0 fzf ghc stow wlogout sddm paru

rustup default stable

# Install hyprland dependencies
paru -S hyprland-git waybar-hyprland-git cava waybar-mpris-git python rustup kitty wofi xdg-desktop-portal-wlr tty-clock-git swaylockd grim slurp pokemon-colorscripts-git starship jq dunst wl-clipboard swaylock-effects-git

git clone -b dreamy https://github.com/flick0/dotfiles
cd dotfiles
cp -r ./config/* ~/.config

mkdir ~/.config/hypr/store
touch ~/.config/hypr/store/dynamic_out.txt
touch ~/.config/hypr/store/prev.txt
touch ~/.config/hypr/store/latest_notif

chmod +x ~/.config/hypr/scripts/tools/*
chmod +x ~/.config/hypr/scripts/*
chmod +x ~/.config/hypr/*

# swww wallpaper changer/daemon
git clone -b bezier https://github.com/flick0/swww
cd swww
cargo build --release
cp ./target/release/swww ~/.config/hypr/scripts/tools/

# Rgb borders
git clone https://github.com/flick0/rgb-rs
cd rgb-rs
cargo build --release
cp ./target/release/rgb ~/.config/hypr/scripts/


chsh -s /usr/bin/fish

fish

fisher install jorgebucaran/nvm.fish
fisher install gazorby/fish-exa
fisher install jethrokuan/z

exa --version
set -Ux EXA_LL_OPTIONS --group --header --group-directories-first --long --icons

nvm install latest
echo nvm use $(node --version) >> .config/fish/config.fish
. .config/fish/config.fish

sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

# echo oh-my-posh init fish --config ~/.poshthemes/night-owl.omp.json | source >> .config/fish/config.fish

yes | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S nerd-fonts-cascadia-code vim-plug aspnet-runtime-5.0-bin

. .config/fish/config.fish

# install Whitegoose nvim dependencies

pip install debugpy
pip install jedi-language-server
pip install jupyter_client
dotnet tool install -g Microsoft.dotnet-interactive
dotnet interactive jupyter install

add the paths to lunarvim
echo fish_add_path $HOME/.local/bin >> .config/fish/config.fish
echo fish_add_path $HOME/loco/.dotnet/tools >> .config/fish/config.fish

bash
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
git clone https://github.com/andresparrab/nvim.git

#mkdir  .config/nvim
#cp -r nvim/nvim/* .config/nvim/

# install latest stable ghc package from [community] or 2) install ncurses5-compat-libs from AUR for the prebuilt binaries installed by stack to work.
