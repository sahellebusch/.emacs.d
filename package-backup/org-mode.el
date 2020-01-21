(global-set-key (kbd "C-c C-c o m m") 
                (lambda () (interactive) (find-file "~/dev/org/organizer.org")))

;; open up work note
(global-set-key (kbd "C-c C-c o m w") 
                (lambda () (interactive) (find-file "~/dev/org/work.org")))

(setq org-default-notes-file "~/dev/org/organizer.org")

;; (global-set-key (kbd "C-c o m c") 'org-capture)

(setq org-startup-folded nil)

