;;; diredInit.el --- Configuration for dired mode
;;; Commentary:
;; 

;;; Code:
(setq dired-listing-switches "-al1Ghv --group-directories-first --color")
(setq directory-free-space-args "-hTmP")
(setq dired-dwim-target t)

;; dired - reuse current buffer by pressing 'a'
(put 'dired-find-alternate-file 'disabled nil)



(provide 'diredInit)
;;; diredInit.el ends here
