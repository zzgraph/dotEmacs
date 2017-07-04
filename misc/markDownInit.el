;;; markDownInit.el --- Configurations for markdown mode
;;; Commentary:
;; Associating md files with markdown mode

;;; Code:

(require 'markdown-mode)

;; Associating .md and .markdown files with markdown major mode

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; special mode for README.md files which almost always use github
;; flavoured markdown or gfm
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; loading emmetmode inside markdown files for arbitrary html files.
(add-hook 'markdown-mode-hook 'emmet-mode)

;; Using pandoc as markdown command
(setq markdown-command "pandoc -f markdown -t html5")

;; TODO find a way to enable font-lock highlighting for each
;; programming language in code blocks

;; TODO see if electric-pair-mode for insert pairs of #, *, **, and
;; see if it's necessary.

;; TODO Adding pandoc-mode to markdown mode
;; http://joostkremers.github.io/pandoc-mode/

;; Use a temporary buffer with appropriate major mode to edit
;; code-blocks
(eval-after-load 'markdown-mode
  '(define-key markdown-mode-map (kbd "C-c '") 'markdown-edit-indirect))

;; Snippet from emacswiki
;; https://www.emacswiki.org/emacs/MarkdownMode#toc6 this helps to
;; change exported html files for previewing in brwser use standard
;; html5 doctype headers instead of xhtml and let UTF8 content show
;; correctly in preview
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
