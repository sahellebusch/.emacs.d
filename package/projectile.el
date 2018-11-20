(use-package delight)
(use-package projectile
  :diminish projectile-mode
  :delight '(:eval (concat " [" (projectile-project-name) "]"))
  :bind (
         ("C-w" . helm-projectile-find-file)
         ("C-c p i" . projectile-invalidate-cache)
         )
  :config
  (progn
    (setq projectile-completion-system 'default)
    (setq projectile-enable-caching t)
    (setq projectile-indexing-method 'alien)
    (add-to-list 'projectile-globally-ignored-files "node_modules"))
  :config
  (projectile-global-mode))
(use-package helm-projectile)
