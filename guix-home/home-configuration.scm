;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services)
             (gnu home services shells)
             (gnu home services ssh))


(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
 (packages (specifications->packages (list
                                      ;; emacs and friends
                                      "emacs-next-pgtk"
                                      "emacs-auto-complete"
                                      "emacs-company"
                                      "emacs-company-irony"
                                      "emacs-company-quickhelp"
                                      "emacs-counsel"
                                      "emacs-csv-mode"
                                      "emacs-direnv"
                                      "emacs-ess"
                                      "emacs-exec-path-from-shell"
                                      "emacs-flx"
                                      "emacs-flycheck"
                                      "emacs-flycheck-irony"
                                      "emacs-geiser"
                                      "emacs-geiser-guile"
                                      "emacs-irony-eldoc"
                                      "emacs-irony-mode"
                                      "emacs-js2-mode"
                                      "emacs-magit"
                                      "emacs-markdown-mode"
                                      "emacs-multi-vterm"
                                      "emacs-nix-mode"
                                      "emacs-platformio-mode"
                                      "emacs-popup"
                                      "emacs-projectile"
                                      "emacs-rust-mode"
                                      "emacs-toml-mode"
                                      "emacs-vterm"
                                      "emacs-web-mode"
                                      "emacs-yaml-mode"
                                      "emacs-yasnippet"
                                      "emacs-yasnippet-snippets"
                                      ;; various tools
				      "foot"
				      "fuzzel"
				      "git"
				      "htop"
				      "kanshi"
				      "keepassxc"
                                      "nmap"
                                      "openssh"
                                      "r"
                                      "setxkbmap"
                                      "ungoogled-chromium"
				      "xrandr"
				      )))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list (service home-bash-service-type
                  (home-bash-configuration
                   (aliases '(("grep" . "grep --color=auto")
			      ("ll" . "ls -l")
                              ("ls" . "ls -p --color=auto")))
                   (environment-variables
                    `(("EDITOR" . "emacs")))
                   (bashrc (list (local-file ".bashrc"
                                             "bashrc")))
                   (bash-profile (list (local-file
                                        ".bash_profile"
                                        "bash_profile")))))
         (service home-ssh-agent-service-type)
         (service home-xdg-configuration-files-service-type
                  `(("kanshi/config" ,(local-file "kanshi-config"))
                    ("sway/config" ,(local-file "sway-config"))))
         )))
