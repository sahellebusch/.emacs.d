(use-package doom-themes)

(add-hook 'after-init-hook (lambda ()
                             (load-theme 'doom-one t)
                             (doom-modeline-mode)))

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; On first time install: M-x all-the-icons-install-fonts
(use-package doom-modeline)
