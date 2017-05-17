;;; Package --- Summary
;;; Commentary:
;;; Code:
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Add rust support

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(provide 'flycheckInit)
;;; flycheckInit ends here
