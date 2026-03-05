;; Add path to my files to load-path
(add-to-list 'load-path "~/.emacs.d/lisp")

;; load others' scripts
;; This one is needed for history-settings to work so loading it first
(load "info+")

;; Load settings for various things
(load "general-settings")
(load "package-management")
(load "history-settings")
(load "org-settings")
(load "tutorial-settings")
(load "evil-settings") ;; Note that it can't be called evil, as it will conflict with evil-mode
;; Note also that it must be in the ./lisp subdirectory I have created for such purposes!
(load "java-settings")
;; (load "powershell-settings")
(load "tetris-settings")
(load "javascript-settings")
;; Load my own scripts

(load "die")
(load "dice")
(load "hello")
(load "javascriptblock")
(load "javablock")
(load "insert-code-block")

;; Load custom keybindings
(load "custom-keybindings")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cookie-file "/usr/share/games/fortunes/fortunes.u8")
 '(custom-safe-themes
   '("dbf0cd368e568e6139bb862c574c4ad4eec1859ce62bc755d2ef98f941062441" "e0628ee6c594bc7a29bedc5c57f0f56f28c5b5deaa1bc60fc8bd4bb4106ebfda" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" "f74e8d46790f3e07fbb4a2c5dafe2ade0d8f5abc9c203cd1c29c7d5110a85230" default))
 '(package-selected-packages
   '(timu-macos-theme js2-mode web-mode timu-rouge-theme pdf-view-restore telega magit visual-fill-column helpful company json-mode rust-mode chocolate-theme zenburn-theme dracula-theme org-plus-contrib academic-phrases fortune-cookie evil-org evil-tabs evil-tutor-ja evil-tutor ## evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
