;; auto-indent java files
(add-hook 'java-mode-hook (lambda () (indent-region (point-min) (point-max))))
