;;;; shell-settings.el

;; Make emacs shell prompts read-only (disabled now) and jump to end
;; of buffer when there is output
(setq comint-prompt-read-only nil)
(setq comint-move-point-for-output t)
(setq comint-scroll-to-bottom-on-input t)
