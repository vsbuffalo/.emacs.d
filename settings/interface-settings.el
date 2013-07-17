;;;; interface-settings.el

;; Allow repeated cycling through mark ring
(setq set-mark-command-repeat-pop t)
;; Set higher mark ring maximum
(setq mark-ring-max 80)
(setq global-ring-max 80)

;; Allow me to answer y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable buffer-swapping
(require 'buffer-move)
(global-set-key (kbd "S-<up>") 'buf-move-up)
(global-set-key (kbd "S-<down>") 'buf-move-down)
(global-set-key (kbd "S-<left>") 'buf-move-left)
(global-set-key (kbd "S-<right>") 'buf-move-right)

;; Make Grep's default command recursive
(setq grep-command "grep -nHr -e ")

;; Window resizing shortcuts
(defun enlarge-window-again ()
  "This is designed to be bound to ^, such that consecutive ^
keystrokes continue to enlarge the window."
  (interactive)
  (if (or (eql last-command 'enlarge-window) 
          (eql last-command 'enlarge-window-again))
      (enlarge-window 1)
    (insert "^")))
(global-set-key (kbd "^") 'enlarge-window-again)

;; Even more accessible window resizing
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; join on to one line, from http://whattheemacsd.com/
(global-set-key (kbd "M-j")
            (lambda ()
              (interactive)
              (join-line -1)))

(global-set-key (kbd "C-i") 'backward-kill-word)

(provide 'interface-settings)
