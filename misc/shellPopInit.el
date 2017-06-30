;;; shellPopInit.elf --- configurations for shell pop
;;; Commentary:
;; 

;;; Code:

(require 'shell-pop)

(setq shell-pop-autocd-to-working-dir t)
(setq shell-pop-shell-type "eshell")
(setq shell-pop-universal-key [f12])
(setq shell-pop-window-size 20)
(setq shell-pop-full-span t)
;; (setq shell-pop-window-position "bottom")
;; (global-set-key [f12] 'shell-pop)


(provide 'shellPopInit)
;;; shellInit.el ends here
