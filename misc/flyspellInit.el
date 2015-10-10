;;; flyspellInit --- costumizations for flyspell-mode
;;; Commentary:
;;; Code:
(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook
	  (lambda ()
	    (auto-dictionary-mode 1)))




(provide 'flyspellInit)
;;; flyspellInit.el ends here
