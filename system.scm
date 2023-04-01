;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
	     (nongnu packages linux))

(use-service-modules
 cups
 desktop
 networking
 sddm
 ssh
 xorg)

(use-package-modules
 certs)

(operating-system
  (kernel linux)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us"
				    #:options '("ctrl:nocaps")))
  (host-name "ideapad-jlj")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "jjorgens")
                  (comment "John Jorgensen")
                  (group "users")
                  (home-directory "/home/jjorgens")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (specifications->packages (list
					       "nss-certs"
					       "sway"
					       "swaylock"
					       "swayidle"
					       "swaybg"))
		    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service xfce-desktop-service-type)
                 (set-xorg-configuration
                  (xorg-configuration
		   (keyboard-layout keyboard-layout))
		  sddm-service-type))
           ;; This is the default list of services we
           ;; are appending to.
           (modify-services %desktop-services
			    (guix-service-type config => (guix-configuration
							  (inherit config)
							  (substitute-urls
							   (append (list "https://substitutes.nonguix.org")
								   %default-substitute-urls))
							  (authorized-keys
							   (append (list (local-file "./signing-key.pub"))
								   %default-authorized-guix-keys))))
			    (delete gdm-service-type))))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "e050c6fb-e4ce-4293-a9f2-c31b30493149")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "442e9e4f-a1fd-41b2-9686-4ef1ed9e6dce"
                                  'btrfs))
                         (type "btrfs"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "251C-1DA3"
                                       'fat32))
                         (type "vfat")) %base-file-systems)))
