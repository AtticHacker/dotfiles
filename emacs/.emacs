; Require plugins

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.13/emacs")
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))
(let ((default-directory
    "~/.lazyVault/sandboxes/ghc-mod/cabal/share/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar mp-rad-packages
  '(
    redo+
    jump-char
    ace-jump-mode
    auto-complete
    coffee-mode
    dash
    elixir-mode
    git-gutter
    expand-region
    gnus
    god-mode
    haskell-mode
    helm
    helm-ls-git
    helm-swoop
    js2-mode
    linum-relative
    magit
    multiple-cursors
    rainbow-delimiters
    slime
    smex
    sr-speedbar
    undo-tree
    window-numbering
    workgroups
    wrap-region
    yasnippet
    zencoding-mode
    git-commit-mode
    git-rebase-mode
    gitconfig-mode
    gitignore-mode
    emms
    ))

(defun mp-install-rad-packages ()
  "Install only the sweetest of packages."
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        mp-rad-packages))

(require 'elim)
(require 'garak)
(require 'undo-tree)
(require 'redo+)
(require 'linum-relative)
(require 'git-gutter)
(require 'god-mode)
(require 'zencoding-mode)
(require 'dash)
(require 'helm)
(require 'helm-ls-git)
(require 'helm-swoop)
(require 'auto-complete)
(require 'misc)
(require 'org-install)
(require 'haskell-mode-autoloads)
(require 'yasnippet)
(require 'sr-speedbar)
(require 'window-numbering)
(require 'flymake)
(require 'magit)
(require 'expand-region)
(require 'ace-jump-mode)
(require 'multiple-cursors)
(require 'rainbow-delimiters)
(require 'wrap-region)
(require 'workgroups)
(require 'smex)
(require 'epa-file)
(require 'gnus)
(require 'erlang-start)
(require 'elixir-mode)
(require 'coffee-mode)
(require 'slime)
(require 'js2-mode)
(require 'emms-setup)
(require 'jump-char)
(emms-standard)
(emms-default-players)


(setq elim-executable "/usr/bin/elim-client")
(slime-setup '(slime-js slime-repl))
(setq slime-js-swank-command "/usr/local/bin/swank-js")
(setq slime-js-swank-args '())

(epa-file-enable)

(add-to-list 'load-path "/usr/pbi/emacs-i386/share/emacs/site-lisp/w3m")
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
;(require 'w3m-load)

;personal Config
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/config/other")
(require 'my-functions)
(require 'my-hooks)
(require 'my-modes)
(require 'my-colors)
(require 'my-w3m)
(require 'my-keys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist
      (cons '(".tpl" . html-mode    )
      (cons '(".elm" . haskell-mode )
      (cons '(".js" . js2-mode )
      (cons '(".splash" . (lambda()
        (lisp-interaction-mode)
        (read-only-mode)
        (set (make-local-variable 'linum-mode) nil)
        ))

auto-mode-alist)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.0)
 '(ansi-color-names-vector ["#111111" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(auth-source-save-behavior nil)
 '(coffee-tab-width 4)
 '(custom-safe-themes (quote ("0a1eb1fb7c716c0eced08572fa5477e6cf80d145167590ab5a00697678b14c30" "dc3d6a554b626775e02c17da54e7b7f9378ccfd3cbadab62397f8a6ddf33490f" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "eecdec02a43c2dfdf388d7d27cb00af310b350d4ea6f923ebc82197d348cf383" default)))
 '(dirtree-windata (quote (frame left 0.15 delete)))
 '(fci-rule-color "#383838")
 '(global-hl-line-mode t)
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-where-post-offset 4)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-haskell-doc-mode auto-complete-mode wrap-region-mode imenu-add-menubar-index)))
 '(helm-always-two-windows nil)
 '(helm-full-frame nil)
 '(helm-grep-default-recurse-command "grep --exclude-dir=\"dist\" -a -d recurse %e -n%cH -e %p %f")
 '(helm-reuse-last-window-split-state nil)
 '(helm-split-window-default-side (quote below))
 '(helm-split-window-in-side-p t)
 '(ido-separator "
           ")
 '(initial-buffer-choice "~/.emacs.d/splash/doge.splash")
 '(js2-strict-missing-semi-warning nil)
 '(linum-format (quote "%2d"))
 '(linum-relative-format "%2s")
 '(scroll-error-top-bottom t)
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(vc-follow-symlinks t))
 '(erlang-mode-hook (quote (wrap-region-mode)))

; Settings
(setq-default indent-tabs-mode nil)
;; Don't create ~ files
(setq make-backup-files nil)
(setq org-agenda-files
      (list "~/Documents/org/notes.org"
            "~/Documents/org/todos.org"
            "~/Documents/org/LazyCasts.org"
            ))

; Unset C-z
(dolist (key '("\C-z"))
  (global-unset-key key))

(ido-mode 'both) ;; for buffers and files
(setq
  ido-ignore-buffers
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
    "^\*compilation" "^\*GTAGS" "^session\.*" ".newsrc-dribble"
    "^\*scr" "^\*" "notes.org" "todos.org" "*.hi" "*.o" "^\!")
  ido-case-fold  t				; be case-insensitive
  ido-enable-last-directory-history nil		; don't remember last used dirs
  ido-max-work-directory-list 30		; should be enough
  ido-max-work-file-list      50		; remember many
  ido-use-filename-at-point nil			; don't use filename at point (annoying)
  ido-use-url-at-point nil			; don't use url at point (annoying)
  ido-enable-flex-matching t
  ido-max-prospects 25
  ido-confirm-unique-completion t)		; wait for RET, even with unique completion
 (setq confirm-nonexistent-file-or-buffer nil)	; no confirmation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Commands to start with
(sr-speedbar-window-dedicated-only-one-p)
(sr-speedbar-open)
(sr-speedbar-close)
(setenv (concat "GPG_AGENT_INFO" nil))

(when (file-executable-p "/usr/bin/gpg1") (setq epg-gpg-program "/usr/bin/gpg1"))


(wg-load "~/.emacs.d/workgroups/Haskell")
(setq wg-morph-on nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Haskell flymake
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(helm-ff-directory ((t (:background "color-233" :foreground "color-251"))))
 '(hl-line ((t (:inherit highlight :background "color-234"))))
 '(linum-relative-current-face ((t (:inherit linum :background "color-234" :foreground "#707070" :weight bold)))))

(setq linum-format 'linum-relative)
