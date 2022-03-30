;;; Package --- orgmodeInit.el
;;; Commentary:
;;; Code:
(require 'org)
(setq org-agenda-files (quote ("~/OneDrive/org")))
(setq org-directory "~/OneDrive/org")
(setq org-log-done t)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(with-eval-after-load 'ox
  (require 'ox-hugo))


(provide 'orgmodeInit)
;;; orgmodeInit.el ends here
