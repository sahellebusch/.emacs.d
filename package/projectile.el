;; Projectile
(use-package delight)
(use-package projectile
  :delight '(:eval (concat " [" (projectile-project-name) "]"))
  :bind (("C-w" . helm-projectile-find-file)))
(projectile-mode)

;; need to set up helm-projectile-ag to search through the project root
