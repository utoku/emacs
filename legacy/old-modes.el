;;;;; programming modes ========================================================

;;; some of the long stuff might have been byte compiled with
;;; emacs-lisp-byte-compile

;;FIXME: trying nxhtml mode. disabled html-helper-mode, javascript,
;;and php modes temporarily because of this.

;(check-and-load "nxhtml/autostart.el")

;; ----------------------------------------------------------------------------

;;testing out company-irony autocompletition
;(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
;; (eval-after-load 'company
;;   '(add-to-list
;;     'company-backends '(company-irony-c-headers company-irony)))


;; ----------------------------------------------------------------------------


;; c#
;;;; removing because of compile error in emacs26
;; (require 'csharp-mode)

;; (defun my-csharp-mode-fn ()
;;   "function that runs when csharp-mode is initialized for a buffer."
;;   (parkyeri-indentation))
;; (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

;; ----------------------------------------------------------------------------

;; go-mode. requires that you install go lang in /usr/local/go(default)

;(setq load-path (cons "/usr/local/go/misc/emacs" load-path))
;(setq load-path (cons "/home/utku/go/misc/emacs" load-path))
;(require 'go-mode-load)


;; ----------------------------------------------------------------------------

;; javascript

;;; javascript mode, if it exists

(when (locate-library "~/emacs/javascript")
  (autoload 'javascript-mode "~/emacs/javascript.el" nil t)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode)))

;; try the js2-mode for qooxdoo sometime
;;;;(autoload 'js2-mode "js2" nil t)
;; (autoload 'js2-mode "~/emacs/js2.el" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; ----------------------------------------------------------------------------

;; trying out mmm-mode for weburunu pages, cancelled

;;(require 'php-mode "php-mode" t) ;debian package: php-elisp
(check-and-load "php-mode")
;;(add-hook 'php-mode-user-hook 'turn-on-font-lock)
;(require 'mmm-mode) ;debian package: mmm-mode
;;(setq mmm-global-mode 'maybe)
;(setq mmm-submode-decoration-level 0) ;turn off extra highlighting in submodes

;; (mmm-add-group 'fancy-html
;; 	       '(
;; 		 (html-php-tagged
;; 		  :submode php-mode
;; 		  :face mmm-code-submode-face
;; 		  :front "<[?]php"
;; 		  :back "[?]>")
;; 		 (html-css-attribute
;; 		  :submode css-mode
;; 		  :face mmm-declaration-submode-face
;; 		  :front "styleREMOVEME=\""
;; 		  :back "\"")))

;; i'll use the html mode for weburunu pages
;(add-to-list 'auto-mode-alist '("/w_" . html-mode)) ;weburunu pages
;(add-to-list 'auto-mode-alist '("/c_" . html-mode)) ;weburunu pages
;(add-to-list 'auto-mode-alist '("/a_" . html-mode)) ;weburunu pages

;; and turn on the fancy html for the html-mode
;;(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))

;; autodetection for weburunu pages
(add-to-list 'auto-mode-alist '("/w_" . php-mode)) 
(add-to-list 'auto-mode-alist '("/c_" . php-mode)) 
(add-to-list 'auto-mode-alist '("/a_" . php-mode)) 
(add-to-list 'auto-mode-alist '("/av_" . php-mode)) 
(add-to-list 'auto-mode-alist '("/ac_" . php-mode)) 

;(add-hook 'php-mode-hook 'kartaca-indentation)
(add-hook 'php-mode-hook 'elegant-indent)
(add-hook 'perl-mode-hook 'kartaca-indentation)

;; ----------------------------------------------------------------------------

;; ruby 

;; ;;; ruby-electric for ruby
;; (load-file (expand-file-name "~/emacs/ruby-electric.el"))
;; (require 'ruby-electric)

;; (add-hook 'ruby-mode-hook
;;   (lambda()
;;     (add-hook 'local-write-file-hooks
;;       '(lambda()
;; 	 (save-excursion
;; 	   (untabify (point-min) (point-max))
;; 	   (delete-trailing-whitespace)
;; 	   )))
;;     (set (make-local-variable 'indent-tabs-mode) 'nil)
;;     (set (make-local-variable 'tab-width) 2)
;;     (imenu-add-to-menubar "IMENU")
;;     (require 'ruby-electric)
;;     (ruby-electric-mode t)))

;; ----------------------------------------------------------------------------

;; java

;;; jdee for java programming
;;; using downloaded packages
;; (add-to-list 'load-path (expand-file-name "~/emacs/jdee/jde/lisp"))
;; (add-to-list 'load-path (expand-file-name "~/emacs/jdee/cedet/common"))
;; (load-file (expand-file-name "~/emacs/jdee/cedet/common/cedet.el"))
;; (add-to-list 'load-path (expand-file-name "~/emacs/jdee/elib"))
;; (require 'jde)

;;; new jde stuff. (requires jde debian package)
;; (setq jde-jdk-registry (quote (("1.6.0" . "/usr/lib/jvm/java-6-sun"))))
;; (setq jde-jdk (quote ("1.6")))
;; (setq jde-global-classpath 
;; 	  '(
;; 		"/home/utku/projects/vidi/server/dist/vidi/WEB-INF/classes/" 
;; 		"/home/utku/projects/vidi/server/bin" 
;; 		"/home/utku/projects/vidi/red5/red5.jar"))
	  

;; ----------------------------------------------------------------------------

;; common-lisp



;;; slime stuff for lisp programming
;(add-to-list 'load-path "~/emacs/slime-2.0/")  
;(require 'slime)
;(slime-setup)

;quicklisp slime helper
;(load (expand-file-name "~/quicklisp/slime-helper.el"))


;; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;; (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; (setq common-lisp-hyperspec-root "file:///usr/share/doc/hyperspec/")


;; ----------------------------------------------------------------------------

;; python 
;this call is buggy. try to fix guess-style.
;(add-hook 'python-mode-hook '(n-space-indentation 2))

;(add-hook 'python-mode-hook 'two-space-indentation)

;;;; use guess-style for python stuff? FIXME
;; (add-hook 'python-mode-hook guess-style-guess-tabs-mode)
;; (add-hook 'python-mode-hook 
;; 	  (lambda ()
;; 	    (when indent-tabs-mode
;; 	      (guess-style-guess-tab-width)))

;; ----------------------------------------------------------------------------

;; python
;;FIXME: still using the old python mode from my ~/emacs/
;(setq load-path `("~/emacs" . ,load-path))
;(load-library "python-mode")
;(setq auto-mode-alist
;       (cons '("\\.py$" . python-mode) auto-mode-alist))



;; ---------------------------------------------------------------------------

;;sfs-mode, siberfiber scripts
(check-and-load "sfs-mode.el")
(add-to-list 'auto-mode-alist '("\\.sfs$" . sfs-mode)) 

;;;;; end of programming modes ================================================
