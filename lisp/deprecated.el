;; Trying to get mobileorg working
(setq org-directory "~/org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-agenda-files "~/org")
;; This didn't work on two levels...
;; Firstly the variable can't be a folder
;; Secondly it's apparently not the best way of doing it
;; Best to use C-c [
(setq org-mobile-inbox-for-pull "~/org/inbox.org")

;;;; QML MODE SETTINGS

;; qml-mode

;; (add-to-list 'load-path "~/.emacs.d/lisp")
;; (require 'qml-mode)

;; Make qml-mode work with file ending in .qml
;; (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

(setenv "DROPBOX" "/mnt/Dropbox/harlandski/Dropbox")
(setenv "INTERPRESS" "/mnt/Dropbox/harlandski/Dropbox/efl/interpress")
(put 'tetris 'disabled nil)

;; stop async shell from opening buffer when running okular
(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

;; Allow use of ignore tag for headings I don't want numbered

;; add-to-list 'load-path "/path/to/contrib/lisp
;; (require 'ox-extra)
;; :(ox-extras-activate '(ignore-headlines))
