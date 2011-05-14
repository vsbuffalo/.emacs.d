;;; init.el --- Initialize globals and load other configuration files

(require 'cl)

;; Default values
(defvar *emacs-root* (expand-file-name "~/.emacs.d/")
  "root of emacs load-path")
(defvar *aspell-path* "/opt/local/bin/aspell"
  "location of aspell for flyspell-mode")
(defvar *sbcl-path* "/opt/local/bin/sbcl"
  "location of sbcl for use with slime")
(defvar *tex-paths* '("/usr/local/bin" "/usr/texbin")
  "location of TeX binaries for AUCTeX")

;; Set up load path - everything should be contained to ~/.emacs.d
(labels ((add-path (p) 
		   (add-to-list 'load-path (concat *emacs-root* p))))
  (add-path "settings") ;; contains all settings
  (add-path "modes") ;; for mode files; this need to be installed separately
  (add-path "modes/auctex") 
  (add-path "modes/slime")
  (add-path "modes/yasnippet")
  (add-path "modes/ess/lisp") ;; ESS's lisp (also needs ess/etc)
  (add-path "elisp") ;; for tiny bits of code, both mine and collected
  (add-path "elisp/themes") ;; contains themes for use with color-theme
  )


;; General settings, i.e. behaviors across all modes.
(load-library "general")

;; Color themes and aesthetic settings
(load-library "visual")

;; Configurations for various modes
(load-library "mode-settings")

;; Load my custom elisp functions (for small stuff)
(load-library "custom")
