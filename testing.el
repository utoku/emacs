;;;;; themes ==================================================================
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


;;;;; emacs packages and goodies ==============================================
;; some of these calls use the use-package macro. make sure that is
;; loaded first.

;;;;; dashboard ---------------------------------------------------------------
;;dashboard provides a cool summary at the startup.
;;testing for now
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-footer nil)
  (setq dashboard-items '((recents . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda .  10)
                          (registers . 5)) )


;;;;circadian. theme support with time. 
(use-package circadian
  :config
  (setq calendar-latitude 32.1)
  (setq calendar-longitude 27.29)
  (setq circadian-themes '((:sunrise . leuven)
                           (:sunset . sanityinc-tomorrow-eighties)))
  (circadian-setup))
