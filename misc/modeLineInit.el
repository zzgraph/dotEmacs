;;; modeLineInit.el --- Customizations for modeline
;;; Commentary:
;; try to customize modeline with all-the-icons

;;; Code:

;; display time in modeline
(display-time-mode 1)
;; Display size of current buffer
(size-indication-mode t)
(display-battery-mode t)
(column-number-mode t)

;; Add word count to modeline

(setq mode-line-position
      (append
       mode-line-position
       '((wc-mode
	  (6 (:eval (if (use-region-p)
			(format " %d,%d,%d"
				(abs (- (point) (mark)))
				(count-words-region (point) (mark))
				(abs (- (line-number-at-pos (point))
					(line-number-at-pos (mark)))))
		      (format " %d,%d,%d"
			      (- (point-max) (point-min))
			      (count-words-region (point-min) (point-max))
			      (line-number-at-pos (point-max))))))
	  nil))))



;; Modeline (smart-mode-line)
(require 'smart-mode-line)
(sml/setup)
(setq sml/theme 'respectful)

(provide 'modeLineInit)
;;; modeLineInit.el ends here
