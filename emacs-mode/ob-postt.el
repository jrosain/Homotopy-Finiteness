;;; ob-template.el --- org-babel functions for template evaluation

;; Copyright (C) Johann Rosain

;; Author: Johann Rosain
;; Keywords: literate programming, reproducible research
;; Homepage: https://orgmode.org
;; Version: 0.01

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Requirements:

;; Have postt installed, see
;;    https://github.com/JonasHoefer/poset-type-theory/

(require 'ob)
(require 'ob-ref)
(require 'ob-comint)
(require 'ob-eval)

;; Dont' answer "yes" when evaluating
(setq org-confirm-babel-evaluate nil)

;; define a file extension for this language
(add-to-list 'org-babel-tangle-lang-exts '("ctt"))

;; optionally declare default header arguments for this language
(defvar org-babel-default-header-args:postt '())

(defcustom org-babel-postt-interpreter "postt"
  "Name of the postt interpreter."
  :group 'org-babel
  :type 'string)

;; This is a bit of a weird block execution function. Indeed, it is not a block but the whole source
;; file that is dumped in /tmp/ and evaluated. It could be avoided using session and repl I guess
;; but we might want to do this because of imports.
(defun org-babel-execute:postt (body params)
  "Execute a block of Postt code with org-babel.
This function is called by `org-babel-execute-src-block'"
  (message "executing Postt source code block")
  (let* ((src-file (let ((file (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))))
		     (concat "/tmp/" file ".ctt"))))
    (org-babel-tangle :target-file src-file)
    (org-babel-eval
     (concat org-babel-postt-interpreter " eval " src-file) "")))

;; This function should be used to assign any variables in params in
;; the context of the session environment.
(defun org-babel-prep-session:postt (session params)
  "Prepare SESSION according to the header arguments specified in PARAMS."
  )

(provide 'ob-postt)
;;; ob-postt.el ends here
