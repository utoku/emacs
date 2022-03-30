;;;;; utku's .emacs

;;User Information
(setq user-full-name "Utku Somer")
;; decoding in case it is public
(defconst user-mail-address
  (base64-decode-string "dXRrdS5zb21lckBnbWFpbC5jb20="))
(setq erc-user-full-name "Utku Somer")
(setq erc-nick "claint")

;;;;; general stuff ===========================================================

;;highlight matches
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)
	
;; syntax hightlighting
(global-font-lock-mode 1)

;; display settings 
(column-number-mode t)
(line-number-mode t) 
;(display-time)
(menu-bar-mode 0)
(setq inhibit-startup-message t)

;some settings are only in window mode
(if window-system 
    (progn 
      (message "Detected that we are in a window system")
      (tool-bar-mode 0)
      (scroll-bar-mode 0)
      ;mousewheel
      (mouse-wheel-mode t))
  (progn 
    (message "Detected that we are in a terminal")
    ;get mouse working in xterm
    (xterm-mouse-mode 1)))


;; y-or-n alias
(defalias 'yes-or-no-p 'y-or-n-p)

;; keep no backup files 
(setq make-backup-files nil)
;; save desktop sessions
(desktop-save-mode 1)

;; quick changing between buffers
(defun change-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

;kill whole line
(setq kill-whole-line t)

;some buffer key bindings
(global-set-key [f5] 'kill-this-buffer)
(global-set-key [f6] 'buffer-menu)
(global-set-key [f7] 'whitespace-mode)

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(global-set-key [(%)] 'goto-match-paren)

;; ctrl-z for undoing (instead of suspending)
(global-set-key [ (control z) ] 'undo)

;;text mode should have auto-fill
;(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; ediff settings
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-make-buffers-readonly-at-startup t)
(setq diff-default-read-only 1)

;; default browser 
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")


;;;;; loading files ============================================================

(add-to-list 'load-path "~/emacs")
(setq my-load-path "~/emacs/")


;;loader function that loads from my-load-path and checks if file exists
(defun check-and-load (lispfile)
  (let ((file2load (concat my-load-path lispfile)))
	(when (file-exists-p file2load)
	  (load-file (expand-file-name file2load)))))
;;;-----------------------------------------------------------------------------

;window controls
(check-and-load "windmove-0.95.el")

;; rule emacs windows like xmonad way
;; Loads modified version by Utku Somer.
(check-and-load "emacsd-tile.el")

;;;;; package archives (came with emacs24) ====================================

(load "package")
;;melpa stable repository
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize) ;; needs to run after defining package-archives


;;spanking new repository
;; (add-to-list 'package-archives
;;              '("melpa-new" . "https://melpa.org/packages/") t)

;;;;; list of my packages -----------------------------------------------------
(defvar usomer/packages '(
                          ivy
                          swiper
                          circadian
                          counsel
                          counsel-etags
                          company-ycmd
                          company-irony-c-headers
                          flycheck-ycmd
                          ycmd
                          dashboard
                          js2-mode
                          julia-mode
                          leuven-theme
                          magit
                          powerline
                          projectile
                          rainbow-delimiters
                          xref-js2
                          yaml-mode)
  "Utku Somer's Default Packages")
;;others: web-mode, python-mode, html-helper.mode, projectile.
;; ivy, swiper(ivy), counsel(ivy) 

;; --------------------------------------------------------
;; Current packages installed via debian:
;; (They get elpa-* names in front of them.)
;;
;; magit, projectile
;; use-package
;; yaml-mode
;; ---------------------------------------------------------


(defun usomer/packages-installed-p ()
  (loop for pkg in usomer/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

;;TODO function to check and install and/or UPDATE my packages

;;;;; themes ==================================================================

;; leuven is a nice light theme.
;; (if window-system
;;     (load-theme 'leuven t)
;;   (load-theme 'wombat t))

;;;;circadian. theme support with time. 
(defconst YF/latitude  38.73) ;; N
(defconst YF/longitude 26.83) ;; E

(defconst YK/latitude  32.1)  ;; N
(defconst YK/longitude 27.29) ;; E

(defconst SF/latitude  37.77)   ;; N
(defconst SF/longitude -122.41) ;; W

(use-package circadian
  :config
  (setq calendar-latitude  YF/latitude)
  (setq calendar-longitude YF/longitude)
  (setq circadian-themes '((:sunrise . hydandata-light)
                           (:sunset . sanityinc-tomorrow-eighties)))
  (circadian-setup)
  :hook (desktop-after-read . circadian-setup )
  )

;;;;; emacs packages and goodies ==============================================
;; some of these calls use the use-package macro. make sure that is
;; loaded first.

;;magit is a nice git interface
;(require 'magit)
;(global-set-key (kbd "C-x g") 'magit-status)
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;;;;; ido ---------------------------------------------------------------------

;;ido mode
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;;;;; ivy configuration--------------------------------------------------------
;;ivy, swiper and counsel settings are together here.

(use-package ivy
  :ensure t
  :commands (ivy-mode)
  :config
  (require 'ivy)
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-wrap t)
  ;;global-set-key (kbd "C-c C-r") 'ivy-resume)
  ;; Show #/total when scrolling buffers
  (setq ivy-count-format "%d/%d ")
  )

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ;;("C-r" . swiper)
         )
  )

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("<f1> f" . counsel-describe-function)
         ("<f1> v" . counsel-describe-variable)
         ("<f1> l" . counsel-find-library)
         ("<f2> i" . counsel-info-lookup-symbol)
         ("<f2> u" . counsel-unicode-char)
         ("C-c g" . counsel-git-grep)
         ("C-c j" . counsel-git)
         ("C-c k" . counsel-ag)
         ;;("C-c r" . counsel-rg)
         ("C-r" . counsel-rg)
         ("C-x l" . counsel-locate)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-add)
         )
  :config
  (if (executable-find "rg")
      ;; use ripgrep instead of grep because it's way faster
      (setq counsel-grep-base-command
            "rg -i -M 120 --no-heading --line-number --color never '%s' %s"
            counsel-rg-base-command
            "rg -i -M 120 --no-heading --line-number --color never %s ."
            )
    (warn "\nWARNING: Could not find the ripgrep executable. It "
          "is recommended you install ripgrep.")
    )
  )

(use-package counsel-etags
  :ensure t
  :bind (
         ("M-." . counsel-etags-find-tag-at-point)
         ("M-t" . counsel-etags-grep-symbol-at-point)
         ("M-s" . counsel-etags-find-tag))
  )


;;;;; powerline ---------------------------------------------------------------

;; currently testing, gives a bit of theming to the powerline
(require 'powerline)
(powerline-default-theme)

;;;;; projectile --------------------------------------------------------------
(require 'projectile)
;;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;;;;; smex --------------------------------------------------------------------
;;requires some debugging

;;(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)


;;;;; ycmd --------------------------------------------------------------------
;;;; you complete me daemon integration.
;;; This requires that you have ymcd [debian package] installed, and
;;; have a working ycm_conf.py

;; (require 'ycmd)
;; (add-hook 'c++-mode-hook 'ycmd-mode)
;; (set-variable 'ycmd-server-command '("python3" "/usr/lib/ycmd/ycmd/"))

(use-package ycmd
  :ensure t
  :init (add-hook 'c++-mode-hook #'ycmd-mode)
  :config
  ;(set-variable 'ycmd-startup-timeout 8)
  (set-variable 'ycmd-server-command '("python3" "/usr/lib/ycmd/ycmd/"))
  ;(set-variable 'ycmd-global-config (expand-file-name "~/path/to/ycmd/ycm_conf.py"))
  ;(set-variable 'ycmd-extra-conf-whitelist '("~/Repos/*"))

  (use-package company-ycmd
    :ensure t
    :init (company-ycmd-setup)
    ;:config (add-to-list 'company-backends (company-mode/backend-with-yas 'company-ycmd))
    ))

;;company mode enables the completion UI. It is a modular in-buffer
;;completion framework for Emacs.
(use-package company
  :ensure t
  :config
  ;; Zero delay when pressing tab
  (setq company-idle-delay 0)
  (add-hook 'after-init-hook 'global-company-mode)
  ;; remove unused backends
  (setq company-backends (delete 'company-semantic company-backends))
  (setq company-backends (delete 'company-eclim company-backends))
  (setq company-backends (delete 'company-xcode company-backends))
  (setq company-backends (delete 'company-clang company-backends))
  (setq company-backends (delete 'company-bbdb company-backends))
  (setq company-backends (delete 'company-oddmuse company-backends))
  )





;;;;; packages being tested are here for now ----------------------------------
;; load the packages being tested
(check-and-load "testing.el")

;;;;; styles and indentation ==================================================

;; complying with some weird tab mode
;(setq indent-tabs-mode t)
;(setq-default indent-tabs-mode t)
;(global-set-key (kbd "TAB") 'self-insert-command)

;; use setq-default if you are going for all c-mode languages

(defun default-indentation ()
  (interactive)
  (setq-default tab-width 8) 
  (setq-default c-basic-indent 4)  
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil))

(defun noapi-indentation ()
  (interactive)
  (setq-default tab-width 4) 
  (setq-default c-basic-indent 4)  
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode t)
  (c-set-style "k&r"))

;; another indentation
(defun four-space-indentation ()
  (interactive)
  (setq c-basic-offset 4)) ;for all c-based langs use setq-default

(defun two-space-indentation ()
  (interactive)
  (setq c-basic-offset 2)
  (setq python-indent 2)
  (setq js-indent-level 2)) 

;; FIXME
(defun n-space-indentation (number)
  (c-set-style "K&R")
  (setq c-basic-offset number))

;; 4lands and kannel/ucpadp3 indentation
(defun 4lands-indentation () 
  (interactive)
  (c-set-style "K&R")
  (four-space-indentation)
  (setq tab-width 8)
  (setq indent-tabs-mode nil))


(defun python-indentation () 
  (interactive)
  (setq indent-tabs-mode nil)) ;puts only spaces in

;indentation hooks, this stuff might go into programming modes as well
(add-hook 'c-mode-common-hook '4lands-indentation)
;(setq js-indent-level 2)
(add-hook 'python-mode-hook 'python-indentation)
(add-hook 'js-mode-hook 'two-space-indentation)
;;js2-mode adds at package definition.


;;current default indentation
(default-indentation)

;;; also load blank-mode in case need to see the indentation
;;; whitespace-mode, which is built in replaces this, but I need to
;;; set its colors right.
(load "blank-mode.el")

;; guess-style ----------------------------------------------------------------


;; guess-style is removed because it uses package `cl which is deprecated.
;; you can use the normal guesser functions in emacs, search for
;; Guessing the Style

;;FIXME: guess-style is using some old functions, needs update,
;;;;;(add-to-path 'load-path "/path/to/guess-style")
;; (check-and-load "guess-style.el") 
;; (autoload 'guess-style-set-variable "guess-style" nil t)
;; (autoload 'guess-style-guess-variable "guess-style")
;; (autoload 'guess-style-guess-all "guess-style" nil t)

;; (global-guess-style-info-mode 1) ;; shows guess variables

;;=============================
;; Use ruler in text-mode
(add-hook 'text-mode-hook
          (function (lambda ()
                      (setq ruler-mode-show-tab-stops t)
                      (ruler-mode 1))))


;;;;; programming modes ========================================================



;;Some C++11 keywords were missing, using this for now:
;;alternatively there is also a modern-cpp-font-lock mode available now.
(add-hook 'c++-mode-hook
      '(lambda()
        (font-lock-add-keywords
         nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; add the new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT
           ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; user-types (customize!)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
        ) t)

;;;; Note that I also use ycmd package (above) with c++ mode.

;; ----------------------------------------------------------------------------


;(add-to-list 'auto-mode-alist '("\\.xxx$" . xxx-mode))

;;; html-helper mode
;; (if (check-and-load "html-helper-mode.el")
;; 	(message "html-helper-mode.el loaded from path"))

;; ----------------------------------------------------------------------------

;; (add-hook 'html-mode-hook
;; 	  (lambda ()
;; 	    ;; Default indentation is usually 2 spaces, changing to 4.
;; 	    (set (make-local-variable 'sgml-basic-offset) 4)))

;; ----------------------------------------------------------------------------

;; common-lisp

;;; the lisp program
;(setq inferior-lisp-program "/usr/bin/clisp -K full")
(setq inferior-lisp-program "/usr/bin/sbcl")


;; ----------------------------------------------------------------------------

;; js2-mode for javascript

;;(require 'js2-mode)
;;(setq auto-mode-alist (rassq-delete-all 'js-mode auto-mode-alist))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;(add-to-list 'interpreter-mode-alist '("nodejs" . js2-mode))
;;(add-to-list 'auto-mode-alist `(,(rx ".js" string-end) . js2-mode))
;;(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; CAUTION: interpreter-mode-alist overrides auto-mode-alist. I
  ;; learned this the hard way so this comment stays.
  (add-to-list 'interpreter-mode-alist '("nodejs" . js2-mode))
  ;; Better imenu
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  ;;noapi tabs indentation for now
  (add-hook 'js2-mode-hook 'two-space-indentation))
  

;;;; This adds js2-mode as minor to the regular js-mode:
;;(add-hook 'js-mode-hook 'js2-minor-mode)

(add-hook 'js-mode-hook 'two-space-indentation)


;;;; xref-js2 provides an ag based search instead of ctags in js2-mode
(require 'xref-js2)

;;;; js-mode (which js2 is based on) binds "M-." which conflicts with
;;;; xref, so we unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))


;;;;TODO test js2-refactor, tern, indium

;; ----------------------------------------------------------------------------

;; web, multiple modes

(require 'web-mode)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-css-indent-offser 4)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; ----------------------------------------------------------------------------
;; org-mode stuff

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-span 14)
(setq org-agenda-files (list "~/eisen/eisentodo.org"
                             "~/eisen/worktodos.org"
                             "~/eisen/jobhunt/jobs.org"))
;;;"~/mud/eoeplan/todolist.org"

;; other hooks -------------------------------------------------------------

(add-hook 'change-log-mode-hook 'turn-on-auto-fill)

;;;;; end of programming modes ================================================


;;;;; current screen font =====================================================

;(set-frame-font "Inconsolata-15")
;(set-frame-font "Inconsolata-13")
;(set-frame-font "Inconsolata-16.5")
;(set-frame-font "Monospace-13")
;(set-frame-font "Terminus-16.5")
;(set-frame-font "Monaco-13")
(set-frame-font "VictorMono-14")
;(set-frame-font "iosevka-14")

;;;;; encoding ================================================================

(setq locale-coding-system     'utf-8)
(set-terminal-coding-system    'utf-8)
(set-keyboard-coding-system    'utf-8)
(set-selection-coding-system   'utf-8)
(prefer-coding-system          'utf-8)
(set-buffer-file-coding-system 'utf-8)

;;;;; misc ====================================================================

;;; speedbar
;;; it is here because it is better to load it after fonts
;(defconst my-speedbar-buffer-name "HIZLIBAR")
;(speedbar)    ;loads speedbar at startup

;;;;; project control and git ==================================================



;; load my project directory control code.  (looks like this might get
;; replaced with projectile, as it kind of does the same thing.)
(check-and-load "uprojects.el")

(global-set-key (kbd "<f9>") 'project-select)
;; the old bindings for the git functions (I just use magit now)
;(global-set-key (kbd "<f11>") 'pr-branch-diff)
;(global-set-key (kbd "<f12>") 'pr-diff)


;;;;; misc ====================================================================


;; erc, emacs irc, hide channel join messages 
(setq erc-hide-list '("JOIN" "PART" "QUIT"))


;;;;; other functions =========================================================

(defun dcom ()
  ;; Insert a javadoc method comment at the cursor position
  (interactive)
  (insert
"/**
 *
 *
 *
 *
 * @param
 * @return
 */
")
(previous-line 6)
(end-of-line)) 

(defun xcom ()
  ;; Insert a splitter comment at the cursor position
  (interactive)
  (insert
"/* ================================================================== 
 *
 *
 * ================================================================== */
")
(previous-line 3)
(end-of-line)) 



(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


(defun totd ()
  (interactive)
  (with-output-to-temp-buffer "*Tip of the day*"
    (let* ((commands (loop for s being the symbols
                           when (commandp s) collect s))
           (command (nth (random (length commands)) commands)))
      (princ
       (concat "Your tip for the day is:\n"
               "========================\n\n"
               (describe-function command)
               "\n\nInvoke with:\n\n"
               (with-temp-buffer
                 (where-is command t)
                 (buffer-string)))))))

(defun center-rectangle (beg end)
  (interactive "*r")
  (kill-rectangle beg end)
  (with-temp-buffer
    (yank-rectangle)
    (setq fill-column (current-column))
    (center-region (point-min) (point-max))
    (goto-char (point-max))
    (move-to-column fill-column t)
    (kill-rectangle (point-min) (point)))
  (goto-char beg)
  (yank-rectangle))



;;;;; load any other special stuff for this host if it exists =================
(check-and-load (concat "special." system-name ".el"))

;;;;; custom overwritten stuff=================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-safe-themes
   '("3e15b69a7b2572c64f5f04ebf1103deb803ec762f4270f3f1e498fb4b659afd3" "161993d0fe35db6321a69a5427d0900380f2b855013b698c6cf70d20c7bb43fa" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" default))
 '(fci-rule-color "#515151")
 '(hl-paren-background-colors '("#2492db" "#95a5a6" nil))
 '(hl-paren-colors '("#ecf0f1" "#ecf0f1" "#c0392b"))
 '(hl-sexp-background-color "#efebe9")
 '(package-selected-packages
   '(hydandata-light-theme xref-js2 circadian dashboard company-ycmd flycheck-ycmd counsel counsel-etags magit js2-refactor js2-mode powerline rainbow-delimiters material-theme leuven-theme julia-mode company-irony-c-headers color-theme-sanityinc-tomorrow))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
