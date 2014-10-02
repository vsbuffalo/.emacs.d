;; General Settings

;; exec-path-from-shell
(require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; fill width
(setq-default fill-column 80)

;; add new lines with C-n
(setq next-line-add-newlines t)

;; Make Grep's default command recursive
(setq grep-command "grep -nHr -e ")

;; Disable that stupid toolbar and menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Increase undo limit 
(setq undo-limit 9000000)

;; Don't give me that unpleasant start up message
(setq inhibit-startup-message t)

;; Buffer switching in cocoa app mirrors my iTerm2 toggling
(when (eq window-system 'ns)
  (global-set-key (kbd "s-o") 'other-window) 
  (global-set-key (kbd "s-j") 'previous-buffer) 
  (global-set-key (kbd "s-k") 'next-buffer)  
  (global-set-key (kbd "s-t") 'split-window-right))

;; Allow repeated cycling through mark ring
(setq set-mark-command-repeat-pop t)
;; Set higher mark ring maximum
(setq mark-ring-max 80)
(setq global-ring-max 80)

;; Allow me to answer y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable buffer-swapping
;; (require 'buffer-move)
;; (global-set-key (kbd "S-<up>") 'buf-move-up)
;; (global-set-key (kbd "S-<down>") 'buf-move-down)
;; (global-set-key (kbd "S-<left>") 'buf-move-left)
;; (global-set-key (kbd "S-<right>") 'buf-move-right)

(provide 'init-general)
