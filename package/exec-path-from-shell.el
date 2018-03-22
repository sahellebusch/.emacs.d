;;; exec path from shell
(use-package exec-path-from-shell)

(when (darwin?)
  (exec-path-from-shell-initialize))
