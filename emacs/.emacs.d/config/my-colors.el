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
(set-face-foreground 'speedbar-directory-face   "cyan"	)
(set-face-foreground 'speedbar-file-face        "white")
(set-face-foreground 'font-lock-type-face       "#145e74")
(set-face-foreground 'font-lock-comment-face    "#707070")
(set-face-foreground 'font-lock-comment-delimiter-face    "#707070")
(set-face-foreground 'linum			"#707070")

(provide 'my-colors)
