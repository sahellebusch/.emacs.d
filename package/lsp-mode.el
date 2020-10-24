(setq exec-path (append exec-path '("/Users/seanh/.nvm/versions/node/v12.13.0/bin/npm")))
(setq exec-path (append exec-path '("/Users/seanh/.nvm/versions/node/v12.13.0/bin/")))
(setq exec-path (append exec-path '("/usr/local/bin")))
 ;; (message (getenv "PATH"))

(use-package 
  lsp-mode
  :hook ((
          ruby-mode js2-mode     ; ts-ls (tsserver wrapper)
                  ;; typescript-mode       ; ts-ls (tsserver wrapper)
                  ) . lsp) 
  :commands lsp)

;; optionally
(use-package 
  lsp-ui 
  :commands lsp-ui-mode)
(use-package 
  company-lsp 
  :commands company-lsp)
(use-package 
  helm-lsp 
  :commands helm-lsp-workspace-symbol)
(use-package 
  lsp-treemacs 
  :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
;; (use-package dap-mode)
