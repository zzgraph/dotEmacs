;;; neoTreeInit.el --- Configurations for neotree
;;; Commentary:
;; Use all the icons for neotree

;;; Code:
(require 'neotree)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(provide 'neoTreeInit)

;;; neoTreeInit.el ends here
