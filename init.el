;;; init.el --- Initialize globals and load other configuration files

(require 'cl)

;; Default values
(defvar *emacs-root* nil "root of emacs load-path")
(defvar *frame-height* 110 "frame height (only applies for windowed ns sessions")
(defvar *frame-width* 110 "frame width (only applies for windowed ns sessions")
(defvar *aspell-path* "/opt/local/bin/aspell" "location of aspell for flyspell-mode")
(defvar *sbcl-path* nil "location of sbcl for use with slime")
(defvar *clojure-path* nil "location of clojure for use with slime")
(defvar *tex-paths* nil "location of TeX binaries for AUCTeX")

;; Machine-dependent initialization
(let ((this-machine (car (split-string (system-name) "\\.")))) 
  (cond 
   ((string= this-machine "biocoreap1")
    (progn
      (setf *emacs-root* "/Users/vinceb/.emacs.d/")
      (setf *frame-height* 110)
      (setf *frame-width* 110)
      (setf *aspell-path* "/opt/local/bin/aspell")
      (setf *sbcl-path* "/opt/local/bin/sbcl")
      (setf *clojure-path* "/Users/vinceb/Library/Clojure/clj")
      (setf *tex-paths* '("/usr/local/bin" "/usr/texbin"))))
   ((string= this-machine "markov")
    (progn
      (setf *emacs-root* "/Users/vinceb/.emacs.d/")
      (setf *frame-height* 110)
      (setf *frame-width* 300)
      (setf *aspell-path* "/opt/local/bin/aspell")
      (setf *sbcl-path* "/opt/local/bin/sbcl")
      (setf *clojure-path* nil)
      (setf *tex-paths* '("/usr/local/bin" "/usr/texbin"))
      (if (window-system)
          (split-window-horizontally))))
   (t 
    (progn
      (message "This machine is not in the machines list; using defaults configuration")
      (setf *emacs-root* (cond
                        ((member system-type (list 'gnu/linux 'linux))
                         "/home/vinceb/.emacs.d/")
                        ((eq system-type 'darwin)
                         "/Users/vinceb/.emacs.d/")))))))
  

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

(load-library "general")
(load-library "visual")
(load-library "mode-settings")