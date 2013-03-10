;;; Mode Settings --- All settings for modes like python-mode, ESS, etc are here.

;; ========== Autopair ==========
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(setq autopair-blink nil)

;; ========== Auto Insert ==========
(require 'autoinsert)
(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)

;; ========== nxml-mode ==========
(add-to-list 'auto-mode-alist
             (cons (concat "\\." (regexp-opt
                                  '("xsd" "sch" "rng" "xslt" "svg" "rss" "Rdb")
                                  t) "\\'") 'nxml-mode))

;; ========== Load ELPA ==========
(when (load (concat *emacs-root* "elpa/package.el"))
  (package-initialize))

;; ========== YASnippet ==========
;; Not really a mode, but YASnippet is
;; kept under <emacs-root>/modes, so this is here
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat *emacs-root* "modes/yasnippet/snippets"))

;; ========== ido-mode ==========
(require 'tramp)
(require 'ido)
(ido-mode t)
;; enable fuzzy matching:
(setq ido-enable-flex-matching t)

;; ========== js2-mode ==========
(require 'js2-mode)

;; ========== python-mode ==========
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq py-indent-offset 4)

;; Check PEP8 Style on the fly 
;; relies on pep8.py
;; (when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;          (list "/usr/local/bin/pep8.py" (list "--repeat" local-file))))

;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pylint-init)))

;; Pylint
(require 'python-pylint)

;; ========== AUCTeX ==========
;; Add directories containg TeX binaries to path; the OS X Emacs
;; application doesn't get the system path. This also works (with
;; restart):
;; defaults write $HOME/.MacOSX/environment PATH “$PATH”
(setenv "PATH"
        (concat (getenv "PATH") (mapconcat #'(lambda (e) e) *tex-paths* ":")))
(setq exec-path (append exec-path *tex-paths*))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; Use PDFTeX
(setq TeX-parse-self t)

;; RefTeX options - from kjhealy's Emacs-starter-kit
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;; (autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
;; (autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
;; (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;; (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;; (add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
  
;; ;; Make RefTeX faster
;; (setq reftex-enable-partial-scans t)
;; (setq reftex-save-parse-info t)
;; (setq reftex-use-multiple-selection-buffers t)
;; (setq reftex-plug-into-AUCTeX t)

;; ========== ESS Settings ==========
(require 'ess-site)
(setq ess-indent-level 2)
(setq ess-eval-visibly-p nil)

;; By default, #, ##, and ### indent to different levels. This is
;; stupid, so the line below fixes this.
(setq ess-fancy-comments nil)

;; ========== Flyspell ==========
;; This is sometimes disabled as an Emacs 23 bug makes this slow with Sweave
(let ((aspell *aspell-path*))
  (if (file-exists-p aspell)
      (progn (setq ispell-dictionary "english")
             (setq ispell-program-name aspell)
             (add-hook 'LaTeX-mode-hook 'flyspell-mode)
             (global-set-key [mouse-3] 'flyspell-correct-word))
    (warn "aspell was not found in: %s" aspell)))

;; ========== Org-mode Settings ==========
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/notebooks/")
(setq org-default-notes-file "~/org/.notes")
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(org-agenda-files (quote ("~/notebooks/personal-todo.org")))
(global-font-lock-mode t)

;; look for a basic template; if exists, insert it
(let ((basic-org-template (concat *emacs-root* "templates/basic.org")))
  (if (file-exists-p basic-org-template)
      (define-auto-insert "\.org" basic-org-template)))


;; binding remember-mode with org-mode
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/org/newgtd.org" "Tasks")))

;; Don't subscript
(setq org-export-with-sub-superscripts nil)

;; TODO states
(setq org-todo-keywords
      '((sequence "TODO(t)" "FEEDBACK(f)" "VERIFY(v)" 
                  "FRAGILE(f)" "|" "DONE(d)" "DELEGATED(g)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")))

;; ========== Org Babel Mode Settings ==========
;; Active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (sh . t)
   ))

;; Don't prompt for eval of each code block
(setq org-confirm-babel-evaluate nil)

;; ========= Org-mode Reference handling =========
(defun org-mode-reftex-setup ()
(load-library "reftex")
(and (buffer-file-name)
(file-exists-p (buffer-file-name))
(reftex-parse-all))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
)
(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; ========== Slime, SBCL, and Clojure ==========
;; At the very least, I should have SBCL installed, otherwise skip.
(when (boundp '*sbcl-path*)
  (setq slime-lisp-implementations
        (list 
         '(sbcl (*sbcl-path*) :coding-system utf-8-unix)
         (if (boundp '*clojure-path*)
             `(clojure (,*clojure-path*) :init swank-clojure-init))))
  
  ;; Make slime more useful
  (require 'slime-autoloads)
  (add-hook 'lisp-mode-hook (lambda ()
                              (cond ((not (featurep 'slime))
                                     (require 'slime)
                                     (normal-mode)))))
  (eval-after-load "slime"
    '(progn
       (add-to-list 'load-path (concat *emacs-root* "modes/slime/contrib")
                    (require 'slime-fancy)
                    (require 'slime-banner)
                    (require 'slime-asdf)
                    (slime-banner-init)
                    (slime-asdf-init)
                    (setq slime-complete-symbol*-fancy t)
                    (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
                    (slime-setup))))
  (when (boundp '*clojure-path*)
    (setq auto-mode-alist
          (cons '("\\.clj$" . clojure-mode)
                auto-mode-alist))))

;; ========== g-client ==========
;; Awesome interface to Google API for Google web apps.
;; Requires running make in directory as part of install.
(add-to-list 'load-path 
             (concat *emacs-root* "modes/g-client/"))
(require 'g)

;; ;; ========= Markdown-mode =========
;; ;; More info here: http://jblevins.org/projects/markdown-mode/
;; (autoload 'markdown-mode "markdown-mode.el" "Major mode for
;; editing Markdown files" t)
;; (setq auto-mode-alist (cons
;; '("\\.md" . markdown-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons
;; '("\\.Rmd". markdown-mode) auto-mode-alist))

;; ========= Lua mode =========
(require 'lua-mode)

;; ========== multiple-cursors  ==========
(add-to-list 'load-path 
             (concat *emacs-root* "modes/multiple-cursors.el"))
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ========== asciidoc  ==========
(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.asciidoc$" . doc-mode))
(add-hook 'doc-mode-hook
          '(lambda ()
             (turn-on-auto-fill)
             (require 'asciidoc)))

