;;; linumInit.el --- Configuration to show line numbers
;;; Commentary:
;;; Code:


;; Isn't it silly to first start a global mode and then inhibit it in
;; almost "every other" modes? I think it's silly! let see how is this
;; going to work, and let's use nlinum instead of linum
(add-hook 'prog-mode-hook 'linum-mode)

;; Fix Line number scaling based on window font scale
;; Source: http://www.emacswiki.org/emacs/LineNumbers#toc14
(defun linum-update-window-scale-fix (window)
  "Fix Line number scaling based on WINDOW font scale."
  (set-window-margins window
		      (ceiling (* (if (boundp 'text-scale-mode-step)
				      (expt text-scale-mode-step
					    text-scale-mode-amount) 1)
				  (if (car (window-margins))
				      (car (window-margins)) 1)
				  ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)
(require 'hlinum)
;; (hlinum-activate)

(provide 'linumInit)
;;; linumInit.el ends here
