#!/usr/bin/
# fish


fisher install jorgebucaran/nvm.fish
fisher install gazorby/fish-exa
fisher install jethrokuan/z

exa --version
set -Ux EXA_LL_OPTIONS --group --header --group-directories-first --long --icons

nvm install latest
echo nvm use $(node --version) >> .config/fish/config.fish
. .config/fish/config.fish

yes | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S nerd-fonts-cascadia-code aspnet-runtime-5.0-bin 


. .config/fish/config.fish
bash

