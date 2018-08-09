;; ;; Runs eslint on file save with local eslint configurations.
;; (defun eslint-fix-file ()
;;   (message "Fixing wih eslint")
;;   (shell-command
;;    (concat
;;     (projectile-project-root)
;;     "node_modules/.bin/eslint"
;;     (buffer-file-name))))

;; (defun eslint-fix-and-revert-buffer ()
;;   (eslint-fix-file)
;;   (revert-buffer t t))

;; (defun run-elsint ()
;;   (interactive)
;;   (eslint-fix-and-revert-buffer))

;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'eslint-fix-and-revert-buffer)))

;; ;; (add-hook 'rjsx-mode
;; ;;           (lambda ()
;; ;;             (add-hook 'after-save-hook #'eslint-fix-and-revert-buffer)))


(remove-hook 'after-save-hook #'eslint-fix-and-revert-buffer)
