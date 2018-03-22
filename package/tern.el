(use-package tern
  :config
  (bind-key "C-c C-c" 'compile tern-mode-keymap)
  (when (eq system-type 'windows-nt) (setq tern-command '("cmd" "/c" "tern")))
  (add-hook 'js2-mode-hook 'tern-mode))

(use-package company-tern
  :init (add-to-list 'company-backends 'company-tern))

eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
