;;; googleTranslateInit.el --- Configuration to use google translate package
;;; Commentary:
;; 

;;; Code:

(require 'google-translate)
(require 'google-translate-smooth-ui)


(setq google-translate-translation-directions-alist
      '(("en" . "fa") ("fa" . "en") ("fr" . "en") ("en". "fr") ("fr" . "fa") ("fa" . "fr")))


(provide 'googleTranslateInit)
;;; googleTranslateInit.el ends here
