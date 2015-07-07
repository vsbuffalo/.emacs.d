;; ESS settings

(require-package 'ess)

(require 'ess-site)
(setq ess-indent-level 2)
(setq ess-default-style 'OWN)
(setq ess-eval-visibly-p nil)

;; turn off damn annoying ess fancy comments
(setq ess-fancy-comments nil)

;; ess autocomplete
(setq ess-use-auto-complete 'script-only)

;; polymode for Rmd, etc. support
(require-package 'polymode)
(require 'polymode)

;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
;;;;
(require 'poly-R)
(require 'poly-markdown)


(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
(add-to-list 'auto-mode-alist '("\\.Snw\\'" . Rnw-mode))

;; Make TeX and RefTex aware of Snw and Rnw files
(setq reftex-file-extensions
      '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

;; Lets you do 'C-c C-c Sweave' from your Rnw file
(add-hook 'Rnw-mode-hook
          (lambda ()
            (add-to-list 'TeX-command-list
                         '("Sweave" "R CMD Sweave %s"
                           TeX-run-command nil (latex-mode) :help "Run Sweave") t)
            (add-to-list 'TeX-command-list
                         '("LatexSweave" "%l %(mode) %s"
                           TeX-run-TeX nil (latex-mode) :help "Run Latex after Sweave") t)
            (setq TeX-command-default "Sweave")))



(provide 'init-ess)
