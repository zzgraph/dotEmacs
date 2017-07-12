;;; torrentsInit.el --- Configurations for Mentor front end to rTorrent
;;; Commentary:
;; Using Emacs as a frontend for rtorrent.
;; Mentor homepage is https://github.com/skangas/mentor
;; Additional settings for rTorrent should be done.
;; place below code in your .rtorrent.rc file:
;; scgi_local = ~/.rtorrent-rpc.socket
;; xmlrpc_dialect = i8
;; encoding_list = UTF-8

;;; Code:

(require 'mentor)
(setq mentor-rtorrent-external-rpc "~/.rtorrent-rpc.socket")

(provide 'torrentsInit)
;;; torrentsInit.el ends here
