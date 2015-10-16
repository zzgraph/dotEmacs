;;; companyInit.el --- Company auto-completion package configurations
;;; Commentary:
;;; Code:
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(push 'company-readline company-backends)
(push 'slime-company company-backends)
(add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))
(company-quickhelp-mode 1)
(require 'color)

;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-darken-name bg 10)))))
;;    `(company-preview ((t (:inherit default :background ,(color-darken-name bg 20)))))
;;    `(company-preview-common ((t (:inherit default :background ,(color-lighten-name bg 20)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 20)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
(provide 'companyInit)
;;; companyInit.el ends here
