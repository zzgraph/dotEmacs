;;; elfeedInit.el --- Configuration fo anzu
;;; Commentary:
;; Customization for elfeed and pointing to elfeed-org file

;;; Code:

(require 'elfeed-org)
(require 'elfeed-goodies)
(elfeed-org)
(elfeed-goodies/setup)
(setq rmh-elfeed-org-files (list "~/OneDrive/elfeed/rss.org"))
(setq elfeed-db-directory "~/OneDrive/elfeed")
;; save database when ever I hit q
;; from: http://pragmaticemacs.com/emacs/read-your-rss-feeds-in-emacs-with-elfeed/

(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))

;; browse article in gui browser instead of eww
;; from: http://pragmaticemacs.com/emacs/to-eww-or-not-to-eww/
(defun bjm/elfeed-show-visit-gui ()
  "Wrapper for elfeed-show-visit to use gui browser instead of eww"
  (interactive)
  (let ((browse-url-generic-program "/usr/bin/open"))
    (elfeed-show-visit t)))


(provide 'elfeedInit)

;;; elfeedInit.el ends here
