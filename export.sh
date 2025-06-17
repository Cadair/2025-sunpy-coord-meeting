#!/bin/sh

progn="(progn
  (use-package ox-reveal
    :ensure t
    :vc t
    :load-path \"$(pwd)/src/emacs/org-reveal/\")
  (use-package htmlize
    :ensure t
    :vc t
    :load-path \"$(pwd)/src/emacs/emacs-htmlize/\")
  (require 'ox-reveal)
  (org-babel-do-load-languages 'org-babel-load-languages '((python . t)))
  (setq org-confirm-babel-evaluate nil)
  (org-reveal-export-to-html))"

# Define an array of multiple talks
talks=("roadmap.org" "dkist.org")

for index in "${talks[@]}"
do
    emacs --init-dir=./src/emacs --quick --batch --visit "$index" --eval "$progn" --kill
done
