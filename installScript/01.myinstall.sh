#!/usr/bin/
#update sysAtem
sudo pacman -Syyu --noconfirm
# Install dependencies for lunarvim and my apps
sudo pacman --noconfirm --needed -S python python-pip cmake unzip ninja tree-sitter ripgrep curl neovim rustup flake8 fish fisher exa dotnet-sdk aspnet-runtime aspnet-runtime-6.0 fzf ghc sddm paru gvfs-smb thunar thefuck swappy viewnior tumbler brightnessctl lazygit vlc kodi jq grim slurp wl-clipboard socat dunst trayer swaybg qt5-wayland kanshi swayidle qt5-graphicaleffects qt5-quickcontrols
rustup default stable
# second line is for install packages to the garden themes and from https://github.com/taylor85345/hyprland-dotfiles
paru -S hyprland-git eww-wayland icons-in-terminal rofi-lbonn-wayland-git mpvpaper macchina nitch nerd-fonts-inter geticons-git google-chrome wev networkmanager-dmenu-git
# isntall oh my posh and themes
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

cd archHyprlandDotfiles
cp -vr archHyprlandDotfiles/* $HOME/.config/

chsh -s /usr/bin/fish
fish
