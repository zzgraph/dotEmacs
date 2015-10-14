;;; slimeInit.el --- Configuration for Slime package
;;; Commentary:
;;; Code:
(require 'slime)
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contrib '(slime-fancy))
(slime-setup '(slime-company))

(provide 'slimeInit)
;;; slimeInit.el ends here
