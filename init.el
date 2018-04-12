;; always download packages that aren't installed already
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (less-css-mode neotree web-mode company-tern tern yasnippet spacemacs-theme smartparens delight persistent-scratch nlinum markdown-mode git-link magit json-mode js2-mode helm-lobsters helm-ag helm-company helm-projectile helm-swoop flycheck-pos-tip exec-path-from-shell elisp-format editorconfig all-the-icons ag add-node-modules-path ace-jump-mode use-package)))
 '(use-package-always-ensure t))

;; load up all packages in the packages directory
(require 'package) ;; You might already have this line
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))

(package-initialize)
(package-refresh-contents)

(load "~/.emacs.d/package/utilities.el")

(when (not (package-installed-p 'use-package))
    (progn
      (package-install 'use-package)))
(require 'use-package)

(add-hook 'after-init-hook
          (lambda ()
             (mapc (lambda (package-file) (load package-file))
                    (directory-files (concat user-emacs-directory "package/") t "^[^\.].*\.el$"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
