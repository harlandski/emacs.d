;; Adding WAITING status to tasks
(setq org-todo-keywords
  '((sequence "TODO" "WAIT" "|" "DONE")))

;; Org mode global keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;;;org-mode as default
;; Enable org-mode
(require 'org)
;; Make org-mode work with file ending in .txt
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

;; Stop + signs from crossing things out

(setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                 ("/" italic "<i>" "</i>")
                                 ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
                                 ("=" org-code "<code>" "</code>" verbatim)
                                 ("~" org-verbatim "<code>" "</code>" verbatim))))

(add-hook 'org-mode-hook
	  (lambda ()
	    (org-indent-mode t))
	  t)

;; Use org ELPA packages

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
