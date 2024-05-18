;; Very light major mode to do some syntax coloring, but nothing too fancy.

;; Add the following code to prettify the symbols used in postt:
;; (add-hook 'org-mode-hook 
;;           (lambda ()
;;             "Beautify Org Checkbox Symbol"
;;             (push '("->" . "→") prettify-symbols-alist)
;;             (push '("\\ " . "λ") prettify-symbols-alist)
;;             (prettify-symbols-mode)))

(setq postt-keywords '("module" "where" "import" "data"))
(setq postt-types '("U" "Path" "Ext"))
(setq postt-functions '("coe" "hcomp"))

(setq postt-fontlock
      (let (pkeywords-regex ptypes-regex pfunctions-regex)
	(setq pkeywords-regex (regexp-opt postt-keywords 'words))
	(setq ptypes-regex (regexp-opt postt-types 'words))
	(setq pfunctions-regex (regexp-opt postt-functions 'words))

	(list (cons pkeywords-regex 'font-lock-keyword-face)
	      (cons ptypes-regex 'font-lock-type-face)
	      (cons pfunctions-regex 'font-lock-function-name-face))))
	
(define-derived-mode postt-mode fundamental-mode "postt mode"
  "Major mode for editing postt Language"
  (setq font-lock-defaults '((postt-fontlock))))

(add-to-list 'auto-mode-alist '("\\.ctt" . postt-mode))

(provide 'postt-mode)
