(defun load-haskell-workgroups ()
  (interactive)
  (setq b (current-buffer))
  (message "%s" b)
  (wg-load "~/.emacs.d/workgroups/Haskell")
  (switch-to-buffer b))

(defun load-dynamic-workgroups ()
  (interactive)
  (setq b (current-buffer))
  (message "%s" b)
  (wg-load "~/.emacs.d/workgroups/Haskell")
  (wg-switch-to-index-1)
  (switch-to-buffer b))

(defun ido-find-file-pane-3 ()
  "Open file in panel 3"
  (interactive)
  (select-window-3)
  (ido-find-file))

(defun delete-trailing-whitespace-and-save ()
  "Deletes trailing whitespace and saves"
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

(defun zsh (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (shell)
  (rename-buffer (format "%s%s" "$" buffer-name) t))

(defun zsht (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (term "/bin/zsh")
  (rename-buffer (format "%s%s" "$" buffer-name) t))

(defun get-current-buffer-major-mode ()
  (interactive)
  (message "%s" major-mode))

(defun hoogle-search (query)
  "Search with hoogle commandline"
  (interactive "sHoogle query: ")
  (if (get-buffer "*Hoogle*")
      (kill-buffer "*Hoogle*"))
  ; get the version of hoogle so I don't have to manually adjust it for each update
  (shell-command (format "version=`hoogle --version | head -n 1 | awk '{print $2}' | cut -c 2- | rev | cut -c 2- | rev`;
                          data=\"/databases\";
                          two=$version$data;
                          hoogle \"%s\" --data=$HOME/.lazyVault/sandboxes/hoogle/cabal/share/hoogle-$two" query))
  (switch-to-buffer "*Shell Command Output*")
  (rename-buffer "*Hoogle*")
  (haskell-mode)
  (linum-mode 0)
  (previous-buffer)
)

(defun erlang-get-error ()
  (interactive)
  (shell-command (format "~/.emacs.d/scripts/erlangscript %s" buffer-file-name))
)


(defun elixir-keys-hook ()
  (local-set-key (kbd "C-c C-l") (lambda()
                                   (interactive)
                                   (elixir-mode-compile-file)
                                   (elixir-mode-iex)))
)

(defun run-haskell-test ()
  (interactive)
  (async-shell-command "~/.emacs.d/scripts/cabal-test")
)

(defun underscores-to-camel-case (str)
  "Converts STR, which is a word using underscores, to camel case."
  (interactive "S")
  (apply 'concat (mapcar 'capitalize (split-string str "_"))))



; cmus functions

(defun cmus-pause ()
  (interactive)
  (shell-command (format "cmus-remote --pause"))
)

(defun cmus-volume-down ()
  (interactive)
  (shell-command (format "cmus-remote --volume -10%"))
)

(defun cmus-volume-up ()
  (interactive)
  (shell-command (format "cmus-remote --volume +10%"))
)

(defun cmus-next ()
  (interactive)
  (shell-command (format "cmus-remote --next"))
)
(defun cmus-previous ()
  (interactive)
  (shell-command (format "cmus-remote --prev"))
)

(defun ca-with-comment (str)
  (format "%s%s%s" comment-start str comment-end))


; God functions

(defun god-mode-disable () (interactive)
  (setq god-local-mode nil)
  (if (getenv "TMUX")
    (send-string-to-terminal "\033Ptmux;\033\033]12;Green\007\033\\")
    (send-string-to-terminal "\033]12;Green\007")
  )
)

(defun god-mode-enable () (interactive)
  (setq god-local-mode t)
  (mc/keyboard-quit)
  (keyboard-escape-quit)
  (if (getenv "TMUX")
      (send-string-to-terminal "\033Ptmux;\033\033]12;White\007\033\\")
      (send-string-to-terminal "\033]12;White\007")
      )
)
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
        ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))



(provide 'my-functions)
