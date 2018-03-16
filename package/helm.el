(use-package helm
  :delight
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-c o" . helm-projectile-switch-project)
         ("C-c i" . helm-projectile-ag)
         ("C-," . helm-mini))
  :config (helm-mode 1))

(use-package helm-projectile)
(use-package helm-company)
(use-package helm-ag)

;; These are more for fun

;; front end for lobste.rs
(use-package helm-lobsters)

