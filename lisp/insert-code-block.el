(defun insert-code-block (language)
  "Inserts code block with name inputted by user into buffer at point."
  ;; Note you put the variable as a "parameter" to the function
  (interactive "slanguage (all lower case): ")
  ;; Note s (lower case) seems to be the best prefix for a string
  (setq text-to-insert (format "#+begin_src %s\n\n#+end_src" language))
  ;;(message text-to-insert)
  (insert text-to-insert)
  (previous-line)
  ;; previous-line puts the cursor in the middle of the block to start typing
  )





