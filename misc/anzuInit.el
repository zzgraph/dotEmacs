;;; Package --- anzuInit.el
;;; Commentary:
;; Initialization settings for anzu mode.

;;; Code:

(require 'anzu)

(global-anzu-mode +1)

(define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
(define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)

(provide 'anzuInit)

;;; anzuInit.el ends here
