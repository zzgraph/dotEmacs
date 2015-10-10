;;; Package --- messageInit.el
;;; Commentary:
;;; Code:

(setq message-sendmail-f-is-evil t)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq sendmail-program "/usr/bin/msmtp")

(setq mail-user-agent 'sendmail-user-agent)
(add-hook 'message-mode-hook 'turn-on-orgstruct)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'message-mode-hook 'turn-on-orgtbl)

(provide 'messageInit)
;;; messageInit.el ends here
