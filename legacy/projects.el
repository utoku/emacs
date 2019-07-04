(defun project-select ()
  (interactive)
  (let ((current-project (select-project-by-name (read-from-minibuffer "Project Name:"))))
	(set-path-and-shell-command (getf current-project :project-host) (getf current-project :project-directory))
	(setq *project-name* (getf current-project :project-name))))

(defun select-project-by-name (pname) 
  (car (remove-if-not
		#'(lambda (project) (equal (getf project :project-name) pname))
		*project-db*)))

(defun hostname-checks-as (hostname) 
  (or (not (getenv "HOSTNAME")) (equal (getenv "HOSTNAME") hostname)))

(defun set-path-and-shell-command (project-host project-directory)
  (if (hostname-checks-as project-host)
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

(defun project-status ()
  (interactive)
  (svn-status *project-path*))


(setf *project-db* 
	  (list
	   '(:project-name "om" :project-host "metawave" :project-directory "/home/utku/om")
	   '(:project-name "tekcek" :project-host "spitfire.dnsdojo.net" :project-directory "/home/utku/sanalpos/tekcekws")
	   '(:project-name "genpa" :project-host "jambo" :project-directory "/home/utku/projects/genpatech/trunk")))

