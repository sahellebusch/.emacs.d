;; Yasnippet
(use-package yasnippet
  :init (yas-global-mode 1))

;; Autocomplete Popups
(use-package company
  :config
  (global-company-mode 1)
  (add-to-list 'company-backends 'company-css)
  (add-to-list 'company-backends 'company-yasnippet)
  (setq
   company-echo-delay 0
   company-idle-delay 0.2
   company-minimum-prefix-length 1
   company-tooltip-align-annotations t
   company-tooltip-limit 10
   company-tooltip-flip-when-above t
   company-dabbrev-downcase nil
   company-require-match nil
   company-begin-commands '(self-insert-command)))

;; ;; Company-web
;; (use-package company-web
;;   :init (add-to-list 'company-backends 'company-web-html))

;; tern (js)
(use-package tern
  :bind (
	 ("<f12>" . tern-find-definition)
	 ("<f6>" . tern-rename-variable)
	 )
  :config
  (add-hook 'js2-mode-hook 'tern-mode)
  (add-hook 'web-mode-hook 'tern-mode)
  (setq tern-command (append tern-command '("--no-port-file"))))

;; Company integration for tern (js)
(use-package company-tern
  :init (add-to-list 'company-backends 'company-tern)
  :config (setq company-tern-property-marker nil))

(add-hook 'js-mode-hook '
	  (lambda ()
	    (setq-local company-backends '((company-tern :with company-yasnippet)))))

(add-hook 'after-init-hook 'global-company-mode)
