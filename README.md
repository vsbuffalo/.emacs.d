Vince Buffalo's .emacs.d
========================
This is my .emacs.d directory. 

A large part of my layout is inspired by Fogus's:
http://github.com/fogus/me/

Installing Emacs
----------------
I bounce back and forth between Emacs distributions. The two I use
most are:

 1. Standard Emacs: http://ftp.gnu.org/pub/gnu/emacs/
 2. Typester's Emacs fork (supports OS X full screen mode):
    (http://github.com/typester/emacs)

Either way, the installation is similiar on OS X:
 1. ./configure --with-ns
 2. make bootstrap
 3. make install
 4. mv nextstep/Emacs.app /Applications

Installing AUCTeX, Slime, and ESS
---------------------------------

I explicitly do not check AUCTeX, Slime, and ESS into git because they're big
(over three megabytes). Thus if you use this, you do need to install
this. 
      
### Installing ESS
  Download from: http://ess.r-project.org/index.php?Section=download
  
  1. cp -r ess-version.number ~/.emacs.d/modes/ess

### Install Slime
    
  1. cd to ~/.emacs.d/modes/
  2. cvs -d :pserver:anonymous:anonymous@common-lisp.net:/project/slime/cvsroot co slime


### Install AUCTeX
  Download from: http://www.gnu.org/software/auctex/

  1. ./configure --with-lispdir=~/.emacs.d/modes/auctex/ --with-texmf-dir=/usr/local/texlive/texmf-local
  2. make
  3. sudo make install

### Installing YASnippet
  Download from: http://code.google.com/p/yasnippet/downloads/

  1. cp -r yasnippet-version.number ~/emacs.d/modes/yasnippet

### Installing ido-mode
  1. curl http://cvs.savannah.gnu.org/viewvc/*checkout*/emacs/emacs/lisp/ido.el > ~/.emacs.d/modes/ido.el

ELPA
----

You must manually install ELPA. The directions are here:
http://tromey.com/elpa/install.html, but basically you evaluate (with
C-x C-e) a block like:

    (let ((buffer (url-retrieve-synchronously
    	       "http://tromey.com/elpa/package-install.el")))
      (save-excursion
        (set-buffer buffer)
        (goto-char (point-min))
        (re-search-forward "^$" nil 'move)
        (eval-region (point) (point-max))
        (kill-buffer (current-buffer))))

Which produces a block of code. I have this in
settings/mode-settings.el, so the code the block above generates to
avoid redundancy.