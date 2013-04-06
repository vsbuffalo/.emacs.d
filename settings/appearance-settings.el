;;;; appearance-settings.el

(setq visible-bell t
      font-lock-maximum-decoration t
      color-theme-is-global t
      truncate-partial-width-windows nil)


;; Display column number
(column-number-mode t)

;; Make uniquely named buffers for easier C-x C-b'ing
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; Color-theme settings
(when (eq window-system 'ns)
  (require 'color-theme)
  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       (color-theme-tango))))

(provide 'appearance-settings)
