;;; neoTreeInit.el --- Configurations for neotree
;;; Commentary:
;; Use all the icons for neotree

;;; Code:
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(provide 'neoTreeInit)

;;; neoTreeInit.el ends here
