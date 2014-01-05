(provide 'my-keys)

(define-key attic-lock-minor-mode-map (kbd "J M-g g")   'undefined)
(define-key attic-lock-minor-mode-map (kbd "L M-g g")   'undefined)
(define-key attic-lock-minor-mode-map (kbd "J M-g M-g") 'undefined)
(define-key attic-lock-minor-mode-map (kbd "L M-g M-g") 'undefined)

(define-key attic-lock-minor-mode-map (kbd "x f") 'helm-find-files)
(define-key attic-lock-minor-mode-map (kbd "q"  ) 'backward-delete-char)
(define-key attic-lock-minor-mode-map (kbd "g"  ) 'goto-line)
(define-key attic-lock-minor-mode-map (kbd "z"  ) 'zap-to-char)
(define-key attic-lock-minor-mode-map (kbd "l"  ) 'forward-to-word)
(define-key attic-lock-minor-mode-map (kbd "h"  ) 'backward-to-word)
(define-key attic-lock-minor-mode-map (kbd "x s") 'save-and-lock)
(define-key attic-lock-minor-mode-map (kbd "c o") 'hoogle-search)
(define-key attic-lock-minor-mode-map (kbd "c t") 'transpose-paragraphs)
(define-key attic-lock-minor-mode-map (kbd "."  ) 'repeat)
(define-key attic-lock-minor-mode-map (kbd "u"  ) 'recenter-top-bottom)

(define-prefix-command 'j-prefix)

(define-key attic-lock-minor-mode-map (kbd "j")       'j-prefix)
(define-key attic-lock-minor-mode-map (kbd "j <SPC>") 'pop-to-mark-command)
(define-key attic-lock-minor-mode-map (kbd "j n")     'iy-go-to-char )
(define-key attic-lock-minor-mode-map (kbd "j p")     'iy-go-to-char-backward)
(define-key attic-lock-minor-mode-map (kbd "j j")     'helm-buffers-list)
(define-key attic-lock-minor-mode-map (kbd "j i")     'ace-jump-mode)
(define-key attic-lock-minor-mode-map (kbd "j o")     'hoogle-search)
(define-key attic-lock-minor-mode-map (kbd "j f")     'helm-ls-git-ls)
(define-key attic-lock-minor-mode-map (kbd "j c")     'comment-or-uncomment-region)
(define-key attic-lock-minor-mode-map (kbd "j v")     'org-cycle-agenda-files)
(define-key attic-lock-minor-mode-map (kbd "j m")     'magit-status)
(define-key attic-lock-minor-mode-map (kbd "j q")     'kmacro-start-macro)
(define-key attic-lock-minor-mode-map (kbd "j e")     'kmacro-end-or-call-macro-repeat)

(define-key attic-lock-minor-mode-map (kbd "j r") (key-binding (kbd "\C-xr")))
(define-key attic-lock-minor-mode-map (kbd "x k") 'kill-buffer)

(define-key attic-lock-minor-mode-map (kbd "j t")       'run-haskell-test)
;(define-key attic-lock-minor-mode-map (kbd "j s")       'flyspell-mode)

(define-key attic-lock-minor-mode-map (kbd "j w")     'load-haskell-workgroups)
(define-key attic-lock-minor-mode-map (kbd "j 1")     'wg-switch-to-index-0)
(define-key attic-lock-minor-mode-map (kbd "j 2")     'wg-switch-to-index-1)
(define-key attic-lock-minor-mode-map (kbd "j 3")     'wg-switch-to-index-2)
(define-key attic-lock-minor-mode-map (kbd "j 4")     'wg-switch-to-index-3)
(define-key attic-lock-minor-mode-map (kbd "j 5")     'wg-switch-to-index-4)
(define-key attic-lock-minor-mode-map (kbd "j 6")     'wg-switch-to-index-5)
(define-key attic-lock-minor-mode-map (kbd "j 7")     'wg-switch-to-index-6)
(define-key attic-lock-minor-mode-map (kbd "j 8")     'wg-switch-to-index-7)
(define-key attic-lock-minor-mode-map (kbd "j 9")     'wg-switch-to-index-8)
(define-key attic-lock-minor-mode-map (kbd "j 0")     'wg-switch-to-index-9)

(define-key attic-lock-minor-mode-map (kbd "j z z")     'cmus-pause)
(define-key attic-lock-minor-mode-map (kbd "j z -")     'cmus-volume-down)
(define-key attic-lock-minor-mode-map (kbd "j z =")     'cmus-volume-up)
(define-key attic-lock-minor-mode-map (kbd "j z n")     'cmus-next)
(define-key attic-lock-minor-mode-map (kbd "j z p")     'cmus-previous)

(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")

; Customs

; Control hotkeys
(define-key attic-minor-mode-map (kbd "C-x C-s") 'undefined)
(define-key attic-minor-mode-map (kbd "C-x C-f") 'helm-find-files)
(define-key attic-minor-mode-map (kbd "C-q") 'backward-delete-char)

; has to be global otherwise iy-go-to-char wont play nicely
(global-set-key (kbd "M-q")            'backward-kill-word)

(define-key attic-minor-mode-map (kbd "M-o")	 'er/expand-region)
(define-key attic-minor-mode-map (kbd "M-g") 'attic-rock-lock)
(define-key attic-minor-mode-map (kbd "M-#")     'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "M-<RET>") 'find-tag)
(define-key attic-minor-mode-map (kbd "M-x")     'execute-extended-command)
(define-key attic-minor-mode-map (kbd "M-+")	 'align-regexp)
(define-key attic-minor-mode-map (kbd "M-@")	 'er/expand-region)
(define-key attic-minor-mode-map (kbd "C-M-_")	 'redo)
(define-key attic-minor-mode-map (kbd "C-x M-t") 'transpose-paragraphs)
(define-key attic-minor-mode-map (kbd "M-t")	 'transpose-words)
(define-key attic-minor-mode-map (kbd "M-T")	 'ghc-insert-template)
(define-key attic-minor-mode-map (kbd "M-E")	 'mc/edit-lines)
(define-key attic-minor-mode-map (kbd "M-x")	 'smex)
(define-key attic-minor-mode-map (kbd "M-j")	 (lambda()
                                                   (interactive)
                                                   (join-line -1)))

(define-key attic-minor-mode-map (kbd "C-j C-r") (key-binding (kbd "\C-xr")))

; Globals
(define-prefix-command 'c-j-prefix)
(global-set-key (kbd "C-j")       'c-j-prefix)

(global-set-key (kbd "M-[")       'scroll-down-line)
(global-set-key (kbd "M-]")       'scroll-up-line)

(global-set-key (kbd "C-j C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-j C-o") 'hoogle-search)
(global-set-key (kbd "C-j C-f") 'textmate-goto-file)
(global-set-key (kbd "C-j C-j")   'helm-buffers-list)
(global-set-key (kbd "C-j C-o")   'org-agenda)
(global-set-key (kbd "C-j <RET>") 'magit-status)
(global-set-key (kbd "C-j C-i")   'ace-jump-mode)
(global-set-key (kbd "C-j C-o")   'org-agenda)
(global-set-key (kbd "C-j C-v")   'org-cycle-agenda-files)
(global-set-key (kbd "C-j C-w")     'load-haskell-workgroups)
(global-set-key (kbd "C-j C-<SPC>") 'pop-to-mark-command)
(global-set-key (kbd "C-j C-n")     'iy-go-to-char )
(global-set-key (kbd "C-j C-p")     'iy-go-to-char-backward)


(global-set-key (kbd "C-j 1")     'wg-switch-to-index-0)
(global-set-key (kbd "C-j 2")     'wg-switch-to-index-1)
(global-set-key (kbd "C-j 3")     'wg-switch-to-index-2)
(global-set-key (kbd "C-j 4")     'wg-switch-to-index-3)
(global-set-key (kbd "C-j 5")     'wg-switch-to-index-4)
(global-set-key (kbd "C-j 6")     'wg-switch-to-index-5)
(global-set-key (kbd "C-j 7")     'wg-switch-to-index-6)
(global-set-key (kbd "C-j 8")     'wg-switch-to-index-7)
(global-set-key (kbd "C-j 9")     'wg-switch-to-index-8)
(global-set-key (kbd "C-j 0")     'wg-switch-to-index-9)

(define-key attic-minor-mode-map (kbd "C-j C-c")   'comment-or-uncomment-region)
(define-key attic-minor-mode-map (kbd "C-j C-o")   'hoogle-search)
(define-key attic-minor-mode-map (kbd "C-j C-f")   'helm-ls-git-ls)
(define-key attic-minor-mode-map (kbd "C-j C-j")   'helm-buffers-list)
(define-key attic-minor-mode-map (kbd "C-j C-o")   'org-agenda)
(define-key attic-minor-mode-map (kbd "C-j <RET>") 'magit-status)
(define-key attic-minor-mode-map (kbd "C-j C-o")   'org-agenda)
(define-key attic-minor-mode-map (kbd "C-j C-v")   'org-cycle-agenda-files)
(define-key attic-minor-mode-map (kbd "C-j C-w")     'load-haskell-workgroups)
(define-key attic-minor-mode-map (kbd "C-j 1")     'wg-switch-to-index-0)
(define-key attic-minor-mode-map (kbd "C-j 2")     'wg-switch-to-index-1)
(define-key attic-minor-mode-map (kbd "C-j 3")     'wg-switch-to-index-2)
(define-key attic-minor-mode-map (kbd "C-j 4")     'wg-switch-to-index-3)
(define-key attic-minor-mode-map (kbd "C-j 5")     'wg-switch-to-index-4)
(define-key attic-minor-mode-map (kbd "C-j 6")     'wg-switch-to-index-5)
(define-key attic-minor-mode-map (kbd "C-j 7")     'wg-switch-to-index-6)
(define-key attic-minor-mode-map (kbd "C-j 8")     'wg-switch-to-index-7)
(define-key attic-minor-mode-map (kbd "C-j 9")     'wg-switch-to-index-8)
(define-key attic-minor-mode-map (kbd "C-j 0")     'wg-switch-to-index-9)


(global-set-key (kbd "M-P") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-N") 'mc/mark-next-like-this)
(global-set-key (kbd "M-*") 'mc/mark-all-like-this)
(global-set-key (kbd "C-g") 'undefined)


; JS Keys
(defun erlang-keys-hook ()
  (local-set-key (kbd "M-?") 'erlang-get-error)
  (local-set-key (kbd "M-n") 'flymake-goto-next-error)
  (local-set-key (kbd "M-p") 'flymake-goto-prev-error)
  (local-set-key (kbd "M-q") 'backward-kill-word)
)


(defun js2-keys-hook ()
  (define-key js2-mode-map (kbd "M-n") 'js2-next-error)
  (define-key js2-mode-map (kbd "M-p") 'js2-previous-error)
  (define-key js2-mode-map (kbd "M-?") 'js2-display-error-list)

  (define-key attic-lock-minor-mode-map (kbd "j s s") 'slime-eval-buffer)
  (define-key attic-lock-minor-mode-map (kbd "j s r") 'slime-eval-region)
  (define-key attic-lock-minor-mode-map (kbd "j s c") 'slime-connect)
  (define-key attic-lock-minor-mode-map (kbd "j s d") 'slime-disconnect)
  (define-key attic-lock-minor-mode-map (kbd "j s e") 'slime-js-select-remote)

  (define-key js2-mode-map (kbd "C-j C-h C-h") 'hs-toggle-hiding)
  (define-key js2-mode-map (kbd "C-j C-h C-a") 'hs-hide-all)
  (define-key js2-mode-map (kbd "C-j C-h C-s") 'hs-show-all)

  (define-key attic-lock-minor-mode-map (kbd "j h h") 'hs-toggle-hiding)
  (define-key attic-lock-minor-mode-map (kbd "j h a") 'hs-hide-all)
  (define-key attic-lock-minor-mode-map (kbd "j h s") 'hs-show-all)
)

(defun erlang-keys-hook ()
  (local-set-key (kbd "M-?") 'erlang-get-error)
  (local-set-key (kbd "M-n") 'flymake-goto-next-error)
  (local-set-key (kbd "M-p") 'flymake-goto-prev-error)
  (local-set-key (kbd "M-q") 'backward-kill-word)
)

; Helm keys
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "M-f") 'helm-select-action)
(define-key helm-map (kbd "M-s") 'helm-select-action)
(define-key helm-map (kbd "M-b") 'undefined)
(define-key helm-map (kbd "C-f") 'undefined)
(define-key helm-map (kbd "C-b") 'undefined)
(define-key helm-map (kbd "M-g") 'helm-exit-minibuffer)

; Define mode
(define-minor-mode attic-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic" 'attic-minor-mode-map)
(defun attic-minibuffer-setup-hook ()
	(attic-minor-mode 0))
