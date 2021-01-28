# install pkgs
# to install i3-settings
sudo pacman -R manjaro-kde-settings
./install.sh

# github
git config --global credential.helper store
git config --global user.name "jiashu"
git config --global user.email "jiashuxu@usc.edu"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# use upgrade_oh_my_zsh_custom to update
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoupdate
git clone https://github.com/allcatsarebeautiful/fasd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fasd
git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/changyuheng/fz ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fz
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/supercrabtree/k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/k
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/z.lua
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions


# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
