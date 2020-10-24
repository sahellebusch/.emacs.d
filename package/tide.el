(use-package web-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(use-package 
  tide
  :ensure t
  :init
  (setq tide-tsserver-executable "/Users/seanh/.nvm/versions/node/v12.13.0/bin/tsserver"))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)

  ;; company is an optional dependency. You have to

  ;; install it separately via package-install

  ;; \M-x package-install [ret] company``
  (company-mode +1))

                                        ; aligns annotation to the right hand side

(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after default javascript checker
(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
