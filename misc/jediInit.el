;;; Package --- jediInit.el
;;; Commentary:
;;; Code:
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(provide 'jediInit)
;;; jediInit.el ends here
