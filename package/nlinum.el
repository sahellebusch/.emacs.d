(use-package nlinum)
;; (add-hook 'emacs-startup-hook 'global-nlinum-mode)
;; Set/unset linum
(if (daemonp)
    ;; Need to delay linum activation till the frame and fonts are loaded, only
    ;; for emacsclient launches. For non-daemon, regular emacs launches, the
    ;; frame is loaded *before* the emacs config is read. Not doing so results
    ;; in the below error in emacs 24.5:
    ;;   *ERROR*: Invalid face: linum
    (add-hook 'after-make-frame-functions #'global-nlinum-mode)
  ;; Even when running in non-daemon mode, run `modi/toggle-linum' only after the
  ;; init has loaded, so that the last modified value of `modi/linum-fn-default'
  ;; if any in setup-personal.el is the one effective, not its standard value
  ;; in its defvar form above.
  (add-hook 'after-init-hook #'global-nlinum-mode))
