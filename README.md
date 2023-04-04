# Guix configs for Lenovo IdeaPad

## Why on God's green earth would I want to run GUIX?
I have the feeling (yes, emotions and hunches, not data) that functional package managers are important. I'm marginally familiar with lisp and am not afraid of parentheses, so GUIX is more attractive to me than NixOS.

## Sharp edges of GUIX

 * Functional package managers implemented in scheme are a completely different way of thinking compared to *any* other package manager. The learning curve is steep.
 * GUIX almost completely abandons FHS. No binaries are in /usr/bin. No libraries are in /usr/lib. Most config files are not in /etc.
 * You are going to struggle to compile source unless you completely embrace the package manager.
 * GUIX has a smaller pool of people contributing, so some things which are mature on Nix are less mature or less featureful on GUIX.
 * GUIX forbids non-free software, blobs, kernel modules. This means microcode for your CPU, no blobs for most wifi, no nvidia support unless you add a non-free channel like [nonguix](https://gitlab.com/nonguix/nonguix). This is a little tedious and there isn't an automated way yet to manage this, but the system crafters link below walks you through installation with nonguix.

## Setup

This is my system and home config for my laptop using:

 * nonguix for wifi
 * sddm for login
 * xfce and sway (I'm new to tiling wm's)
 * ssh-agent running as part of home configuration.

I used the instructions from [SystemCrafters](https://wiki.systemcrafters.net/guix/nonguix-installation-guide/) to install on the laptop.

How does one apply this config to their compute?

1. Setup your compute as per the above referenced SystemCrafters link.
1. run `guix shell git` to gain temporary access to git.
1. Clone the repo (with https if you don't yet have ssh setup)
1. I've moved the contents of `guix-config` directory into `~/.config/guix`. I don't yet know if this is a good idea long-term, but the rest of the instructions assume you have done that.
1. Adjust `~/.config/guix/system.scm` and `~/.config/guix/guix-home/home-configuration.scm` files to suit your needs.
1. Run `sudo -E guix system reconfigure ~/.config/guix/system.scm` to adjust the global operating system.
1. Reboot if you received a new kernel update.
1. Run `guix home reconfigure ~/.config/guix/guix-home/home-configuration.scm` to update your user profile.

Todo:
 * ~~Pull in sway and kanshi config files to `guix home`~~
 * How do I deal with my customized `.inputrc` properly. It looks like it isn't managed in the shell services yet.
 * Figure out the "best" way to manage emacs configuration and packages
 * Sort out how to package up some of the Cloud Foundry tools that I use at work. They don't exist in guix repos yet.
