;;; modeLineInit.el --- Customizations for modeline
;;; Commentary:
;; try to customize modeline with all-the-icons

;;; Code:
(require 'all-the-icons)
;; (require 'spaceline-config)

;; display time in modeline
(display-time-mode 1)
;; Display size of current buffer
(size-indication-mode t)
;; (display-battery-mode t)
(column-number-mode t)
(add-hook 'after-init-hook #'fancy-battery-mode)


;; (spaceline-all-the-icons-theme)

;; Modeline (smart-mode-line)
(sml/setup)
(setq sml/theme 'respectful)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the mode line format as it set by smart-mode-line                          ;;
;;                                                                            ;;
;; ("%e" mode-line-front-space mode-line-mule-info mode-line-client           ;;
;; mode-line-modified mode-line-remote mode-line-frame-identification         ;;
;; mode-line-buffer-identification sml/pos-id-separator mode-line-position    ;;
;; (vc-mode vc-mode)                                                          ;;
;; ml/pre-modes-separator mode-line-modes mode-line-misc-info                 ;;
;; mode-line-end-spaces)                                                      ;;
;; )                                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;; Let's have some mode-line customization fun

;; (set-face-attribute 'mode-line nil
;; 		    :height 2)

;; (set-face-attribute 'mode-line-inactive nil
;;                     :box '(:width 0)
;; 		    :box '(:line-width 0)
;; 		    :box '(:color "white")
;; 		    :box '(:style nil)
;; 		    :height 1.1
;; 		    :foreground "inherit"
;; 		    :background "inherit")


;; (require 'powerline) (powerline-default-theme) (setq
;; powerline-default-separator 'arrow) ;; (load-theme
;; 'airline-solarized-gui t) (load-theme 'airline-hybridline t)


(provide 'modeLineInit)
;;; modeLineInit.el ends here
