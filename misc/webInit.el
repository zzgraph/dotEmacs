;;; webInit.el --- Configurations for web-mode
;;; Commentary:
;; autoload with modes

;;; Code:

(require 'web-mode)

;; PHP template files
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))

;; ASP JSP and others
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))

;; ERB (Embeded Ruby) template files
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; mustache template files
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))

;; handlebars template files
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

;; django template files
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))


(add-hook 'web-mode-hook (lambda ()
			   (set (make-local-variable 'company-backends) '(company-web-html))
			   (company-mode t)))

(define-key web-mode-map (kbd "C-'") 'company-web-html)
(setq web-mode-engines-alist  '(
				("php"    . "\\.phtml\\'")
				("blade"  . "\\.blade\\.")
				("ctemplate" . "\\.handlebars\\'")))
(require 'sws-mode)
(require 'jade-mode)
(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . stylus-mode))

(add-hook 'css-mode-hook 'rainbow-mode)


(provide 'webInit)

;;; webInit.el ends here
