;;; Package --- Summary
;;; Commentary:
;;; Code:

(add-hook 'rust-mood-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map  (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(provide 'rustInit)

;;; rustInit ends here
