;;; helmInit.el --- Configurations for helm
;;; Commentary:
;;; Code:

(require 'helm-config)
(require 'helm-descbinds)
(helm-descbinds-mode)
(helm-mode 1)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; workaround to open files with sudo in helm-find-files
;; (defadvice helm-find-files (after find-file-sudo activate)
;;   "Find file as root if necessary."
;;   (unless (and buffer-file-name
;;                (file-writable-p buffer-file-name))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(provide 'helmInit)

;;; helmInit.el ends here
