;; Visual Settings
;;
;; More general settings are in general.el

;; Cursor type
(setq-default cursor-type 'bar)
(blink-cursor-mode t)

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

(when (window-system)
  (set-frame-height (selected-frame) *frame-height*)
  (set-frame-width (selected-frame) *frame-width*))