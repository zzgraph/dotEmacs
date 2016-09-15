;;; undoTreeInit.el --- Undo Tree Settings
;;; Commentary:
;; Configurations needed for undo tree package.
;;; Code:

;; undotree-mode Keybindings
(require 'undo-tree)

(global-undo-tree-mode)

(global-set-key (kbd "M-/") 'undo-tree-visualize)

(provide 'undoTreeInit)
;;; undoTreeInit.el ends here
