;;; markDownInit.el --- Configurations for markdown mode
;;; Commentary:
;; Associating md files with markdown mode

;;; Code:

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-hook 'markdown-mode-hook 'emmet-mode)

(setq markdown-command "pandoc -f markdown -t html5")

(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map (kbd "C-c '") 'markdown-edit-indirect))

(eval-after-load "markdown-mode"
  '(defalias 'markdown-add-xhtml-header-and-footer 'zzgraph/markdown-add-xhtml-header-and-footer))

(defun zzgraph/markdown-add-xhtml-header-and-footer (title)
    "Wrap XHTML header and footer with given TITLE around current buffer."
    (goto-char (point-min))
    (insert "<!DOCTYPE html5>\n"
	    "<html>\n"
	    "<head>\n<title>")
    (insert title)
    (insert "</title>\n")
    (insert "<meta charset=\"utf-8\" />\n")
    (when (> (length markdown-css-paths) 0)
      (insert (mapconcat 'markdown-stylesheet-link-string markdown-css-paths "\n")))
    (insert "\n</head>\n\n"
	    "<body>\n\n")
    (goto-char (point-max))
    (insert "\n"
	    "</body>\n"
	    "</html>\n"))



(provide 'markDownInit)
;;; markDownInit.el ends here
