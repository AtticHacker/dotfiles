(provide 'my-keys)

(define-key attic-lock-minor-mode-map (kbd "c f"  ) 'textmate-goto-file)
(define-key attic-lock-minor-mode-map (kbd "x f"  ) 'ido-find-file)
(define-key attic-lock-minor-mode-map (kbd "q"    ) 'backward-delete-char)
(define-key attic-lock-minor-mode-map (kbd "g"    ) 'attic-rock-lock)
(define-key attic-lock-minor-mode-map (kbd "x s"  ) 'save-and-lock)
(define-key attic-lock-minor-mode-map (kbd "c c"  ) 'comment-or-uncomment-region)
(define-key attic-lock-minor-mode-map (kbd "c o"  ) 'hoogle-search)
(define-key attic-lock-minor-mode-map (kbd "c t") 'transpose-paragraphs)
(define-prefix-command 'u-prefix)

(define-key attic-lock-minor-mode-map (kbd "u")       'u-prefix)
(define-key attic-lock-minor-mode-map (kbd "u <SPC>") 'pop-to-mark-command)
(define-key attic-lock-minor-mode-map (kbd "u n")     'iy-go-to-char )
(define-key attic-lock-minor-mode-map (kbd "u p")     'iy-go-to-char-backward)
(define-key attic-lock-minor-mode-map (kbd "u u")     'ace-jump-mode)
(define-key attic-lock-minor-mode-map (kbd "u h")     'ido-switch-buffer)
(define-key attic-lock-minor-mode-map (kbd "u o")     'org-agenda)
(define-key attic-lock-minor-mode-map (kbd "u c")     'org-cycle-agenda-files)
(define-key attic-lock-minor-mode-map (kbd "u w")     'load-haskell-workgroups)
(define-key attic-lock-minor-mode-map (kbd "u m")     'magit-status)

(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

; Customs

; Control hotkeys
(define-key attic-minor-mode-map (kbd "C-c C-f")	'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-x C-f")	'ido-find-file)
(define-key attic-minor-mode-map (kbd "C-q")		'backward-delete-char)
(define-key attic-minor-mode-map (kbd "M-q")		'backward-kill-word)
(define-key attic-minor-mode-map (kbd "C-c C-c")	'comment-or-uncomment-region)


(define-key attic-minor-mode-map (kbd "C-c C-o")        'hoogle-search)
; Alt hotkeys


(define-key attic-minor-mode-map (kbd "M-#")     'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "C-c C-f") 'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "M-<RET>") 'find-tag)
(define-key attic-minor-mode-map (kbd "M-x")     'execute-extended-command)
(define-key attic-minor-mode-map (kbd "M-+")	 'align-regexp)
(define-key attic-minor-mode-map (kbd "M-@")	 'er/expand-region)
(define-key attic-minor-mode-map (kbd "C-M-_")	 'redo)
(define-key attic-minor-mode-map (kbd "C-c C-t") 'transpose-paragraphs)
(define-key attic-minor-mode-map (kbd "M-t")	 'transpose-words)
(define-key attic-minor-mode-map (kbd "M-T")	 'ghc-insert-template)
(define-key attic-minor-mode-map (kbd "M-E")	 'mc/edit-lines)
(define-key attic-minor-mode-map (kbd "M-x")	 'smex)
(define-key attic-minor-mode-map (kbd "M-j")	 (lambda()
                                                   (interactive)
                                                   (join-line -1)))

; Globals
(define-prefix-command 'c-u-prefix)

(global-set-key (kbd "C-u")       'c-u-prefix)

(global-set-key (kbd "C-u C-a")	'ido-switch-buffer)
(global-set-key (kbd "C-u C-o")	'org-agenda)
(global-set-key (kbd "C-u C-c")	'org-cycle-agenda-files)
(global-set-key (kbd "C-u C-w")	'load-haskell-workgroups)
(global-set-key (kbd "C-u <RET>")	'magit-status)
(global-set-key (kbd "C-u C-h")	'ido-switch-buffer)
(global-set-key (kbd "C-u C-o")	'org-agenda)
(global-set-key (kbd "C-u C-c")	'org-cycle-agenda-files)


(global-set-key (kbd "M-P") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-N") 'mc/mark-next-like-this)
(global-set-key (kbd "M-*") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Define mode
(define-minor-mode attic-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic" 'attic-minor-mode-map)
(defun attic-minibuffer-setup-hook ()
	(attic-minor-mode 0))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
