;;;; EVIL MODE
;; You need to clone the evil mode repository using git to ~/.emacs.d/evil first

;; (add-to-list 'load-path' "~/.emacs.d/evil")
;; (require 'evil)
;; I don't think the above is needed now that I installed evil via package-install
;; (evil-mode 1)
;;;; ORG MODE SETTINGS

;; allow evil-mode to be called before evil-org-mode
;; compare to the package-selected-packages thingy down there which seems to be automatically
;; initialising some packages

;; (package-initialize)
;; (evil-mode 1)

;; Trying to get tabs working properly in org mode
;; Conflict with evil-mode?
;; cf http://stackoverflow.com/questions/22878668/emacs-org-mode-evil-mode-tab-key-not-working#

(setq evil-want-C-i-jump nil)

(setq evil-ex-search-case 'sensitive)
