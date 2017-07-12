;;; jsInnit.el --- Configurations for JS2 mode
;;; Commentary:
;; Using js2-mode to edit java script files and use nodejs as jave
;; script inferior mode

;;; Code:

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq js-basic-indent 2)
(setq-default js2-basic-indent 2
	      js2-basic-offset 2
	      js2-auto-indent-p t
	      js2-cleanup-whitespace t
	      js2-enter-indents-newline t
	      js2-indent-on-enter-key t
	      js2-strict-missing-semi-warning t
	      js2-global-externs (list "window" "module" "require" "buster"
				       "sinon" "assert" "refute" "setTimeout"
				       "clearTimeout" "setInterval"
				       "clearInterval" "location" "__dirname"
				       "console" "JSON" "jQuery" "$"))

;; Initiating tern mode when js2-mode starts
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; Just prettify some symbols for fun
(add-hook 'js2-mode-hook
	  (lambda ()
	    (push '("function" . ?ƒ) prettify-symbols-alist)
	    (push '("!==" . ?≠) prettify-symbols-alist)
	    (push '(">=" . ?≥) prettify-symbols-alist)
	    (push '("<=" . ?≤) prettify-symbols-alist)
	    (push '("undefined" . ?∅) prettify-symbols-alist)
	    (push '("===" . ?≡) prettify-symbols-alist)
	    (push '("==" . ?≈) prettify-symbols-alist)
	    (push '("=>" . ?→) prettify-symbols-alist)
	    (push '("" . ?ƒ) prettify-symbols-alist)
	    ))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Using js-comint as repl
;; https://github.com/redguardtoo/js-comint
;; It uses nodejs by default but behavior can be changed
(require 'js-comint)
(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-j e") 'js-send-last-sexp)
	    (local-set-key (kbd "C-c C-j b") 'js-send-buffer)
	    (local-set-key (kbd "C-c C-j l") 'js-load-file)))


(provide 'jsInit)
;;; jsInnit.el ends here
