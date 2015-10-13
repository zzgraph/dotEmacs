;;; Package --- jediInit.el
;;; Commentary:
;;; Code:
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(defun zzgraph/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'zzgraph/python-mode-hook)
(provide 'jediInit)
;;; jediInit.el ends here
