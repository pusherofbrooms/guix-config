# Guix configs for Lenovo IdeaPad

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
 * Pull in sway and kanshi config files to `guix home`
 * How do I deal with my customized `.inputrc` properly. It looks like it isn't managed in the shell services yet.
 * Figure out the "best" way to manage emacs configuration and packages
 * Sort out how to package up some of the Cloud Foundry tools that I use at work. They don't exist in guix repos yet.
