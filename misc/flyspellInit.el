;;; flyspellInit --- costumizations for flyspell-mode
;;; Commentary:
;;; Code:
(require 'auto-dictionary)
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (modes '(emacs-lisp-mode-hook
		 clojure-mode-hook
		 python-mode-hook
		 js-mode-hook
	         shell-mode-hook))
  (add-hook modes
	    (lambda ()
	      (flyspell-prog-mode))))

(provide 'flyspellInit)
;;; flyspellInit.el ends here
