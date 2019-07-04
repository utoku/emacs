;; A quick mode for fourlands helpfiles

;;doesn't work currently

(setq myhlp-font-lock-keywords 
	  '(
		("^#[A-Z]+" . font-lock-keyword-face)
		("^[-0-9]+[A-Z +]+~" . font-lock-comment-face)))
		
(define-derived-mode lands-help-mode fundamental-mode
  "lands-help-mode"
  "Mode for editing lands help files."
  (setq font-lock-defaults '((myhlp-font-lock-keywords))))