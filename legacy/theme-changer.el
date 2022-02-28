;;;;; themes ==================================================================

;;;; Theme changer was being used before I discovered circadian. 

;; (use-package theme-changer
;;   :ensure t
;;   :init
;;   (setq calendar-location-name "Ege"
;;         calendar-latitude "32.10"
;;         calendar-longitude "27.29")
;;   :config
;;   (change-theme 'leuven 'sanityinc-tomorrow-eighties))

;;;;adding time support for dark themes at night. theme-changer.el
;;;;currently loading from my emacs directory. 
;; (setq calendar-location-name "Ege"
;;       calendar-latitude "32.10"
;;       calendar-longitude "27.29")
;; (require 'theme-changer)
;; ;;(change-theme 'leuven 'sanityinc-tomorrow-eighties)
;; ;;;change theme function seems to working opposite the way in
;; ;;;documentation or it is not working at all.  currently testing......
;; (change-theme 'sanityinc-tomorrow-eighties 'leuven)
