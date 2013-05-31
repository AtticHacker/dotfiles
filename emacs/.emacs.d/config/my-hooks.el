
(defun raw-modes ()
  (set (make-local-variable 'linum-mode) nil)
  (set (make-local-variable 'attic-lock-minor-mode) nil)
  (set (make-local-variable 'attic-locker-minor-mode) nil))

(add-hook 'inferior-haskell-mode-hook 'raw-modes)
(add-hook 'term-mode-hook             'raw-modes)
(add-hook 'speedbar-mode-hook         'raw-modes)
(add-hook 'shell-mode-hook            'raw-modes)
(add-hook 'magit-mode-hook            'raw-modes)
(add-hook 'shell-command-mode-hook    'raw-modes)
(add-hook 'lisp-interaction-mode-hook 'raw-modes)
(add-hook 'fundamental-mode-hook      'raw-modes)
(add-hook 'dired-mode-hook            'raw-modes)
(add-hook 'gnus-group-mode-hook            'raw-modes)
(add-hook 'gnus-article-mode-hook            'raw-modes)
(add-hook 'gnus-summary-mode-hook            'raw-modes)


(add-hook 'minibuffer-setup-hook 'attic-lock-minibuffer-setup-hook)
(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


(provide 'my-hooks)
