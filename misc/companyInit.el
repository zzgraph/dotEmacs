;;; companyInit.el --- Company auto-completion package configurations
;;; Commentary:
;;; Code:
(require 'company)
(require 'slime-company)
(require 'company-web-html)                          ; load company mode html backend
;; and/or
(require 'company-web-jade)                          ; load company mode jade backend
(require 'company-web-slim)                          ; load company mode slim backend

;; you may key bind, for example for web-mode:


(add-hook 'after-init-hook 'global-company-mode)

;; (push 'slime-company company-backends)

;; Adding shell scripting completion and doc string support to company
(add-to-list 'company-backends 'company-shell)

;; Adding tern to company backends for javascript files
(add-to-list 'company-backends 'company-tern)

(push 'company-readline company-backends)
(add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))

(add-to-list 'company-backends 'company-restclient)


(company-quickhelp-mode 1)

(eval-after-load 'company
  '(define-key company-active-map (kbd "M-s-h") #'company-quickhelp-manual-begin))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key




;; Source: https://gist.github.com/fletch/cefeb0ebe01552081d10
;; http://emacs.stackexchange.com/questions/10431/get-company-to-show-suggestions-for-yasnippet-names
;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; (defvar company-mode/enable-yas t
;;   "Enable yasnippet for all backends.")

;; (defun company-mode/backend-with-yas (backend)
;;   "Add yasnippet support for all company BACKENDs."
;;   (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))

;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))


;; helm-company choose from company completions with C-:
;; (with-eval-after-load 'company
;; (define-key company-mode-map (kbd "C-:") 'helm-company)
;; (define-key company-active-map (kbd "C-:") 'helm-company))
;; (require 'color)
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
