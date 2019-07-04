;; emacsd-tile.el -- tiling windows for emacs
;; modified by utku 

(defun swap-with (dir)
  (interactive)
  (let ((other-window (windmove-find-other-window dir)))
    (when other-window
      (let* ((this-window  (selected-window))
             (this-buffer  (window-buffer this-window))
             (other-buffer (window-buffer other-window))
             (this-start   (window-start this-window))
             (other-start  (window-start other-window)))
        (set-window-buffer this-window  other-buffer)
        (set-window-buffer other-window this-buffer)
        (set-window-start  this-window  other-start)
        (set-window-start  other-window this-start)))))

;(global-set-key (kbd "C-M-J") (lambda () (interactive) (swap-with 'down)))
;(global-set-key (kbd "C-M-K") (lambda () (interactive) (swap-with 'up)))
;(global-set-key (kbd "C-M-H") (lambda () (interactive) (swap-with 'left)))
;(global-set-key (kbd "C-M-L") (lambda () (interactive) (swap-with 'right)))

;(global-set-key [ (control alt H) ] (lambda () (interactive) (swap-with 'left)))

(global-unset-key (kbd "C-p"))
(global-set-key (kbd "C-p l") (lambda () (interactive) (swap-with 'right)))
(global-set-key (kbd "C-p h") (lambda () (interactive) (swap-with 'left)))
(global-set-key (kbd "C-p k") (lambda () (interactive) (swap-with 'up)))
(global-set-key (kbd "C-p j") (lambda () (interactive) (swap-with 'down)))


(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window 1)))
(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-H") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window 1 t)))


;; (global-set-key (kbd "M-j") 'windmove-down)
;; (global-set-key (kbd "M-k") 'windmove-up)
;; (global-set-key (kbd "M-h") 'windmove-left)
;; (global-set-key (kbd "M-l") 'windmove-right)

; testing. default emacs C-left is same as M-left
(global-set-key [ (meta down) ]  'windmove-down)
(global-set-key [ (meta up) ]    'windmove-up)
(global-set-key [ (meta left) ]  'windmove-left)
(global-set-key [ (meta right) ] 'windmove-right)

(global-set-key [ (alt down) ]  'windmove-down)
(global-set-key [ (alt up) ]    'windmove-up)
(global-set-key [ (alt left) ]  'windmove-left)
(global-set-key [ (alt right) ] 'windmove-right)

(global-set-key (kbd "M-<down>")  'windmove-down)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)

(global-set-key (kbd "<A-down>")  'windmove-down)
(global-set-key (kbd "<A-up>")    'windmove-up)
(global-set-key (kbd "<A-right>") 'windmove-right)
(global-set-key (kbd "<A-left>")  'windmove-left)


(provide 'emacsd-tile)