;;; Package --- functionsInit.el
;;; Commentary:
;;; Code:

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph (REGION) and make it into a single line of text!"
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))

;; Source:
;; http://unix.stackexchange.com/questions/86554/\
;; make-hunspell-work-with-emacs-and-german-language?answertab=active
(defun switch-dictionary-fa-en ()
  "Switch persian and english dictionaries!"
  (interactive)
  (let* ((dict ispell-current-dictionary)
         (new (if (string= dict "en_US") "fa_IR"
		"en_US")))
    (ispell-change-dictionary new)
    (message "Switched dictionary from %s to %s" dict new)))


;; Function to remove background color if the Emacs frame opens in
;; terminal emulator, most of times to preserve transparency

(defun zzgraph/load-bg-only-in-graphical-mode (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))

;; (defun zzgraph/load-theme (theme &optional frame)
;;   "THEME is being loaded when a FRAME is been created.

;; If we start a daemon don't load any costume theme, this function
;; makes the theme available when first FRAME is being created, it
;; does not load a theme again if there was an active theme loaded"
;;   (defun zzgraph/no-daemon-theme (theme frame)
;;     (load-theme theme t)
;;     (unless (display-graphic-p frame)
;;       (set-face-background 'default "unspecified-bg" frame)))
;;   (defun zzgraph/daemon-gui-theme (theme frame)
;;     (add-hook 'after-make-frame-functions (lambda () (load-theme 'gruvbox t))))
;;   (if (daemonp)
;;       (zzgraph/daemon-gui-theme theme frame)
;;     (zzgraph/no-daemon-theme theme frame))
;; )


;; Functions to put quotation marks and braces and parentheses around
;; selected text
;; TODO: these functions are currently dumb,
;; they only put stuff around selected text, make it smart if region
;; is marked then do the default if not do that for the word at point
;; and take numeral arguments to count words forward

(defun zzgraph/put-surrounding-around-text (opening-character)
  "This function takes a string from echo area and puts it around selected text.
   
   If the OPENING-CHARACTER is a brace, parenthesis, lesser or
   greater sign or a curly brace functions put the matching
   character at the end of selected text"
  (interactive "MPlease input surrounding character: ")
  (defvar closing-character)
  (cond
   ((equal opening-character "\"")
    (setq closing-character "\""))
   ((equal opening-character "\'")
    (setq closing-character "\'"))
   ((equal opening-character "\(")
    (setq closing-character "\)"))
   ((equal opening-character "\[")
    (setq closing-character "\]"))
   ((equal opening-character "\{")
    (setq closing-character "\}"))
   ((equal opening-character "<")
    (setq closing-character ">"))
   (t
    (setq closing-character opening-character))
   )
  (let ((start-of-surrounded-text (make-marker)))
    ((end-of-surrounded-text (make-marker))))
  
  (if '(mark-active)
      (progn
	(
	 (setq start-of-surrounded-text (make-marker))
	 (setq end-of-surrounded-text (make-marker))
	 (set-marker start-of-surrounded-text (mark))
	 (set-marker end-of-surrounded-text (point))
	 (setq marker-position-of-start (marker-position start-of-surrounded-text))
	 (setq marker-position-of-end (marker-position end-of-surrounded-text))
	 ))
    (let
	((beg (point)))
      (forward-word 1)
      (setq start-of-surrounded-text (beg))
      (setq end-of-surrounded-text (point))
      )
    )
  
  (defun zzgraph/put-surrounding-character-from-start ()
    (goto-char start-of-surrounded-text)
    (insert opening-character)
    (goto-char end-of-surrounded-text)
    (insert closing-character)
    )
  (defun zzgraph/put-surrounding-character-from-end ()
    (goto-char start-of-surrounded-text)
    (insert closing-character)
    (goto-char end-of-surrounded-text)
    (insert opening-character)
    (goto-char start-of-surrounded-text)
    (forward-char 1)
    )
  (if (< marker-position-of-start marker-position-of-end)
      (zzgraph/put-surrounding-character-from-start)
    (zzgraph/put-surrounding-character-from-end)
    ))



(provide 'functionsInit)
;;; functionsInit.el ends here
  
