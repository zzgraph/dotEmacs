;;; Package --- Summary
;;; Commentary:
;;; Code:
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Add rust support
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; Check YAML files for Error

(require 'flycheck-yamllint)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))



(provide 'flycheckInit)
;;; flycheckInit ends here
