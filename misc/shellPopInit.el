;;; shellPopInit.elf --- configurations for shell pop
;;; Commentary:
;; 

;;; Code:

(require 'shell-pop)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-default-directory nil)
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "<f12>")
 '(shell-pop-window-size 20)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom"))

(provide 'shellPopInit)
;;; shellPopInit.el ends here
