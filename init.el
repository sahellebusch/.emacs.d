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

(when (not (package-installed-p 'use-package))
    (progn
      (package-install 'use-package)))
(require 'use-package)

(mapc (lambda (package-file) (load package-file))
      (directory-files (concat user-emacs-directory "package/") t "^[^\.].*\.el$"))
