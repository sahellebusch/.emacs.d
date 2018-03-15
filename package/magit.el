;;;; Credit for endless/add-PR-fetch goes to Lily Carpenter
;;;; Web: https://azrazalea.net
;;;; Email: lily@azrazalea.net
;;; Magit
(use-package magit
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (add-hook 'magit-mode-hook #'endless/add-PR-fetch)
  (unless (windows?) (add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)))

(use-package autorevert
  :delight auto-revert-mode)

(setq magit-last-seen-setup-instructions "1.4.0")
(defun endless/add-PR-fetch ()
  "If refs/pull is not defined on a GH repo, define it."
  (let ((fetch-address
         "+refs/pull/*/head:refs/pull/origin/*"))
    (unless (member
             fetch-address
             (magit-get-all "remote" "origin" "fetch"))
      (let ((remote (magit-get "remote" "origin" "url")))
        (when (and remote (string-match
                           "github" remote))
          (magit-git-string
           "config" "--add" "remote.origin.fetch"
           fetch-address))))))

(use-package git-link)
