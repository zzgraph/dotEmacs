;;; diminishInit.el --- List of minor modes to be diminished on startup
;;; Commentary:
;;; Code:

(require 'diminish)

(eval-after-load "flyspell" '(diminish 'flyspell-mode))
;; (eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "company" '(diminish 'company-mode))
;; (eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "simple" '(diminish 'visual-line-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "ivy" '(diminish 'ivy-mode))
(eval-after-load "anzu" '(diminish 'anzu-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "guru-mode" '(diminish 'guru-mode))
(eval-after-load "editorconfig" '(diminish 'editorconfig-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "which-key" '(diminish 'which-key-mode))
(eval-after-load "css-mode" '(diminish 'rainbow-mode))
(eval-after-load "web-mode" '(diminish 'emmet-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "whitespace" '(diminish 'whitespace-mode))
(eval-after-load "tern" '(diminish 'tern-mode))
(eval-after-load "js2-mode-pkg" '(diminish 'js2-mode "JS2"))
(diminish 'auto-revert-mode)




(provide 'diminishInit)
;;; diminishInit.el ends here
