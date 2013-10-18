
(defun raw-modes ()
  (set (make-local-variable 'linum-mode) nil)
  (set (make-local-variable 'attic-lock-minor-mode) nil)
  (set (make-local-variable 'attic-locker-minor-mode) nil))

(add-hook 'inferior-haskell-mode-hook 'raw-modes)
(add-hook 'comint-mode-hook           'raw-modes)
(add-hook 'term-mode-hook             'raw-modes)
(add-hook 'speedbar-mode-hook         'raw-modes)
(add-hook 'shell-mode-hook            'raw-modes)
(add-hook 'magit-mode-hook            'raw-modes)
(add-hook 'shell-command-mode-hook    'raw-modes)
;(add-hook 'lisp-interaction-mode-hook 'raw-modes)
(add-hook 'fundamental-mode-hook      'raw-modes)
(add-hook 'dired-mode-hook            'raw-modes)
(add-hook 'gnus-group-mode-hook       'raw-modes)
(add-hook 'gnus-article-mode-hook     'raw-modes)
(add-hook 'gnus-summary-mode-hook     'raw-modes)
(add-hook 'garak-mode-hook            'raw-modes)
(add-hook 'w3m-mode-hook              'raw-modes)
(add-hook 'minibuffer-setup-hook      'raw-modes)


(add-hook 'minibuffer-setup-hook 'attic-lock-minibuffer-setup-hook)
(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'erlang-mode-hook  'flymake-mode)
;(add-hook 'erlang-mode-hook  'wrap-region-mode)
(add-hook 'erlang-mode-hook  'erlang-keys-hook)

(add-hook 'elixir-mode-hook  'elixir-keys-hook)
;(add-hook 'elixir-mode-hook  'wrap-region-mode)



(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
          (local-file (file-relative-name temp-file
                                          (file-name-directory buffer-file-name))))
    (list "~/.emacs.d/plugins/erlangscript" (list local-file))))
(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))

(add-hook 'dired-mode-hook 'ensure-buffer-name-begins-with-exl)
(defun ensure-buffer-name-begins-with-exl ()
    "change buffer name to end with slash"
    (let ((name (buffer-name)))
        (if (not (string-match "/$" name))
            (rename-buffer (concat "!" name) t))))


(provide 'my-hooks)
