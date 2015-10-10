;;; Package --- helmInit.el
;;; Commentary:
;;; Code:
(require 'helm-config)

(helm-mode 1)
(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(provide 'helmInit)

;;; helmInit.el ends here
