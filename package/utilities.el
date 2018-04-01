;;;; set RET to return and indent correctly
(define-key global-map (kbd "RET") 'newline-and-indent)

(defadvice load-theme (before theme-dont-propagate activate)
  "Advises 'load-theme' that it should disable all other custom enabled themes first."
 (mapc #'disable-theme custom-enabled-themes))

(defun darwin? ()
  "Figure out if the system type is osx."
  (eq system-type 'darwin))

(defun windows? ()
  "Figure out if the system type is Windows."
  (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

;; set "Yes" or "No" interactive answers to "y" or "n"
(fset 'yes-or-no-p 'y-or-n-p)

;; more real estate!
(tool-bar-mode -1)

;; Set autosave location
;; http://pages.sachachua.com/.emacs.d/Sacha.html#org7b1ada1
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; always highlight matching parens
(show-paren-mode 1)

;; comment code
(global-define-key (kbd "C-x C-\\") comment-region)
