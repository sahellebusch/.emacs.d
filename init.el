;; always download packages that aren't installed already
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "60948671aeed6450faa8f28978a09586f142af6eb0b59e70848fcc32b9d36fd1" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(js-indent-level 2)
 '(json-reformat:indent-width 2)
 '(package-selected-packages
   (quote
    (dockerfile-mode doom-modeline dracula-theme buffer-move tide powerline nimbus-theme doom-themes plantuml-mode simpleclip rjsx-mode key-chord smart-mode-line-powerline-theme smart-mode-line multi-scratch neotree less-css-mode docker-compose-modenn docker-compose-mode web-mode company-tern tern yasnippet spacemacs-theme smartparens delight persistent-scratch nlinum markdown-mode git-link magit json-mode js2-mode helm-lobsters helm-ag helm-company helm-projectile helm-swoop flycheck-pos-tip exec-path-from-shell elisp-format editorconfig all-the-icons ag add-node-modules-path ace-jump-mode use-package)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(send-mail-function (quote mailclient-send-it))
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

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(highlight ((t (:background "#B4B4FF" :foreground "#7B2FB8")))))

;; Load theme of choice
(load-theme 'doom-one)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun my-proj-relative-buf-name ()
  (ignore-errors
    (rename-buffer
     (file-relative-name buffer-file-name (projectile-project-root)))))

(add-hook 'find-file-hook #'my-proj-relative-buf-name)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


  (setenv "PATH" (concat (getenv "PATH") ":/Users/seanh/.nvm/versions/node/v12.10.0/bin"))
(setq exec-path (append exec-path '("/Users/seanh/.nvm/versions/node/v12.10.0/bin")))
