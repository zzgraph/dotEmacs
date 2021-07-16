;;; ivyInit.el --- Configurations for ivy
;;; Commentary:
;;; Code:

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-wrap t)

(require 'ivy-rich)
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
(provide 'ivyInit)
;;; ivyInit.el ends here
