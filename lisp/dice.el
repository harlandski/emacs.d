(defun dice (number sides)
  "Rolls NUMBER dice of SIDES sides and outputs the total."
  (interactive "Nnumber: \nNsides: ")
  ;; this resets the random seed
  (random t)
  (setq total 0)
  (setq rolls '())
  ;; The count in dotimes is just like i, it could have any name
  (dotimes (count number)
    (setq roll (+ 1 (random sides)))
    (setq total (+ total roll))
    (setq rolls (cons roll rolls)))
  
  (setq rolls (nreverse rolls))
  (message "%s %d" rolls total))

    

