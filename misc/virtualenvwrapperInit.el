(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/home/shibi/Downloads/source/examples/django_tutorial/")

(provide 'virtualenvwrapperInit)
