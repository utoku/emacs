;;;;; testing color stuff ======================================================
;(load-file "~/emacs/color-theme.el")

(defun color-theme-light ()
  (interactive)
  (color-theme-install
   '(color-theme-light

     ;;do something orange red, #12AF22
     ;;#11971E green kind
     ;;gray40 for comments

     ;;((background-color . "ivory"))
     ((background-color . "white"))
     (font-lock-comment-face       ((t (:foreground "gray40" ))))
     (font-lock-variable-name-face ((t (:foreground "#0B7F17"))))   
     )))
     

(defun color-theme-leod ()
  "Color theme by Utku Somer, modified 20100625.
Green on black theme including programmer font-locks, general
menu and side colors, some diff, some changelog, some svn, some
speedbar, and etc."
  (interactive)
  (color-theme-install
   '(color-theme-leod
	 
     ;;you can show the current faces with M-x list-faces-display, 
     ;;if you want to change something here.

     ;;I guess this is the primary stuff.
     ((background-color . "black")
      (background-mode  . dark)
      (border-color     . "black")
      (cursor-color     . "yellow")
      (foreground-color . "#00ff00")
      (mouse-color      . "yellow"))
     
     ;;some other stuff
     ((help-highlight-face      . underline)
      (list-matching-lines-face . bold)
      (widget-mouse-face        . highlight))
     
     ;;general stuff
     ;;(default ((t (:foreground "green" :bold t))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (italic ((t (:italic t :slant italic))))     
     (underline ((t (:underline t))))
     
     (border ((t (:background "black"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (cursor ((t (:background "yellow"))))
     (fixed-pitch ((t (:family "courier"))))
	 
     ;;selecting regions
     (region ((t (:background "blue" :foreground "white"))))

     ;;these are the font-lock faces for general programming stuff
     ;;builtins include lisp keyword parameters, bash builtins
     (font-lock-builtin-face       ((t (:foreground "white"))))
     ;;comments 
     (font-lock-comment-face       ((t (:foreground "cyan2" ))))
     ;(font-lock-comment-face       ((t (:foreground "cyan3" ))))
     ;;constants
     (font-lock-constant-face      ((t (:foreground "yellow"))))
     (font-lock-doc-face           ((t (:foreground "cyan"  ))))
     (font-lock-doc-string-face    ((t (:foreground "cyan"  ))))
     (font-lock-function-name-face ((t (:foreground "purple" :bold))))
     ;;keywords
     (font-lock-keyword-face       ((t (:foreground "green"  :bold t))))
     (font-lock-preprocessor-face  ((t (:foreground "cyan"))))
     (font-lock-reference-face     ((t (:foreground "red"))))
     ;;strings 
     (font-lock-string-face        ((t (:foreground "cyan2"))))
     ;(font-lock-string-face        ((t (:foreground "cyan"))))
     ;;types, all kinds of type declarations 
     (font-lock-type-face          ((t (:foreground "#ffff00"))))
     ;;variables (was violet) 
     (font-lock-variable-name-face ((t (:foreground "violet"))))
     ;;grepped file names, 
     (font-lock-warning-face       ((t (:foreground "red"    :bold t :weight bold))))
	 
     ;;paranthesis, for show-paren-mode
     (show-paren-match-face        ((t (:background "turquoise" :foreground "white"))))
     (show-paren-mismatch-face     ((t (:background "red" :foreground "white"))))
	 
	
     ;;diff mode stuff
     (diff-context-face ((t (:foreground "gray"))))
     (diff-changed-face ((t (:foreground "red"  ))))
     (diff-removed-face ((t (:foreground "red"  ))))
     (diff-added-face   ((t (:foreground "cyan"))))
	 (diff-file-header-face ((t (:foreground "white" :background "blue"))))
	 (diff-header-face  ((t (:foreground "white" :background "navy blue"))))

     ;;ediff highlighting
     (ediff-current-diff-A ((t (:foreground "white" :background "green"))))
     (ediff-current-diff-B ((t (:foreground "white" :background "green"))))
     (ediff-fine-diff-A    ((t (:foreground "black" :background "sky blue"))))
     (ediff-fine-diff-B    ((t (:foreground "black" :background "sky blue"))))
	 
     (ediff-odd-diff-A     ((t (:foreground "red" :background "black" :underline t))))
     (ediff-even-diff-A    ((t (:foreground "red" :background "black" :underline t))))
     (ediff-odd-diff-B     ((t (:foreground "orange" :background "black" :underline t))))
     (ediff-even-diff-B    ((t (:foreground "orange" :background "black" :underline t))))
	 

     ;;erc 
     (erc-input-face ((t (:foreground "orange" :background "black"))))


     ;;changelog stuff
     ;;change-log-date-face
     ;;(change-log-email-face ((t (:foreground "yellow"))))
     ;;change-log-file-face
     ;;change-log-function-face
     ;;change-log-list-face
     ;;change-log-name-face

     ;;and some svn mode faces, for psvn
     (svn-status-directory-face ((t (:foreground "blue" :bold t))))
     (svn-status-filename-face  ((t (:foreground "green" ))))
     (svn-status-marked-face    ((t (:foreground "red" ))))


     ;;dired
     (dired-directory ((t (:foreground "blue" :bold t))))
	 
     ;;blank-mode stuff, not really too usefull, but hell.
     (blank-empty ((t (:foreground "gray32"))))
     (blank-hspace ((t (:foreground "gray32"))))
     (blank-indentation ((t (:foreground "gray32"))))
     (blank-line ((t (:foreground "gray32"))))
     (blank-newline ((t (:foreground "gray32"))))
     (blank-space ((t (:foreground "gray32"))))
     (blank-space-after-tab ((t (:foreground "gray32"))))
     (blank-space-before-tab ((t (:foreground "gray32"))))
     (blank-tab ((t (:foreground "gray32"))))
     (blank-trailing ((t (:foreground "gray32"))))
	 

     ;;menu, mode-line, toolbar, etc. 
     ;;menu, toolbar and scrollbar not effective in emacs-gtk
     (menu                ((t (:background "gray16" :foreground "white"
					   :box (:line-width 1 :style released-button)))))
     (mode-line           ((t (:background "gray16" :foreground "SteelBlue" 
					   :box (:line-width 1 :style released-button)))))
     (mode-line-inactive  ((t (:background "black" :foreground "SteelBlue" 
					   :box (:line-width 1 :style released-button)))))
     (mode-line-buffer-id ((t (:background "gray16" :foreground "SteelBlue" 
					   :box (:line-width 1 :style released-button)))))
     (tool-bar            ((t (:background "gray16" :foreground "green" 
					   :box (:line-width 1 :style released-button)))))
     (tooltip             ((t (:background "gray16" :foreground "SteelBlue"
					   :box (:line-width 1 :style released-button)))))
     (scroll-bar          ((t (:background "gray16" :foreground "#00ff00"))))
	 
     (minibuffer-prompt   ((t (:foreground "orange"))))
	 

     ;;dividers and borders
     (horizontal-divider  ((t (:background "gray16" :foreground "#ffff00"
					   :box (:line-width 1 :style released-button)))))
     (vertical-border     ((t (:background "gray16" :foreground "SteelBlue"))))
     (vertical-divider    ((t (:background "gray16" :foreground "yellow"))))
     ;;the fringes are the narrow portions of the Emacs frame between
     ;;the text area and the window's right and left borders
     (fringe              ((t (:background "gray16" :foreground "yellow"))))
	 
     (header-line ((t (:box (:line-width -1 :style released-button) :background "grey20" :foreground "grey90" :box nil))))
     (highlight ((t (:background "blue"))))
     
     (isearch ((t (:background "palevioletred2" :foreground "white"))))
     (isearch-lazy-highlight-face ((t (:background "paleturquoise4" :foreground "white"))))
     
	 
     ;;(modeline-mousable ((t (:background "gray16" :foreground "#00ff00"))))
     ;;(modeline-mousable-minor-mode ((t (:background "gray16" :foreground "#00ff00"))))
     
     (mouse ((t (:background "yellow"))))
     (primary-selection ((t (:background "#00ff00" :foreground "black"))))
     (secondary-selection ((t (:background "#00ff00" :foreground "black"))))
     
     ;;speedbar stuff
     (speedbar-button-face ((t (:foreground "#00ff00"))))
     (speedbar-directory-face ((t (:foreground "#00ff00"))))
     (speedbar-file-face ((t (:foreground "cyan"))))
     (speedbar-highlight-face ((t (:background "#00ff00" :foreground "purple"))))
     (speedbar-selected-face ((t (:foreground "deeppink" :underline t))))
     (speedbar-tag-face ((t (:foreground "yellow"))))
	 
     (trailing-whitespace ((t (:background "red"))))
     (variable-pitch ((t (:family "helv"))))

     ;;widgets are problematic right now...
     (widget-button-face ((t (:bold t :weight bold))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "orange"))))
     (widget-field-face ((t (:background "gray16"))))
     (widget-inactive-face ((t (:foreground "light gray"))))
     (widget-single-line-field-face ((t (:background "dim gray"))))
	 
     ;;region in XEmacs, just in case
     (zmacs-region ((t (:background "steelblue" :foreground "white")))))))

