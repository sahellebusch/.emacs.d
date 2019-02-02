
;; ;; Runs eslint on file save with local eslint configurations.
(defun tslint-fix-file ()
  (message "Fixing wih tslint")
  (shell-command
   (concat
    (projectile-project-root)
    "node_modules/.bin/tslint --fix -c "
    (concat (projectile-project-root) "tslint.json ")
    (buffer-file-name)
    " >/dev/null 2>&1"))) ;; because tslint doesn't have a quiet option

(defun tslint-fix-file-verbose ()
  (message "Fixing wih tslint")
  (shell-command
   (concat
    (projectile-project-root)
    "node_modules/.bin/tslint --fix -c "
    (concat (projectile-project-root) "tslint.json ")
    (buffer-file-name))))

(defun tslint-fix-and-revert-buffer ()
  (tslint-fix-file)
  (revert-buffer t t))

(defun tslint-fix-and-revert-buffer-verbose ()
  (tslint-fix-file-verbose)
  (revert-buffer t t))


(defun run-tslint ()
  (interactive)
  (save-buffer)
  (tslint-fix-and-revert-buffer))

(defun run-tslint-verbose ()
  (interactive)
  (save-buffer)
  (tslint-fix-and-revert-buffer-verbose))

(global-set-key (kbd "C-c t") 'run-tslint)


