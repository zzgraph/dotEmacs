;;; Package --- bbdbInit.el
;;; Commentary:
;;; Code:

;; (require 'bbdb)
(bbdb-initialize)


(setq bbdb-file "~/.bbdb")
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'message-mode-hook
          '(lambda ()
             (bbdb-initialize 'message)
             (bbdb-initialize 'gnus)
             (local-set-key "<TAB>" 'bbdb-complete-name)))
(defvar bbdb-time-internal-format "%Y-%m-%d"
  "The internal date format.")
;; (autoload 'gmail2bbdb-import-file "gmail2bbdb" nil t nil)
;; From Here https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-bbdb.el
(add-hook 'bbdb-initialize-hook
          '(lambda ()
             ;; @see http://emacs-fu.blogspot.com.au/2009/08/managing-e-mail-addresses-with-bbdb.html
             (setq
               bbdb-offer-save 1                        ;; 1 means save-without-asking

               bbdb-use-pop-up nil                        ;; allow popups for addresses
               bbdb-electric-p t                        ;; be disposable with SPC
               bbdb-popup-target-lines  nil               ;; very small

               bbdb-dwim-net-address-allow-redundancy t ;; always use full name
               bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs

               bbdb-always-add-address t                ;; add new addresses to existing...
               ;; ...contacts automatically
               bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx

               bbdb-completion-type nil                 ;; complete on anything

               bbdb-complete-name-allow-cycling t       ;; cycle through matches
               ;; this only works partially

               bbbd-message-caching-enabled t           ;; be fast
               bbdb-use-alternate-names t               ;; use AKA

               bbdb-elided-display t                    ;; single-line addresses
               ;; auto-create addresses from mail
               bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook
               bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
               ;; NOTE: there can be only one entry per header (such as To, From)
               ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html

               '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter\\|notifications")))

             ;; just remove some warning since bbdb package hook the mail-mode
             (setq compose-mail-user-agent-warnings nil)
             ))

(provide 'bbdbInit)
;;; bbdbInit.el ends here
