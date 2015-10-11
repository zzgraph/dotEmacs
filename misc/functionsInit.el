;;; Package --- functionsInit.el
;;; Commentary:
;;; Code:

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph (REGION) and make it into a single line of text!"
      (interactive (progn (barf-if-buffer-read-only) '(t)))
      (let ((fill-column (point-max)))
        (fill-paragraph nil region)))

;; Source:
;; http://unix.stackexchange.com/questions/86554/make-hunspell-work-with-emacs-and-german-language?answertab=active#tab-top
(defun switch-dictionary-fa-en ()
  "Switch persian and english dictionaries!"
  (interactive)
  (let* ((dict ispell-current-dictionary)
         (new (if (string= dict "english-hunspell") "persian-hunspell"
                   "english-hunspell")))
    (ispell-change-dictionary new)
    (message "Switched dictionary from %s to %s" dict new)))


(provide 'functionsInit)
;;; functionsInit.el ends here
