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
			  (registers . 5))))


