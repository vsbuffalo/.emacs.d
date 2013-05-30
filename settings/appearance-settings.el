;;;; appearance-settings.el
(setq visible-bell nil
      font-lock-maximum-decoration t
      color-theme-is-global t)


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
       (set-frame-size (selected-frame) 65 60)
       (require 'tangotango-theme)
       (set-face-attribute 'default nil :height 120))))

(provide 'appearance-settings)
