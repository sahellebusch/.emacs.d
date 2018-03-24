;; Note: to get this to work, you'll  have to run "npm i -g tern"
(use-package tern
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'js2-mode-hook 'tern-mode)))

(use-package company-tern
  :ensure t
  :defer t
  :init
  (progn
    (require 'company)
    (add-to-list 'company-backends 'company-tern)))

(use-package tern-auto-complete
  :ensure t
  :defer t
  :init
  )
