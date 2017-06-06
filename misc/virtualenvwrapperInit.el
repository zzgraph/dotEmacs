;;; virtualenvwrapperInit.el --- virtualenvwrapperinit configurations
;;; Commentary:
;; Configurations to use with virtualenvwrapper

;;; Code:

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;(setq projectile-switch-project-action 'venv-projectile-auto-workon)



(provide 'virtualenvwrapperInit)
;;; virtualenwrapperInit.el ends here
