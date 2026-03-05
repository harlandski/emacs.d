;; Note it's necessary to quote the name of the function
;; And best practice to preface that quote with #
(global-set-key (kbd "C-c D") #'dice)
(global-set-key (kbd "C-c d") #'die)
(global-set-key (kbd "C-c h") #'hello)
(global-set-key (kbd "C-c k") #'insert-code-block) ;; kodeblock
(global-set-key (kbd "C-c j") #'javascriptblock)
(global-set-key (kbd "C-c J") #'javablock)
(global-set-key (kbd "C-c q") #'calendar) ;; qalendar
;; (global-set-key (kbd "C-c p") 'koopa-send-line-to-powershell)
;; (global-set-key (kbd "C-c P") 'koopa-run-powershell)
;; Rebind help to helpful
;; Note that the built-in `describe-function' includes both functions
;; and macros. `helpful-function' is functions only, so we provide
;; `helpful-callable' as a drop-in replacement.
(global-set-key (kbd "C-h f") #'helpful-callable)

(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; for this in lisp modes.
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; Look up *F*unctions (excludes macros).
;;
;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; already links to the manual, if a function is referenced there.
(global-set-key (kbd "C-h F") #'helpful-function)
