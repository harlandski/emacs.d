(defun die (sides)
  "Rolls a pseudo-random die with SIDES sides and outputs the result."
  (interactive "Nsides: ")
  ;; this resets the random seed
  (random t)
  (message "%d" (+ 1 (random sides))))


