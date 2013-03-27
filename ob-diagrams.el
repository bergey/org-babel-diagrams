;;; ob-gnuplot.el --- org-babel functions for diagrams evaluation

;; Copyright (C) 2013 Daniel Bergey

;; Author: Daniel Bergey
;; Keywords: literate programming, reproducible research
;; Homepage: http://orgmode.org

;; This file is NOT part of GNU Emacs.

;;; Commentary:

;; Org-Babel support for evaluating diagrams source code.
;;
;; This differs from most standard languages in that
;;
;; 1) we are generally only going to return results of type "file"
;;
;; 2) we are adding the "file" and "cmdline" header arguments

;;; Requirements:

;; - diagrams          :: http://projects.haskell.org/diagrams/
;; - diagrams-builder  :: http://hackage.haskell.org/package/diagrams-builder

;;; Code:
(require 'ob)

(defvar org-babel-default-header-args:diagrams
  '((:results . "file")
    (:exports . "results"))
  "Default arguments for evaluating a ditaa source block.")

(defvar org-diagrams-executable "diagrams-builder-cairo")

(defun org-babel-execute:diagrams (body params)
  (let ((out-file (cdr (assoc :file params)))
        (result-type (cdr (assoc :results params))))
    (save-window-excursion
      (let ((script-file (org-babel-temp-file "diagrams-input")))
        (with-temp-file script-file (insert body))
        (message "%s \"%s\"" org-diagrams-executable script-file)
        (setq output
                  (shell-command-to-string
                   (format
                    "%s \"%s\" -o\"%s\" -w300"
                    org-diagrams-executable
                    (org-babel-process-file-name
                     script-file
                     (if (member system-type '(cygwin windows-nt ms-dos))
                         t nil))
                    out-file)))
        (message output)
        nil
        ))))

(provide 'ob-diagrams)
