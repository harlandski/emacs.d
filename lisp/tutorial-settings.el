(advice-add 'help-with-tutorial :override
(defun help-with-tutorial-deals-with-c-x-c-c (&optional arg dont-ask-for-revert)
  "Select the Emacs learn-by-doing tutorial.
If there is a tutorial version written in the language
of the selected language environment, that version is used.
If there's no tutorial in that language, `TUTORIAL' is selected.
With ARG, you are asked to choose which language.
If DONT-ASK-FOR-REVERT is non-nil the buffer is reverted without
any question when restarting the tutorial.

If any of the standard Emacs key bindings that are used in the
tutorial have been changed then an explanatory note about this is
shown in the beginning of the tutorial buffer.

When the tutorial buffer is killed the content and the point
position in the buffer is saved so that the tutorial may be
resumed later."
  (interactive "P")
  (if (boundp 'viper-current-state)
      (let ((prompt1
             "You can not run the Emacs tutorial directly because you have \
enabled Viper.")
	    (prompt2 "\nThere is however a Viper tutorial you can run instead.
Run the Viper tutorial? "))
	(if (fboundp 'viper-tutorial)
	    (if (y-or-n-p (concat prompt1 prompt2))
		(progn (message "")
		       (funcall 'viper-tutorial 0))
	      (message "Tutorial aborted by user"))
	  (message prompt1)))
    (let* ((lang (cond
                  (arg
                   (minibuffer-with-setup-hook #'minibuffer-completion-help
                     (read-language-name 'tutorial "Language: " "English")))
                  ((get-language-info current-language-environment 'tutorial)
                   current-language-environment)
                  (t "English")))
           (filename (get-language-info lang 'tutorial))
           (tut-buf-name filename)
           (old-tut-buf (get-buffer tut-buf-name))
           (old-tut-win (when old-tut-buf (get-buffer-window old-tut-buf t)))
           (old-tut-is-ok (when old-tut-buf
                            (not (buffer-modified-p old-tut-buf))))
           old-tut-file
           (old-tut-point 1))
      (setq tutorial--point-after-chkeys (point-min))
      ;; Try to display the tutorial buffer before asking to revert it.
      ;; If the tutorial buffer is shown in some window make sure it is
      ;; selected and displayed:
      (if old-tut-win
          (raise-frame
           (window-frame
            (select-window (get-buffer-window old-tut-buf t))))
        ;; Else, is there an old tutorial buffer? Then display it:
        (when old-tut-buf
          (switch-to-buffer old-tut-buf)))
      ;; Use whole frame for tutorial
      (delete-other-windows)
      ;; If the tutorial buffer has been changed then ask if it should
      ;; be reverted:
      (when (and old-tut-buf
                 (not old-tut-is-ok))
        (setq old-tut-is-ok
              (if dont-ask-for-revert
                  nil
                (not (y-or-n-p
                      "You have changed the Tutorial buffer.  Revert it? ")))))
      ;; (Re)build the tutorial buffer if it is not ok
      (unless old-tut-is-ok
        (switch-to-buffer (get-buffer-create tut-buf-name))
        ;; (unless old-tut-buf (text-mode))
        (unless lang (error "Variable lang is nil"))
        (setq tutorial--lang lang)
        (setq old-tut-file (file-exists-p (tutorial--saved-file)))
        (let ((inhibit-read-only t))
          (erase-buffer))
        (message "Preparing tutorial ...") (sit-for 0)

        ;; Do not associate the tutorial buffer with a file. Instead use
        ;; a hook to save it when the buffer is killed.
        (setq buffer-auto-save-file-name nil)
        (add-hook 'kill-buffer-hook 'tutorial--save-tutorial nil t)
	;; Added by me
	(add-hook 'kill-emacs-query-functions 'tutorial--save-tutorial nil t)

        ;; Insert the tutorial. First offer to resume last tutorial
        ;; editing session.
        (when dont-ask-for-revert
          (setq old-tut-file nil))
        (when old-tut-file
          (setq old-tut-file
                (y-or-n-p "Resume your last saved tutorial? ")))
        (if old-tut-file
            (progn
              (insert-file-contents (tutorial--saved-file))
	      (let ((enable-local-variables :safe)
                    (enable-local-eval nil)
                    (enable-dir-local-variables nil)) ; bug#11127
		(hack-local-variables))
              (goto-char (point-min))
              (setq old-tut-point
                    (string-to-number
                     (buffer-substring-no-properties
                      (line-beginning-position) (line-end-position))))
              (forward-line)
              (setq tutorial--point-before-chkeys
                    (string-to-number
                     (buffer-substring-no-properties
                      (line-beginning-position) (line-end-position))))
              (forward-line)
              (delete-region (point-min) (point))
              (goto-char tutorial--point-before-chkeys)
              (setq tutorial--point-before-chkeys (point-marker)))
          (insert-file-contents (expand-file-name filename tutorial-directory))
	  (let ((enable-local-variables :safe)
                (enable-local-eval nil)
                (enable-dir-local-variables nil)) ; bug#11127
	    (hack-local-variables))
          (forward-line)
          (setq tutorial--point-before-chkeys (point-marker)))

	(tutorial--display-changes)

        ;; Clear message:
        (unless dont-ask-for-revert
          (message "") (sit-for 0))


        (if old-tut-file
            ;; Just move to old point in saved tutorial.
            (let ((old-point
                   (if (> 0 old-tut-point)
                       (- old-tut-point)
                     (+ old-tut-point tutorial--point-after-chkeys))))
              (when (< old-point 1)
                (setq old-point 1))
              (goto-char old-point))
          ;; Delete the arch-tag line, so as not to confuse readers.
          (goto-char (point-max))
          (if (search-backward ";;; arch-tag: " nil t)
              (delete-region (point) (point-max)))
          (goto-char (point-min))
          (search-forward "\n<<")
          (beginning-of-line)
          ;; Convert the <<...>> line to the proper [...] line,
          ;; or just delete the <<...>> line if a [...] line follows.
          (cond ((save-excursion
                   (forward-line 1)
                   (looking-at-p "\\["))
                 (delete-region (point) (progn (forward-line 1) (point))))
                ((looking-at "<<Blank lines inserted.*>>")
                 (replace-match "[Middle of page left blank for didactic purposes.   Text continues below]"))
                (t
                 (looking-at "<<")
                 (replace-match "[")
                 (search-forward ">>")
                 (replace-match "]")))
          (beginning-of-line)
          ;; FIXME: if the window is not tall, and especially if the
          ;; big red "NOTICE: The main purpose..." text has been
          ;; inserted at the start of the buffer, the "type C-v to
          ;; move to the next screen" might not be visible on the
          ;; first screen (n < 0).  How will the novice know what to do?
          (let ((n (- (window-height)
                      (count-lines (point-min) (point))
                      6)))
            (if (< n 8)
                (progn
                  ;; For a short gap, we don't need the [...] line,
                  ;; so delete it.
                  (delete-region (point) (progn (end-of-line) (point)))
                  (if (> n 0) (newline n)))
              ;; Some people get confused by the large gap.
              (newline (/ n 2))

              ;; Skip the [...] line (don't delete it).
              (forward-line 1)
              (newline (- n (/ n 2)))))
          (goto-char (point-min)))
        (setq buffer-undo-list nil)
        (set-buffer-modified-p nil)))))
)
