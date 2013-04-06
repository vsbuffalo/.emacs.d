# Vince Buffalo's .emacs.d

This is my .emacs.d directory. A large part of my layout is inspired
by Fogus's, Steve Yegge's, and [Magnar
Sveen's](https://github.com/magnars/.emacs.d). I would recommend using
this only for reference, and not cloning and using it exactly, because
what works for me may not work for you.

## Installing Emacs

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
excellent iTerm2.

## Plugins

This `~/.emacs.d` tries to avoid keeping hard copies of elisp files in
it, but is also should self contained. Many required packages are
managed by `package.el` (and handled via `setup-package.el`); others
are Git submodules. When cloning, use:

    git clone --recursive https://github.com/vsbuffalo/.emacs.d/


