;;; Package --- eshellInit.el
;;; Commentary:
;;; Code:
(require 'esh-help)
(require 'pcomplete-extension)
(setq eshell-history-size 1024)
(setup-esh-help-eldoc)

(with-eval-after-load "esh-opt"
  (require 'virtualenvwrapper)
  (venv-initialize-eshell)
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

;; Helm completion for eshell
;; https://github.com/emacs-helm/helm/wiki#helm-eshell-completion
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (eshell-cmpl-initialize)
              (define-key eshell-mode-map
		[remap pcomplete] 'helm-esh-pcomplete)))
(provide 'eshellInit)
;;; eshellInit.el ends here
