;;; emmetInit.el --- Configurations for emmet-mode
;;; Commentary:
;; key bindings and autoloads for emmet mode

;;; Code:

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook  'emmet-mode)
(provide 'emmetInit)
;;; emmetInit.el ends here
