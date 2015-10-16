;;; personal.el --- My personal information stays here
;;; Commentary:
;; 
;;; Code:
(setq user-mail-address "zzgraph@gmail.com"
      user-full-name    "Shahab Shahsavari Alavidjeh")
(defvar my-email-addresses)
(setq my-email-addresses '("zzgraph@gmail.com"
			   "shahab.shahsavari@outlook.com"
			   "shibi.shahsavari@gmail.com"))
(setenv "PATH"
	(concat
	 "~/bin" ":"
	 (getenv "PATH")))

(add-to-list 'exec-path "~/bin")

(provide 'personal)

;;; personal.el ends here
