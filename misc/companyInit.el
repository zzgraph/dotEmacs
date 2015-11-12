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

;; Source: https://gist.github.com/fletch/cefeb0ebe01552081d10
;; http://emacs.stackexchange.com/questions/10431/get-company-to-show-suggestions-for-yasnippet-names
;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  "Add yasnippet support for all company BACKENDs."
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

;; helm-company choose from company completions with C-:
(with-eval-after-load 'company
  (define-key company-mode-map (kbd "C-:") 'helm-company)
  (define-key company-active-map (kbd "C-:") 'helm-company))

(provide 'companyInit)
;;; companyInit.el ends here
