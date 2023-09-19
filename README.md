# dotfiles
My dotfiles for dual boot manjaro + Windows 11, and how to setup/migrate to new system.

## Installation
### Step 0.

Disable bitlocker & secure boot in Windows 11.

In the old system, run `python backup.py` to create latest dotfile backup.

### Step 1.

Burn the manjaro to usb and boot from usb (using open-source driver).

Current partition configuration
```
300MB -- fat32 filesystem, tag=boot, mount=/boot/efi
8GB -- tag=linuxswap
Rest -- ext4 filesystem, tag=root/home
```

### Step 2.

Change `/etc/fstab` to mount windows files automatically. To find the UUID, first `lsblk` to find the name of the disk to mount, then `sudo blkid <device name>` to find the UUID.

```
# <file system>             <mount point>  <type>  <options>  <dump>  <pass>
UUID=55EB-B69C                              /boot/efi          vfat      umask=0077                           0 2
UUID=0fa32516-2bc5-48a6-b37b-cb94ada096e8   /                  ext4      noatime                              0 1
UUID=7bb5848e-3288-4540-9a42-c0ce2ccc2217   /home              ext4      noatime                              0 2
# examples
UUID=74680090680052F2                       /home/jxu/Data   ntfs-3g   rw,permissions,user,exec,mode=1777   0 0
dev/nvme0n1p6                              /home/timeshift    ext4      defaults                             0 0
```

### Step 3.

Run i3+plasma (match in heaven) by [this repo](https://github.com/heckelson/i3-and-kde-plasma). Using `Option 2: New XSession` regardless of plasma version so that can switch between plasma and i3 easily.

If there are some issues, use pure `i3` login session to debug.

### Step 4.

Install nvidia driver and cuda.

First use `sudo mhwd -a pci nonfree 0300` to install the latest driver (note if latest driver is not installed second monitor might not work).

Then `sudo pacman -S cuda`

### Step 5.

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
   p10k configure # configure 10k
   # other custom plugins
   git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
   git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoupdate
   git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
   git clone https://github.com/supercrabtree/k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/k
   git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/you-should-use
   git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
   git clone https://github.com/KulkarniKaustubh/fzf-dir-navigator.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-dir-navigator
   ```

4. Install anaconda and python libraries

   ```shell
   wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh;
   chmod u+x Miniconda*;
   ./Miniconda*;

   # after install, zsh still can't use conda
   # but can init in bash
   ./miniconda/bin/conda init # init for bash
   ```
   After conda is installed, can install python libraries (examples are `ds.py` and `fun.py`)

5. Install neovim's plugin and latex.

   Follow instructions from [lua plugins](https://github.com/cnut1648/nvim-lua.git) and setup [inkscape plugin](https://github.com/cnut1648/inkscape-figures).

6. Restore all dotfiles from backup.

   ```shell
   python restore.py
   ```

## ZSH

### Config zsh

Use `bindkey` to bind key map to function.
Use `bindkey "^Q"` to see the current bindings for `<Ctrl-Q>`; `"^[f` for `<Alt-f>`

### Useful CLI

`ls` replaced by [`eza`](https://github.com/eza-community/eza#options). Notably,
- `ls -T -L <level>` is similar to `tree` w/ max level

- `ls -R` list all files including subdir

- `ls --hyperlink` gives hyperlink for all files

`cat` replaced by [`bat`](https://github.com/sharkdp/bat)

`diff` replaced by [`delta`](https://github.com/dandavison/delta)

[`duf`](https://github.com/muesli/duf) for better `df`

### Useful keymaps

- `alt+.` will paste last argument of previous command, useful to change the script name with the same argument.

### Some useful zsh plugins

- `extract` to extract files: use `x <file>` to extract file
- `fasd` to navigate: use `v` (file) and `o` (dir) to edit/open in file manager
- `dirhistory` to navigate directory: `<Alt-Left>` and `<Alt-Right>` for prev/next; `<Alt-Up>` and `<Alt-Down>` for parent/child
- `zoxide` to navigate: `z <dir>` to navigate to dir; `zoxide query <dir>` to search dir e.g. `echo $( zoxide query dot )`
- `zmv` to smart rename
- `Ctrl-k` to launch ranger
- `rand-quote` to generate random quote: use `Ctrl-Q` to generate one
- `mcfly` to view history: use `Ctrl-R` to search history
- `fancy-ctrl-z`: `Ctrl-z` twice to bring back bg jobs; no `fg` needed anymore
- `sudo`: press `<ESC>` twice to prepend sudo
- `k`: use `k` to list files, replace `ls -l`
- `fzf-dir-navigator` use `fzf` to cd to dir, `alt-f` to toggle

##  i3

For autostart, see Auto Start section in `i3/config`.

Other than basic movement (see config for details):

- `mod+Tab` cycle through workspaces

- `mod+o` back and forth workspaces, use `mod+shift+o` to move focused container to opposite workspace

- `mod+a/z` focus on parent/child container

- `mod+x` show scratchpad (floating window), `mod+shift+x` move focused to scratchpad; `mod+m` show all scratchpads; `mod+u` focus on desired scratchpad

- `mod+mouse scroll` to resize scratchpad

- currently `i3-grid` is broken

- `alt + c` to remove newlines in selected highlight text (e.g. copy from pdf)

- `mod+c` to one-quick mode; `mod+r` resize mode
