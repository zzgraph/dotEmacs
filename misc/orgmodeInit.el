;;; Package --- orgmodeInit.el
;;; Commentary:
;;; Code:
(require 'org)
(setq org-agenda-files (quote ("~/Dropbox/Orgmode")))
(setq org-directory "~/Dropbox/Orgmode")
(setq org-log-done t)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(provide 'orgmodeInit)
;;; orgmodeInit.el ends here
