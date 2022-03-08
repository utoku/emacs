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
  (setq dashboard-startup-banner nil)
  (setq dashboard-set-footer nil)
  (setq dashboard-items '((agenda .  10)
                          (projects . 5)
                          (recents . 5)
                          (bookmarks . 5)
                          (registers . 5))))


