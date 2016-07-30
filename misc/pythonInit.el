;;; Package --- pythonInit.el
;;; Commentary:
;;; Code:
(require 'python-django)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(defun zzgraph/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'zzgraph/python-mode-hook)
(when (executable-find "ipython3")
      (setq
       python-shell-interpreter "ipython3"
       python-shell-interpreter-args "--simple-prompt"
       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
       python-shell-completion-setup-code
       "from IPython.core.completerlib import module_completion"
       python-shell-completion-string-code
       "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))
(provide 'pythonInit)
;;; pythonInit.el ends here
