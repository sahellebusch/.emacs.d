
;;; runs eslint --fix on the current file after save
;;; alpha quality -- use at your own risk

;; (defun eslint-fix-file ()
;;   (interactive)
;;   (message (buffer-file-name))
;;   ;; (shell-command (concat (expand-file-name "~/node_module/eslint/bin/eslint.js") "--fix " (buffer-file-name))))
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (eslint (and root
;;                       (expand-file-name "node_modules/eslint/bin/eslint.js"
;;                                         root))))
;;     (config (and root (expand-file-name ".eslintrc")))
;;     (shell-command (concat eslint config " --fix ") (buffer-file-name))))

;; (defun eslint-fix-file-and-revert ()
;;   (interactive)
;;   (eslint-fix-file)
;;   (revert-buffer t t))

;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))

;;; runs eslint --fix on the current file after save
;;; alpha quality -- use at your own risk

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

(add-hook 'js2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))
