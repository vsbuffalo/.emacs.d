# Vince Buffalo's .emacs.d directory

## Snippets 

My snippets are in `local-snippets`. Others' (from
[AndreaCrotti/yasnippet-snippets](https://github.com/AndreaCrotti/yasnippet-snippets))
are in `yasnippet-snippets`. These can be cloned with:

    $ git clone git@github.com:AndreaCrotti/yasnippet-snippets.git

Then run: 

1. `(yas-initialize)`
2. `M-x yas-reload-all`

## Terminal Colors

Set terminal colors for multi-term:

    wget https://raw.githubusercontent.com/tovbinm/emacs-24-mac/master/etc/e/eterm-color.ti
    tic -o ~/.terminfo eterm-color.ti

## Known Issues

- PolyMode has a
  [nasty conflict with evil-mode](https://github.com/vspinu/polymode/issues/41).
