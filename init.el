;; Vince Buffalo's .emacs.d directory
;; vsbuffaloAAAAA@gmail.com (with the poly-A tail removed)
;;

(require 'cl)

(defvar emacs-root (cond
                    ((member system-type (list 'gnu/linux 'linux))
                     "/home/vinceb/.emacs.d/")
                    ((eq system-type 'darwin)
                     "/Users/vinceb/.emacs.d/"))
  "root of emacs load-path")



(labels ((add-path (p) 
		   (add-to-list 'load-path (concat emacs-root p))))
  (add-path "settings") ;; contains all settings
  (add-path "modes") ;; for mode files; this need to be installed separately
  (add-path "modes/auctex") 
  (add-path "modes/slime")
  (add-path "modes/yasnippet")
  (add-path "modes/ess/lisp") ;; ESS's lisp (also needs ess/etc)
  (add-path "elisp") ;; for tiny bits of code, both mine and collected
  (add-path "elisp/themes") ;; contains themes for use with color-theme
  )

(load-library "general")
(load-library "visual")
(load-library "mode-settings")

