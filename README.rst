Install
=======

* Put ob-diagrams.el somewhere on your load-path
* Add ``(require 'ob-diagrams)`` to your .emacs.el
* At the command-line, run ``cabal install diagrams-builder``

Examples
=====
Enter the following into an org-mode file:

 ::

   #+BEGIN_SRC diagrams :file circle.svg :width 400
   dia = circle 1 # fc cyan
   #+END_SRC

With point inside the source block, type ``C-c C-v e`` (or ``M-x org-babel-execute-maybe``).  The result should look like this:

 ::

    #+RESULTS:
    [[file:circle.svg]]

Except that org-mode will remove the square brackets and linkify the file link.  Put point over the link and type ``C-c C-o`` (or ``M-x org-open-at-point``). to see the image.  Or use ``M-x org-display-inline-images`` to see the result inline, in place of the link.

For each source block, a filename must be specified.  diagrams-builder-cairo takes the file format from the file extension.  diagrams-builder-cairo will render whatever is specified as dia in each block.  org-babel-diagrams defaults to width 300 if it is not specified at the start of the source block.

Configuration
=============
If you do not have ``diagrams-builder-cairo`` installed on your path, customize ``org-diagrams-executable``.

Contributing
============
Holler if you use this code, and want particular features.  Of course, patches and pull requests are always welcome.
