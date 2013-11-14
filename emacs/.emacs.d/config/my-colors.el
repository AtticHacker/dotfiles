;(color-theme-midnight)
(load-theme 'zenburn t)



; Some custom colors
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

(set-face-foreground 'flymake-errline		"red"	)
(set-face-foreground 'flymake-warnline		"yellow")
(set-face-foreground 'flyspell-incorrect        "red")
;(set-face-foreground 'font-lock-string-face	"orange")
;(set-face-background 'region			"blue"	)
;(set-face-foreground 'region			"black"	)
;(set-face-foreground 'isearch			"white"	)
;(set-face-background 'linum			"black"	)
;(set-face-foreground 'comint-highlight-prompt	"white"	)
;(set-face-background 'magit-section-title	"black"	)
;(set-face-background 'magit-branch		"black"	)
;(set-face-foreground 'magit-section-title	"white"	)
;(set-face-foreground 'magit-branch		"white"	)
;(set-face-foreground 'mc/cursor-face		"white"	)
;(set-face-background 'mc/cursor-face		"black"	)
;(set-face-foreground 'magit-diff-file-header	"black"	)
;(set-face-background 'magit-section-title	"black"	)
;(set-face-background 'magit-branch		"black"	)
;(set-face-background 'mc/cursor-face		"black"	)
(set-face-foreground 'speedbar-directory-face   "blue"	)
(set-face-foreground 'font-lock-type-face       "#145e74")
(set-face-foreground 'font-lock-comment-face    "#707070")
(set-face-foreground 'font-lock-comment-delimiter-face    "#707070")
(set-face-foreground 'linum			"#707070")

(provide 'my-colors)
