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
