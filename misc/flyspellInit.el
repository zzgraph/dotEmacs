;;; flyspellInit --- costumizations for flyspell-mode
;;; Commentary:
;;; Code:
;; (require 'auto-dictionary)
(require 'flyspell)
(require 'ispell)
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

;; Changing local dictionaries
;; http://unix.stackexchange.com/questions/86554/make-hunspell-work-with-emacs-and-german-language?answertab=active#tab-top
(add-to-list 'ispell-local-dictionary-alist '("fa_IR"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "fa_IR"); Dictionary file name
                                              nil
                                              utf-8))

(add-to-list 'ispell-local-dictionary-alist '("en_US"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "en_US")
                                              nil
                                              utf-8))

(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
      ispell-dictionary   "en_US") ; Default dictionary to use

(provide 'flyspellInit)
;;; flyspellInit.el ends here
