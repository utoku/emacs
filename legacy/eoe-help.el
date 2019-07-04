(require 'generic-x)

(define-generic-mode 'helpfile-mode
  nil                      ;;comments
  '("#HELPS character")              ;;keywords
  '(("~" . 'font-lock-operator))
  '("\\.hlp$")             ;;files to operate this mode
  nil
  "Mode for 4lands helpfiles.")

