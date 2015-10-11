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

;; Changing local doctionaries
;; http://unix.stackexchange.com/questions/86554/make-hunspell-work-with-emacs-and-german-language?answertab=active#tab-top
(add-to-list 'ispell-local-dictionary-alist '("prsian-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "de_DE"); Dictionary file name
                                              nil
                                              iso-8859-1))

(add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "en_US")
                                              nil
                                              iso-8859-1))

(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
      ispell-dictionary   "english-hunspell") ; Default dictionary to use

(provide 'flyspellInit)
;;; flyspellInit.el ends here
