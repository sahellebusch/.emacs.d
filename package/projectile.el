;; Projectile
(use-package delight)
(use-package projectile
  :delight '(:eval (concat " [" (projectile-project-name) "]"))
  :bind (("C-w" . helm-projectile-find-file)))
 (projectile-mode)

(setq projectile-indexing-method 'native
      projectile-globally-ignored-directories
      (quote
       (".idea" ".ensime_cache" ".eunit" ".git" "node_modules" "elpa-25.3" "auto-save-list" "backups" "coverage"))
     )

