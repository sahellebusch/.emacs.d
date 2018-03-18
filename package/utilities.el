;; set RET to return and indent correctly
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
