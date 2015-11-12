;;; Package --- orgmodeInit.el
;;; Commentary:
;;; Code:
(require 'org)
(setq org-agenda-files (quote ("~/Dropbox/Orgmode")))
(setq org-directory "~/Dropbox/Orgmode")
(setq org-log-done t)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-reveal-root "file:///home/shibi/Downloads/source/reveal.js")

(provide 'orgmodeInit)
;;; orgmodeInit.el ends here
