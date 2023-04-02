# dotfiles
My dotfiles for dual boot manjaro + Windows 11, and how to setup/migrate to new system.

## Step 0.

Disable bitlocker & secure boot in Windows 11.

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

## Step 4.

Install all required softwares.

1. install via `./install.sh`.

2. Install anaconda and python libraries

3. Install neovim's plugin and latex.

First follow instructions from [lua plugins](https://github.com/cnut1648/nvim-lua.git) and setup [inkscape plugin](https://github.com/cnut1648/inkscape-figures).

## Step .


# scripts

`/usr/bin/bri`

# X

`~/.Xresources`
`~/.xprofile`
`~/.xinitrc`
`~/.Xclients`

# ZSH
`~/.zshrc`

# BASH
`~/.bashrc`
`~/.profile`  not loaded when bash_profile present
`~/.bash_profile`
# I3
`~/.config/i3`



# Plasma

`~/.config/plasma-org.kde.plasma.desktop-appletsrc`

`~/.config/plasmashellrc`



# i3

alt + c to remove newlines in selected highlight text (e.g. copy from pdf)


