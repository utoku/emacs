;;;;; projects and svn? and git ================================================

;;; Author :  Utku Somer

;;; These are my project selection functions and running diffs inside
;;; those project directories.

;;TODO: add hooks to specific projects

;;;;; usage example=============================================================


;;global-set-key (kbd "<f9>") 'project-select)
;;svn way
;;(global-set-key (kbd "<f11>") 'project-status)
;;(global-set-key (kbd "<f12>") 'project-diff)
;;git way
;;(global-set-key (kbd "<f11>") 'pr-branch-diff)
;;(global-set-key (kbd "<f12>") 'pr-diff)


;;;;; functions ================================================================


(defun project-select ()
  (interactive)
  (let ((current-project (select-project-by-name (read-from-minibuffer "Project Name: "))))
	(set-path-and-shell-command (getf current-project :project-host) (getf current-project :project-directory))
	(setq *project-name* (getf current-project :project-name))
	(cd *project-path*)))

(defun select-project-by-name (pname) 
  (car (remove-if-not
		#'(lambda (project) (equal (getf project :project-name) pname))
		*project-db*)))

(defun hostname-checks-as (hostname) 
  (equal (getenv "HOSTNAME") hostname))

(defun set-path-and-shell-command (project-host project-directory)
  (if (or (hostname-checks-as project-host)
	  (not (getenv "HOSTNAME")))
      (progn 
	(setq *my-shell-command* #'shell-command)
	(setq *project-path* project-directory))
    (progn
      (setq *my-shell-command* #'tramp-handle-shell-command)
      (setq *project-path* (concat "/ssh:" project-host ":" project-directory)))))

(defun project-diff ()
  (interactive)
  (progn
    (message "Running SVN diff...")
    (cd *project-path*)
    (let ((buffername (concat *project-name* "-svn-diff")))
      (switch-to-buffer buffername)	
      (funcall *my-shell-command* "svn diff --diff-cmd diff -x -uwBEb" buffername) 
      (diff-mode)
      (message "SVN diff done!"))))

(defun pr-diff ()
  (interactive)
  (progn
    (message "Running git diff...")
    (cd *project-path*)
    (let ((buffername (concat *project-name* "-git-diff")))
      (switch-to-buffer buffername)	
	  (funcall *my-shell-command* "git diff master" buffername) 
	  (diff-mode)
	  (message "git diff done!"))))

;; copy/pasted from pr-diff, fix later
(defun pr-branch-diff ()
  (interactive)
  (progn
    (message "Running git diff...")
    (cd *project-path*)
    (let ((buffername (concat *project-name* "-git-diff")))
      (switch-to-buffer buffername)	
	  (funcall *my-shell-command* "git diff" buffername) 
	  (diff-mode)
	  (message "git diff done!"))))


;too bad this one cannot be remotely called.
;psvn uses processes.
(defun project-status ()
  (interactive)
  (svn-status *project-path*))


;;;;; Project Database ========================================================

;; my project database
(setf *project-db* 
      (list
       '(:project-name "nas" 
		       :project-host "jules" 
		       :project-directory "/home/utku/noapi/noapi-src")
       '(:project-name "napp" 
		       :project-host "jules" 
		       :project-directory "/home/utku/noapi/noapi-apps")
       '(:project-name "4" 
		       :project-host "jules" 
		       :project-directory "/home/utku/mud/lands/src")
       '(:project-name "arm" 
		       :project-host "jules" 
		       :project-directory "/home/utku/mud/other-codebases/armageddon/src")
       '(:project-name "hb"
       		       :project-host "jules"
		       :project-directory "/home/utku/mud/handbook/")
       '(:project-name "cv"
       		       :project-host "jules"
		       :project-directory "/home/utku/personal/cv7/")
       '(:project-name "sh"
       		       :project-host "jules"
		       :project-directory "/home/utku/parkyeri/smarthouse/")
       '(:project-name "xp"
       		       :project-host "jules"
		       :project-directory "/home/utku/projects/xperiment/")
       '(:project-name "l"    
               :project-host "rand" 
               :project-directory "/home/utku/research/BlizzardList")
       '(:project-name "g" 
               :project-host "rand" 
               :project-directory "/home/utku/elegant/global-outlook")
       '(:project-name "q" 
		       :project-host "beazley" 
		       :project-directory "/home/utku/qooxdoo-1.2-sdk/qappa/source/class/qappa")
       '(:project-name "s" 
		       :project-host "beazley" 
		       :project-directory "/home/utku/projects/sf")
       '(:project-name "ui" 
		       :project-host "beazley" 
		       :project-directory "/home/utku/projects/sf/cometd-twisted/applications/client/source/class/sf")
       '(:project-name "om" ;ortakmesaj
		       :project-host "rand" 
		       :project-directory "/home/utku/projects/om")
       '(:project-name "omi" ;ortakmesaj on icenet via sshfs
		       :project-host "rand" 
		       :project-directory "/home/utku/ice/projects/om")
       '(:project-name "mp" haberdaret2, git version
		      :project-host "metromedia" 
		      :project-directory "/home/utku/projects/morparti"
		      :repo "git")
       ))
