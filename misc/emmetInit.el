;;; emmetInit.el --- Configurations for emmet-mode
;;; Commentary:
;; key bindings and autoloads for emmet mode

;;; Code:

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.


;;; emmetInit.el ends here
