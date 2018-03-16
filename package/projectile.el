;; Projectile
(use-package delight)
(use-package projectile
  :delight '(:eval (concat " [" (projectile-project-name) "]"))
  :bind (("C-w" . helm-projectile-find-file)))
(projectile-mode)

;;; Projectile with Rails
(use-package projectile-rails)
