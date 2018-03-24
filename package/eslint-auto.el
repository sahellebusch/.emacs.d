;; Runs eslint on file save with local eslint configurations.
(defun eslint-fix-file ()
  (message "Fixing wih eslint")
  (shell-command
   (concat
    (projectile-project-root)
    "node_modules/eslint/bin/eslint.js --fix "
    (buffer-file-name))))

(defun eslint-fix-and-revert-buffer ()
  (eslint-fix-file)
  (revert-buffer t t))

(add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'eslint-fix-and-revert-buffer)))
