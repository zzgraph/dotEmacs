;;; ivyInit.el --- Configurations for ivy
;;; Commentary:
;;; Code:

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-wrap t)

(require 'ivy-rich)
(ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)

(provide 'ivyInit)
;;; ivyInit.el ends here
