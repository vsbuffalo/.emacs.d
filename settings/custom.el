;; Custom code
;;

;; Add support for clearing shells
(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size old-max)))
(global-set-key  (kbd "\C-x c") 'clear-shell)



