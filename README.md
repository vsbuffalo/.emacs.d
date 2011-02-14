Vince Buffalo's .emacs.d
========================

This is my .emacs.d directory. A large part of my layout is inspired
by Fogus's and Steve Yegge's. My init.el has machine-dependent loading
for a few reasons. First, I tried to keep all paths out of files
*except* init.el, since the locations of SBCL, Clojure, aspell, etc
are different across machines. Second, monitor sizes differ too, hence
the different frame sizes and window splitting. Adjust these to your
needs. I don't use sessions.el of desktop.el because I like working
with a clean slate when I do close Emacs (rare).

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
these.

### Installing org-mode (developent version)
Note that one can also just follow releases: <http://orgmode.org/worg/org-faq.html#using-stable-releases-only>

  1. cd ~/.emacs.d/modes/
  2. git clone git://orgmode.org/org-mode.git 
      
### Installing ESS
  Download from: http://ess.r-project.org/index.php?Section=download
  
  1. cp -r ess-version.number ~/.emacs.d/modes/ess

### Install Slime
    
  1. cd to ~/.emacs.d/modes/
  2. cvs -d :pserver:anonymous:anonymous@common-lisp.net:/project/slime/cvsroot co slime


### Install AUCTeX
  Download from: http://www.gnu.org/software/auctex/

  1. ./configure --with-lispdir=/Users/vinceb/.emacs.d/modes/auctex --with-texmf-dir=/usr/local/texlive/texmf-local
  2. make
  3. sudo make install

### Installing YASnippet
  Download from: http://code.google.com/p/yasnippet/downloads/

  1. cp -r yasnippet-version.number ~/emacs.d/modes/yasnippet

### Installing ido-mode
  1. curl http://cvs.savannah.gnu.org/viewvc/*checkout*/emacs/emacs/lisp/ido.el > ~/.emacs.d/modes/ido.el

### Installing js2-mode
  1. curl http://js2-mode.googlecode.com/files/js2-20090723b.el  > ~/.emacs.d/modes/js2-mode.el

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