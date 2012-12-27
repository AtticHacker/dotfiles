(defvar attic-lock-minor-mode-map (make-keymap) "attic-minor-mode keymap.")
(define-key attic-lock-minor-mode-map (kbd "f")		'forward-char)
(define-key attic-lock-minor-mode-map (kbd "b")		'backward-char)
(define-key attic-lock-minor-mode-map (kbd "p")		'previous-line)
(define-key attic-lock-minor-mode-map (kbd "n")		'next-line)


(define-key attic-lock-minor-mode-map (kbd "v")	    'cua-scroll-up)

(define-key attic-lock-minor-mode-map (kbd "o")     'newline-down)

(define-key attic-lock-minor-mode-map (kbd "SPC")   'cua-set-mark)

(define-key attic-lock-minor-mode-map (kbd "`")     'find-file)

(define-key attic-lock-minor-mode-map (kbd "h")     'switch-to-buffer)
(define-key attic-lock-minor-mode-map (kbd "g")     'goto-line)


(define-key attic-lock-minor-mode-map (kbd "e")     'move-end-of-line)
(define-key attic-lock-minor-mode-map (kbd "a")     'move-beginning-of-line)
(define-key attic-lock-minor-mode-map (kbd "s")     'isearch-forward)
(define-key attic-lock-minor-mode-map (kbd "r")     'isearch-backward)

(define-key attic-lock-minor-mode-map (kbd "x o")   'other-window)



(define-key attic-lock-minor-mode-map (kbd "w")     'other-window)

(define-key attic-lock-minor-mode-map (kbd "i")     'attic-lock-disable)

(define-key attic-lock-minor-mode-map (kbd "u")     'undo)
(define-key attic-lock-minor-mode-map (kbd "j")     'delete-backward-char)

(define-key attic-lock-minor-mode-map (kbd "y")     'copy-region-as-kill)
(define-key attic-lock-minor-mode-map (kbd "q")     'yank)
(define-key attic-lock-minor-mode-map (kbd "z")		'delete-char-and-insert)
(define-key attic-lock-minor-mode-map (kbd "m")     'newline)
(define-key attic-lock-minor-mode-map (kbd "-")     'comment-or-uncomment-region)

(define-key attic-lock-minor-mode-map (kbd "d")	    'delete-char)
(define-key attic-lock-minor-mode-map (kbd "c r")	'query-replace)
(define-key attic-lock-minor-mode-map (kbd "k")	    'kill-line)
(define-key attic-lock-minor-mode-map (kbd "D")     'delete-horizontal-space)

(define-key attic-lock-minor-mode-map (kbd "x s")   'attic-save)
(define-key attic-lock-minor-mode-map (kbd "x c")   'save-buffers-kill-terminal)

(define-key attic-lock-minor-mode-map (kbd "C-c C-l")  'haskell-ghci-load-file)


(define-minor-mode attic-lock-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " A-lock" 'attic-lock-minor-mode-map)
(defun attic-lock-minibuffer-setup-hook ()
	(attic-lock-minor-mode 0))
(provide 'attic-lock)
