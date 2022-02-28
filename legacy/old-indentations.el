;;;;; styles and indentation ==================================================
;; tab settings, parkyeri coding standard with seeing tabs as four
;; spaces
(defun kartaca-indentation ()
  (interactive)
  (message "kartaca-indentation ok")
  (setq-default tab-width 4)
  (setq-default c-basic-indent 4)  
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil))
;;TODO: prevent insertion of other tabs for alignment

(defun elegant-indent () 
  (interactive)
  (message "loading elegant indent")
  (c-set-style "K&R")
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t))
;  (setq tab-stop-list (number-sequence 4 200 4)))
