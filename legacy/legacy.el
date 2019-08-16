;;;;; utku's old .emacs, the legacy stuff left over from previous years. 


;;;;; general stuff ===========================================================


;;(global-set-key [f6] 'change-buffer)
;;(global-set-key [f5] 'other-window)
;;(global-set-key [f5] 'php-mode)
;;(global-set-key [f6] 'html-mode)
;;(global-set-key [f7] 'perl-mode)
;;(global-set-key [f8] 'leod)
;;(global-unset-key "\C-x\C-c") ;unset the kill-emacs key
;;(global-set-key "\C-c\C-u" 'uncomment-region) ;;FIXME

;;;-----------------------------------------------------------------------------

;;;;; loading files ============================================================

;; ;;file finder
;; ;;searches load-path for the file, and returns true or nil
;; (defun file-exists-in-load-path-p (filename path)
;;   (if path 
;; 	  (let (currentpath (car path))
;; 		(if (file-exists-p (concat currentpath "/" filename))
;; 			t
;; 		  (file-exists-in-load-path-p filename (cdr path))))))



;;;;; packages ================================================================



;;; colorthemes
;;; FIXME: currently loading them with the leod function. 
;; (require 'color-theme "color-theme" t)
;; (load "color-theme" t)
;; (color-theme-deep-blue) ;;messes up my color-theme-light




;;;-----------------------------------------------------------------------------
;;emacs code browser
;(add-to-list 'load-path "~/emacs/ecb")
;(require 'ecb)
;ecb-activate, ecb-minor-mode, ecb-byte-compile and ecb-show-help.
;(require 'ecb-autoloads)


;;;-----------------------------------------------------------------------------
;;; psvn
;;; comes with debian's subversion package
(require 'psvn "psvn" t)
(setq svn-status-verbose nil)


;;;-----------------------------------------------------------------------------
;;; git stuff comes in the directory below with git-core in debian(lenny)
;(add-to-list 'load-path "/usr/share/doc/git-core/contrib/emacs")
;; debian squeeze
;(add-to-list 'load-path "/usr/share/doc/git/contrib/emacs")
;(require 'git)
;(require 'git-blame)
;(require 'vc-git)

;; (setq load-path (cons (expand-file-name 
;; 		       "/usr/share/doc/git/contrib/emacs") 
;; 		      load-path))
;; (require 'vc-git)
;; (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))

;; (require 'git) 
;; (autoload 'git-blame-mode "git-blame"
;;   "Minor mode for incremental blame for Git." t)

;;;-----------------------------------------------------------------------------
;;; tramp for remote editing
;;; emacs22 or later includes tramp
;(require 'tramp "tramp" t)
;(setq tramp-syntax 'url)
;(setq tramp-auto-save-directory "~/tmp")


;;;-----------------------------------------------------------------------------
;;; ido
;;; ido comes with emacs23 and later, require it in that case
;; (check-and-load "ido.el")
;(require 'ido)
;(ido-mode t)
;(setq ido-enable-flex-matching t) ;; enables fuzzy matching


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

;; ---------------------------------------------------------------------------

;;sfs-mode, siberfiber scripts
(check-and-load "sfs-mode.el")
(add-to-list 'auto-mode-alist '("\\.sfs$" . sfs-mode)) 

;;;;; end of programming modes ================================================


;;;;; misc ====================================================================

					;function to load up color definitions, requires color-theme
(defun leod () 
  (interactive)
  (load-file "~/emacs/leod.el")
  (color-theme-leod))

(defun light-theme() 
  (interactive)
  (load-file "~/emacs/leod.el")
  (color-theme-light))

;;enabling this line fucks up background in remote terminals, but
;;function call later doesn't
;(load-file "~/emacs/leod.el")

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(jde-jdk (quote ("1.6")))
;;  '(jde-jdk-registry (quote (("1.6" . "/usr/lib/jvm/java-6-sun")))))

;;; testing stuff =========================================================

;;(load "~/emacs/nxml/autostart.el")

;; (add-to-list 'auto-mode-alist '("\\.css\\'" . css2-mode))
;; (autoload 'css2-mode "css2-mode" nil t)

;; (autoload 'hexcolour-mode "hexcolour" nil t nil)
;;  (defvar hexcolour-keywords
;;    '(("#[abcdef[:digit:]]\\{6\\}"
;;       (0 (put-text-property (match-beginning 0)
;;                          (match-end 0)
;;                          'face (list :background
;;                                   (match-string-no-properties 0)))))))

;;  (defun hexcolour-add-to-font-lock ()
;;    (font-lock-add-keywords nil hexcolour-keywords))


;; (add-hook 'css2-mode-hook 'hexcolour-add-to-font-lock)
;; (add-hook 'css2-mode-hook 'imenu-add-menubar-index)


;;;;===========================================================================
;; temporary stuff





;;;;; ortakmesaj temp stuff ==================================================


;; (defun frontend-list-files ()
;;   (interactive)
;;   (find-file (concat om-directory "frontend")))

;; (global-set-key (kbd "<f9>") 'frontend-list-files)

;; (defun frontend-js-list-files ()
;;   (interactive)
;;   (find-file (concat om-directory "frontend/js")))

;; (global-set-key (kbd "<f10>") 'frontend-js-list-files)


;;;;; ucpadp temp stuff =======================================================

;; ucpadp diff checking

;; (defun libdiff  ()
;;   (interactive)
;;   (let ((source-file (read-from-minibuffer "Ucpadp Lib File Name: ")))
;; 	(ediff 
;; 	 (concat "~/projects/ucpadp3/lib/" source-file)
;; 	 (concat "~/projects/gateway-1.4.3/gwlib/" source-file))))

;; (defun hdiff  ()
;;   (interactive)
;;   (ediff "~/projects/ucpadp3/daemon/httpconnector.c" 
;; 		 "~/projects/gateway-1.4.3/gw/smsbox.c"))

;; (defun sdiff  ()
;;   (interactive)
;;   (ediff "~/projects/ucpadp3/daemon/smsrouter.c" 
;; 		 "~/projects/gateway-1.4.3/gw/bearerbox.c"))
