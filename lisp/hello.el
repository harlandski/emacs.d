(defun hello (name)
  "Says hello using the name given"
  (interactive "sname: ")
  (message (concat "Hello, " name "!" )))
