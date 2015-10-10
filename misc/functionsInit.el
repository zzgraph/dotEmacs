;;; Package --- functionsInit.el
;;; Commentary:
;;; Code:

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and make it into a single line of text."
      (interactive (progn (barf-if-buffer-read-only) '(t)))
      (let ((fill-column (point-max)))
        (fill-paragraph nil region)))



(provide 'functionsInit)
;;; functionsInit.el ends here
