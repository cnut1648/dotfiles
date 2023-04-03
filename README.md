# dotfiles
My dotfiles for dual boot manjaro + Windows 11, and how to setup/migrate to new system.

## Step 0.

Disable bitlocker & secure boot in Windows 11.

In the old system, run `python backup.py` to create latest dotfile backup.

## Step 1.

Burn the manjaro to usb and boot from usb (using open-source driver).

Current partition configuration
```
300MB -- fat32 filesystem, tag=boot, mount=/boot/efi
8GB -- tag=linuxswap
Rest -- ext4 filesystem, tag=root/home
```

## Step 2.

Change `/etc/fstab` to mount windows files automatically

```
# <file system>             <mount point>  <type>  <options>  <dump>  <pass>
UUID=55EB-B69C                              /boot/efi          vfat      umask=0077                           0 2
UUID=0fa32516-2bc5-48a6-b37b-cb94ada096e8   /                  ext4      noatime                              0 1
UUID=7bb5848e-3288-4540-9a42-c0ce2ccc2217   /home              ext4      noatime                              0 2
# examples
UUID=74680090680052F2                       /home/jxu/Data   ntfs-3g   rw,permissions,user,exec,mode=1777   0 0
dev/nvme0n1p6                              /home/timeshift    ext4      defaults                             0 0
```

## Step 3.

Run i3+plasma (match in heaven) by [this repo](https://github.com/heckelson/i3-and-kde-plasma). Using `Option 2: New XSession` regardless of plasma version so that can switch between plasma and i3 easily.

If there are some issues, use pure `i3` login session to debug.

## Step 4.

Install all required softwares.

1. install via `./install.sh`.

2. config git
   
    ```shell
    git config --global credential.helper store  
    git config --global user.name "Jianxu Xu"
    git config --global user.email "jxu1@g.harvard.edu"
    ```

3. config zsh and oh-my-zsh
   
   ```shell
   # change default shell to zsh
    chsh -s /bin/zsh
   # install oh-my-zsh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   
   # install powerlevel10k
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
   # other custom plugins
   git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
   git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoupdate
   git clone https://github.com/allcatsarebeautiful/fasd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fasd
   git clone https://github.com/changyuheng/fz ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fz
   git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
   git clone https://github.com/supercrabtree/k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/k
   git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
   git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/z.lua
   git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
   git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
   ```

4. Install anaconda and python libraries
   
   ```shell
   wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh;
   chmod u+x Miniconda*;
   ./Miniconda*;
   ```
   After conda is installed, can install python libraries (examples are `ds.py` and `fun.py`)

5. Install neovim's plugin and latex.

   Follow instructions from [lua plugins](https://github.com/cnut1648/nvim-lua.git) and setup [inkscape plugin](https://github.com/cnut1648/inkscape-figures).

6. Restore all dotfiles from backup.

   ```shell
   python restore.py
   ```
   
## Step .


# i3

alt + c to remove newlines in selected highlight text (e.g. copy from pdf)


