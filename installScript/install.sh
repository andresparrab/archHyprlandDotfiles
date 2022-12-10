#!bin/bash
# Install dependencies for lunarvim
# sudo pacman -Syyu --noconfirm
# sudo pacman --noconfirm --needed -S $(python python-pip cmake unzip ninja tree-sitter curl neovim rustup flake8 fish fisher exa dotnet-sdk aspnet-runtime aspnet-runtime-6.0 fzf ghc)

rustup default stable

chsh -s /usr/bin/fish

fish
chsh -s /usr/bin/fish

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

echo oh-my-posh init fish --config ~/.poshthemes/night-owl.omp.json | source >> .config/fish/config.fish

yes | LANG=C yay --noprovides --answerdiff None --sudoloop true --answerclean None --mflags "--noconfirm" -S nerd-fonts-cascadia-code oh-my-posh-bin vim-plug aspnet-runtime-5.0 

. .config/fish/config.fish

bash
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# install Whitegoose nvim dependencies

pip install debugpy
pip install jedi-language-server
pip install jupyter_client
dotnet tool install -g Microsoft.dotnet-interactive
dotnet interactive jupyter install

add the paths to lunarvim
echo fish_add_path $HOME/.local/bin >> .config/fish/config.fish
echo fish_add_path $HOME/loco/.dotnet/tools >> .config/fish/config.fish


git clone https://github.com/andresparrab/nvim.git
mkdir  .config/nvim
cp -r nvim/nvim/* .config/nvim/

# install latest stable ghc package from [community] or 2) install ncurses5-compat-libs from AUR for the prebuilt binaries installed by stack to work.
