;;; webInit.el --- Configurations for web-mode
;;; Commentary:
;; autoload with modes

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(define-key web-mode-map (kbd "C-'") 'company-web-html)
(setq web-mode-engines-alist  '(
				("php"    . "\\.phtml\\'")
				("blade"  . "\\.blade\\.")))
(require 'sws-mode)
(require 'jade-mode)
(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . stylus-mode))

(add-hook 'css-mode-hook 'rainbow-mode)


(provide 'webInit)

;;; webInit.el ends here
