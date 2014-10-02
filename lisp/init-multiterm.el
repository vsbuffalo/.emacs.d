;; multiterm

(require-package 'multi-term)
(require 'multi-term)

;; Use Emacs terminfo, not system terminfo
;; this solves 4m popping up due to issues with term colors
(setq system-uses-terminfo nil)
;; To get this to work, you'll have to use run
;; wget https://raw.githubusercontent.com/tovbinm/emacs-24-mac/master/etc/e/eterm-color.ti
;; tic -o ~/.terminfo eterm-color.ti


(setq multi-term-program "/bin/zsh")



(provide 'init-multiterm)
