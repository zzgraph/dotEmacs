;;; shellInit.el --- configurations for shell pop
;;; Commentary:
;; 

;;; Code:

;; comint install

;; (require 'bash-completion)
;; (bash-completion-setup)

;; instruction from https://github.com/atomontage/xterm-color

(require 'xterm-color)
(progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (setq comint-output-filter-functions
	     (remove 'ansi-color-process-output comint-output-filter-functions)
	     ))


(defun zzgraph/init-eshell-xterm-color ()
  "Initialize xterm coloring for eshell."

  (setq-local xterm-color-preserve-properties t)
  (make-local-variable 'eshell-preoutput-filter-functions)
  (add-hook 'eshell-preoutput-filter-functions 'xterm-color-filter)
  (setq-local eshell-output-filter-functions
              (remove 'eshell-handle-ansi-color
		      eshell-output-filter-functions)))

(add-hook 'eshell-mode-hook 'zzgraph/init-eshell-xterm-color)


;; Make URLs clickable
(add-hook 'shell-mode-hook (lambda () (goto-address-mode )))

;; (define-key shell-mode-map (kbd "TAB") #'pcomplete)

;; (add-hook 'shell-mode-hook
;;             (lambda ()
;;               (set (make-local-variable 'company-backends)
;;                    '((company-dabbrev-code company-capf)))))


(provide 'shellInit)
;;; shellInit.el ends here
