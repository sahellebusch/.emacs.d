(setq exec-path (append exec-path '("/Users/seanh/.nvm/versions/node/v12.13.0/bin/npm")))
(setq exec-path (append exec-path '("/Users/seanh/.nvm/versions/node/v12.13.0/bin/")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/Users/seanh/go/bin")))
(setq exec-path (append exec-path '("/Users/seanh/go/bin/gopls")))
(setq exec-path (append exec-path '("/usr/local/go/bin/go")))
(setq exec-path (append exec-path '("/usr/local/bin/go")))
 ;; (message (getenv "PATH"))

;; (use-package 
;;   lsp-mode
;;   :hook ((
;;           ruby-mode js2-mode go-mode   ; ts-ls (tsserver wrapper)
;;                   ;; typescript-mode       ; ts-ls (tsserver wrapper)
;;                   ) . lsp-deferred) 
;;   :commands (lsp lsp-deferred))

;; ;; optionally
;; (use-package 
;;   lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)
;; (use-package 
;;   company-lsp 
;;   :commands company-lsp)
;; (use-package 
;;   helm-lsp 
;;   :commands helm-lsp-workspace-symbol)
;; (use-package 
;;   lsp-treemacs 
;;   :commands lsp-treemacs-errors-list)
;; ;; optionally if you want to use debugger
;; ;; (use-package dap-mode)


(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode  lsp-deferred))

;;Set up before-save hooks to format buffer and add/delete imports.
;;Make sure you don't have other gofmt/goimports hooks enabled.

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;;Optional - provides fancier overlays.

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
)

;;Company mode is a standard completion package that works well with lsp-mode.
;;company-lsp integrates company mode completion with lsp-mode.
;;completion-at-point also works out of the box but doesn't support snippets.

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

;;Optional - provides snippet support.

(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

;;lsp-ui-doc-enable is false because I don't like the popover that shows up on the right
;;I'll change it if I want it back


(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)
