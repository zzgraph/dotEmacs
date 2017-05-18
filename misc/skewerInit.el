;;; skewerInit.el --- configuration for skewer-mode
;;; Commentary:
;; loade skewer mode beside html and js2 modes

;;; Code:

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(provide 'skewerInit)

;;; skewerInit.el ends here
