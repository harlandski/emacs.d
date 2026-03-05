;;;; GENERAL SETTINGS

;; no startup msg
(setq inhibit-startup-message t)	;disable startup message

;; start server, to be able to use emacsclient
(server-start)

;; Getting line wrapping to be on automatically

(global-visual-line-mode 1)

;;display time

(display-time-mode 1)

;; abbrev-mode on automatically

(setq-default abbrev-mode t)

;; Load preferred theme by default

(load-theme 'timu-macos t)

;; Make text 150% of the regular size

(set-face-attribute 'default nil :height 150)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; Trying to get things to fill whole page in tutorial

(setq-default fill-column 124)

;; Have emacs recognize single spaces as the end of sentences.

(setq sentence-end-double-space nil)

;; Electric pair mode - match starting and ending braces etc?
(electric-pair-mode 1)

;; Make windows open right rather than under by default
(setq
   split-width-threshold 0
   split-height-threshold nil)
