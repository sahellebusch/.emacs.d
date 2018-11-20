;; ;; Runs eslint on file save with local eslint configurations.
(defun eslint-fix-file ()
  (message "Fixing wih eslint")
  (shell-command
   (concat
    (projectile-project-root)
    "node_modules/.bin/eslint --quiet --fix "
    (buffer-file-name))))

(defun eslint-fix-and-revert-buffer ()
  (eslint-fix-file)
  (revert-buffer t t))

(defun run-eslint ()
  (interactive)
  (save-buffer)
  (eslint-fix-and-revert-buffer))

(global-set-key (kbd "C-c e") 'run-eslint)
