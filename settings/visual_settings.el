;show line number
(global-linum-mode 1)
(display-time-mode 1)
;highlight line
;(global-hl-line-mode t)

;no menu bar
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(setq ansi-color-names-vector ["#272822", "#F92672", "#E6DB74", "#66D9EF", "#FD5FF0", "#A1EFE4", "#A8A8A2"])

(setq rainbow-delimiters-max-face-count 8)

(require 'rainbow-delimiters)
(define-globalized-minor-mode my-global-rainbow-delimiters-mode rainbow-delimiters-mode
(lambda () (rainbow-delimiters-mode 1)))
(my-global-rainbow-delimiters-mode 1)


;;(setq indent-guide-recursive t)
(setq indent-guide-mode t)


;; (require 'highlight-indentation)
;; (define-globalized-minor-mode my-global-highlight-indentation-mode highlight-indentation-mode
;; (lambda () (highlight-indentation-mode 1)))
;; (my-global-highlight-indentation-mode 1)




(load-theme 'monokai t)



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-enforce-face ((t (:inherit (highlight) :underline nil))))
 '(flyspell-duplicate ((t (:underline "#E6DB74"))))
 '(flyspell-incorrect ((t (:underline "#F92672"))))
 '(fringe ((t (:inherit (default) :background nil))))
 '(header-line ((t (:inherit mode-line-inactive :box t :underline nil :overline nil))))
 '(hideshowvis-hidable-face ((t (:inherit (shadow)))))
 '(highlight ((t (:underline nil))))
; '(highlight-indentation-face ((t (:inherit (highlight)))))
 '(hl-paren-face ((t (:underline nil :weight bold))) t)
 '(linum ((t (:inherit (default)))))
 '(linum-highlight-face ((t (:inherit (highlight default)))))
 '(minimap-active-region-background ((t (:inherit highlight))) t)
 '(mode-line ((t (:underline nil :overline nil))))
 '(mode-line-highlight ((t (:inherit (highlight mode-line)))))
 '(mode-line-inactive ((t (:underline nil :overline nil))))
)

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)




(global-visual-line-mode 0)

;;higlight current line number
;(require 'hlinum)
;(hlinum-activate)



; highlight parenthes when cursor inside
(global-highlight-parentheses-mode t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error)


;; Cursor, please do not blink
(blink-cursor-mode 0)


;show current function
(which-function-mode 1)
(semantic-mode 1)


(provide 'visual_settings)
