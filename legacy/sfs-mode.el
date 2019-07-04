;;; A quick Major Emacs Mode for .sfs siberfiber scripts.
;; author: Utku Somer

;;usage:
;; (load-file "sfs-mode.el")
;; (add-to-list 'auto-mode-alist '("\\.sfs$" . sfs-mode)) 

;define the keywords
(defvar mysfs-functions
  '("createtype" "createproperty" "createrelation"

	;;masks
	"createmask" 
	"addmaskfield" "addchildmask" "addparammask" "addselfmask"
	
	"creatething" "addtolist"

	"createreductor" "createconstant" "createsifter"

	;;userstuff
	"createuser" "createusergroup"

	;;process stuff
	"createprocess" "createactivity" "createlane" 
	"createlanegroup" "addlanetogroup"
	"creategateway" "createevent" "createsequence" 
	"createprocessmask" "createlanemask"

	"newthing"
	))

(defvar mysfs-types  
  '("set" "setvalue"))

(defvar mysfs-constants
  '( "N" "1"))

(defvar mysfs-keywords 
  '("echo" "autopropagate" "addable" "setable" 
	"task" "gateway" "newestthing"
	))

;;some of these might also be functions
(defvar mysfs-builtins
  '("alias" "listalias" "listadd" "lookup" "concatenate" 
	"stdev" "count" "maxvalue" "listaverage" 
	"add" "subtract" "multiply" "divide"))


(defvar mysfs-keywords-regexp (regexp-opt mysfs-keywords 'words))
(defvar mysfs-type-regexp (regexp-opt mysfs-types 'words))
(defvar mysfs-constant-regexp (regexp-opt mysfs-constants 'words))
(defvar mysfs-functions-regexp (regexp-opt mysfs-functions 'words))
(defvar mysfs-builtins-regexp (regexp-opt mysfs-builtins 'words))


;; clear memory, i know, bad way
(setq mysfs-keywords nil)
(setq mysfs-types nil)
(setq mysfs-constants nil)
(setq mysfs-events nil)
(setq mysfs-functions nil)

;;the actual syntax coloring
(setq mysfs-font-lock-keywords
  `(
    (,mysfs-type-regexp . font-lock-type-face)
    (,mysfs-constant-regexp . font-lock-constant-face)
	(,mysfs-builtins-regexp . font-lock-builtin-face)
    (,mysfs-functions-regexp . font-lock-function-name-face)
    (,mysfs-keywords-regexp . font-lock-keyword-face)
	("^\\(\\s-*\\)#.+" . font-lock-comment-face)
	
	))






(define-derived-mode sfs-mode fundamental-mode
  "sfs-mode"
  "Major mode for editing .sfs (Siberfiber Script) Language."
  ;;
  
  ;;syntax highlighting
  (setq font-lock-defaults '((mysfs-font-lock-keywords)))
  ;;clear the crap i defined
  (setq mysfs-keywords-regexp nil)
  (setq mysfs-types-regexp nil)
  (setq mysfs-constants-regexp nil)
  (setq mysfs-events-regexp nil)
  (setq mysfs-functions-regexp nil)
  )