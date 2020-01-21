(use-package add-node-modules-path)
(setq add-node-modules-path-debug t)

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path))
