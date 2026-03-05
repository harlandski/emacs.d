(defun javablock ()
  "Inserts java code block into buffer at point."
  (interactive)
  (insert "#+begin_src java\n\n#+end_src")
  (previous-line))


