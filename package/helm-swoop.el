(use-package helm-swoop
 :bind
 (("C-S-s" . helm-swoop)
  ("M-i" . helm-swoop)
  ("M-s s" . helm-swoop)
  ("M-I" . helm-swoop-back-to-last-point)
  ("M-s M-i" . helm-multi-swoop)
  ("M-s M-a" . helm-multi-swoop-all)
  )
 :config
 (progn
   (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
   (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
   (setq helm-swoop-pre-input-function (lambda () nil)))
 )

