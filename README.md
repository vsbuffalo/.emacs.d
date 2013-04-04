# Vince Buffalo's .emacs.d

This is my .emacs.d directory. A large part of my layout is inspired
by Fogus's and Steve Yegge's. I would recommend using this only for
reference, and not cloning and using it exactly, because what works
for me may not work for you.

Installing Emacs
----------------

I bounce back and forth between Emacs distributions. Currently I am
using [Homebrew's](http://mxcl.github.com/homebrew/) version. Here are
some other options:

 1. Standard Emacs: http://ftp.gnu.org/pub/gnu/emacs/ with both the
 GUI app and terminal emacs.

 2. Typester's Emacs fork (supports OS X full screen mode):
 (http://github.com/typester/emacs)

 3. Standard Emacs from homebrew: `brew install emacs`. This is what I
 am using primarily no

The installation of the first two ares similiar on OS X for the GUI
version:

 1. `./configure --with-ns`
 2. `make bootstrap`
 3. `make install`
 4. `mv nextstep/Emacs.app /Applications`

To build the terminal application, make sure `jpeg`, `tiff`, and `libungif`
are installed via Homebrew. Then compile with:

 1. `./configure --without-x`
 2. `make`
 3. `make install`

This installs to `/usr/local/bin/emacs` which you should add to your
`$PATH` in your `~/.profile`. Terminal Emacs works very well with the
excellent iTerm2.s

## Installing AUCTeX, Slime, and ESS

I explicitly do not check AUCTeX, Slime, and ESS into Git because they're big
(over three megabytes). Thus if you use this, you do need to install
these.

### Installing org-mode (developent version)

`org-mode` is packaged with Emacs now, but if you want to follow the
development release, do the following. 

  1. `cd ~/.emacs.d/modes/`
  2. `git clone git://orgmode.org/org-mode.git`
      
### Installing ESS

  Download from: http://ess.r-project.org/index.php?Section=download
  
  1. `cp -r ess-version.number ~/.emacs.d/modes/ess`

### Install Slime
    
  1. `cd ~/.emacs.d/modes/`
  2. `cvs -d :pserver:anonymous:anonymous@common-lisp.net:/project/slime/cvsroot co slime`

### Install AUCTeX

  Get from Homebrew, or download from: http://www.gnu.org/software/auctex/

  1. `./configure --with-lispdir=/Users/vinceb/.emacs.d/modes/auctex --with-texmf-dir=/usr/local/texlive/texmf-local`
  2. `make`
  3. `sudo make install`

### Installing YASnippet
  Download from: http://code.google.com/p/yasnippet/downloads/

  1. `cp -r yasnippet-version.number ~/emacs.d/modes/yasnippet`

### Installing ido-mode
  1. `curl http://cvs.savannah.gnu.org/viewvc/*checkout*/emacs/emacs/lisp/ido.el > ~/.emacs.d/modes/ido.el`

### Installing js2-mode

This is actually tracked in this repository, but to update:

  1. `curl http://js2-mode.googlecode.com/files/js2-20090723b.el  > ~/.emacs.d/modes/js2-mode.el`

### Installing multiple-cursors

  1. git clone git://github.com/magnars/multiple-cursors.el.git ~/.emacs.d/modes/multiple-cursors.el

