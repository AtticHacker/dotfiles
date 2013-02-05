; Require plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/haskell-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/erc")
(add-to-list 'load-path "~/.ghc-mod/share/ghc-mod-1.11.3")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/ghc")
(add-to-list 'load-path "~/.emacs.d/plugins/gnus/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/magit")
(add-to-list 'load-path "~/.emacs.d/plugins/expand-region")
(add-to-list 'load-path "~/.emacs.d/plugins/mark-multiple")
(add-to-list 'load-path "~/.emacs.d/plugins/multiple-cursors")
(add-to-list 'load-path "~/.emacs.d/plugins/wrap-region")

(require 'color-theme)
(require 'redo+)
(require 'dirtree)
(require 'textmate)
(require 'ido)
(require 'auto-complete)
(require 'misc)
(require 'org-install)
(require 'haskell-mode)
(require 'haskell-ghci)
(require 'erc)
(require 'yasnippet)
(require 'sr-speedbar)
(require 'window-numbering)
(require 'epa-file)
(require 'inf-haskell)
(require 'flymake)
(require 'org-install)
(require 'magit)
(require 'iy-go-to-char)
(require 'key-chord)
(require 'expand-region)
(require 'ace-jump-mode)
(require 'mark-multiple)
(require 'inline-string-rectangle)
(require 'mark-more-like-this)
(require 'multiple-cursors)
(require 'rainbow-delimiters)
(require 'wrap-region)
(require 'workgroups)

; Mark Multiple

(global-set-key (kbd "M-P") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-N") 'mc/mark-next-like-this)
(global-set-key (kbd "M-*") 'mc/mark-all-like-this)

;; (add-hook 'sgml-mode-hook
;;          (lambda ()
;;            (require 'rename-sgml-tag)
;;            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))


(setq org-log-done t)
(epa-file-enable)
(window-numbering-mode 1)
(ido-mode 1)
(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(dirtree-windata (quote (frame left 0.15 delete)))
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-haskell-doc-mode auto-complete-mode wrap-region-mode imenu-add-menubar-index)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587)
 '(speedbar-default-position (quote left))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50)))
 '(vc-follow-symlinks t))

;; SETTINGS


(setq org-agenda-files 
      (list "~/org/notes.org"
            "~/org/todos.org"))


(add-hook 'inferior-haskell-ghci-mode-hook
          '(lambda() 
             (set (make-local-variable 'linum-mode) nil)
             ))

(add-hook 'haskell-ghci-mode-hook 
          '(lambda() 
             (set (make-local-variable 'linum-mode) nil)
             ))

(add-hook 'term-mode-hook
	  '(lambda() 
	     (set (make-local-variable 'linum-mode) nil)
	     ))
(add-hook 'speedbar-mode-hook
          '(lambda()
             (set (make-local-variable 'linum-mode) nil)
             ))
(add-hook 'shell-mode-hook
          '(lambda()
             (set (make-local-variable 'linum-mode) nil)
             ))

(add-hook 'magit-mode-hook
          '(lambda()
             (set (make-local-variable 'linum-mode) nil)
             ))


(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq cua-enable-cua-keys nil)
(customize-variable (quote tab-stop-list))

;; Don't create ~ files
(setq make-backup-files nil)

;; Follows file links without asking

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(mapc  
 (lambda (face)    
   (set-face-attribute face nil :weight 'bold))
 (face-list))

;; A few modes and such

(dolist (key '("\C-z"))
  (global-unset-key key))

;; KEY BINDINGS
(defvar attic-minor-mode-map (make-keymap) "attic-minor-mode keymap.")
(defvar hakyll-minor-mode-map (make-keymap) "hakyll-minor-mode keymap.")

(define-key attic-minor-mode-map (kbd "M-C-SPC")    'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "M-#")      'cua-set-rectangle-mark)
(define-key attic-minor-mode-map (kbd "C-c C-f")    'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-x C-a C-a")    'ido-switch-buffer)
(define-key attic-minor-mode-map (kbd "C-x C-a C-o")    'org-agenda)
(define-key attic-minor-mode-map (kbd "C-x C-a C-c")    'org-cycle-agenda-files)
(define-key attic-minor-mode-map (kbd "C-x C-a <RET>")    'magit-status)

; For term
(define-key attic-minor-mode-map (kbd "C-x C-f") 'ido-find-file)
(define-key attic-minor-mode-map (kbd "C-x C-f") 'ido-find-file)
(define-key attic-minor-mode-map (kbd "C-`")     'find-file)
;(define-key attic-minor-mode-map (kbd "M-x")    'execute-extended-command)
(define-key attic-minor-mode-map (kbd "M-`")     'textmate-goto-file)
(define-key attic-minor-mode-map (kbd "C-M-g")   'goto-line)
(define-key attic-minor-mode-map (kbd "M-<RET>") 'find-tag)

(define-key attic-minor-mode-map (kbd "M-S")     'ace-jump-mode)
(define-key attic-minor-mode-map (kbd "M-s")     'iy-go-to-char)
(define-key attic-minor-mode-map (kbd "C-M-s")   'iy-go-to-char-backward)

(define-key ac-completing-map "\C-m" nil)

(define-key attic-minor-mode-map (kbd "M-q")      'ace-jump-mode)

; Editing

(define-key attic-minor-mode-map (kbd "M-_")    'comment-or-uncomment-region)
(define-key attic-minor-mode-map (kbd "M-+")    'align-regexp)
(define-key attic-minor-mode-map (kbd "C-q")    'cua-paste)
(define-key attic-minor-mode-map (kbd "C-M-q")  'cua-paste-pop)

;;(define-key attic-minor-mode-map (kbd "M-?") 'help-command)
(define-key attic-minor-mode-map (kbd "C-h") 'delete-backward-char)
(define-key attic-minor-mode-map (kbd "M-@") 'er/expand-region)
(define-key attic-minor-mode-map (kbd "C-M-_") 'redo)

(define-key attic-minor-mode-map (kbd "M-t") 'transpose-words)
(define-key attic-minor-mode-map (kbd "M-T") 'ghc-insert-template)


(define-key attic-minor-mode-map (kbd "M-E") 'mc/edit-lines)

;(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-ghci-load-file)

(define-key hakyll-minor-mode-map (kbd "C-c C-s") 'hakyll-build-server)
(define-key attic-minor-mode-map  (kbd "C-x C-a C-w") 'load-haskell-workgroups)

(defun set-server(name)
  (interactive
;   (list (read-string "Site bin file: " "/home/kevin/Programming/Haskell/hakyll/" )));(format "%s" default-directory)))) ;(format "%s" default-directory)))
   (list(read-file-name "Site bin file: ")))
  (setq serverBinFile name)
)

;; (defun buffer-file-name-body ()
;;   (interactive
;;    (list(file-name-nondirectory "DA DAFT")))
;; )

(defun load-haskell-workgroups ()
  (interactive)
  (wg-load "~/.emacs.d/workgroups/Haskell")
  (select-window-3)
  (previous-buffer)
)

(defun hakyll-build-server()
  "Build and restart server"
  (interactive)
  (setq newVar (substring serverBinFile 0 0))
  (shell-command 
    (format "id=`ps aux | grep '%s server' | 
             grep -v grep | awk '{print $2}'`; 
             kill -9 $id;" newVar))
  (sleep-for 1)
  (dired (format "%s" serverBinFile))
  (async-shell-command 
    (format "loc=%s;
             $loc build;
             $loc server;" serverBinFile))
  (previous-buffer)
  (save-buffer)
)

(defun zsht (buffer-name)
  "Start a terminal and rename buffer."  
  (interactive "sbuffer name: ")
  (term "/bin/zsh")
  (rename-buffer (format "%s%s" "$" buffer-name) t))

(defun zsh (buffer-name)
  "Start a terminal and rename buffer."  
  (interactive "sbuffer name: ")
  (shell)
  (rename-buffer (format "%s%s" "$" buffer-name) t))

(ido-mode 'both) ;; for buffers and files
(setq 
  ;ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
    "^\*compilation" "^\*GTAGS" "^session\.*" ".newsrc-dribble"
    "^\*scr" "^\*" "notes.org" "todos.org" "*.hi" "*.o")
  ;ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive

  ido-enable-last-directory-history nil ; don't remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ido-enable-flex-matching t       ; YES BE SMART HOLY SHIT! --don't try to be too smart
  ido-max-prospects 15              ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
 (setq confirm-nonexistent-file-or-buffer nil)

;; ENABLE / DISABLE MODES AT STARTUP

(define-minor-mode attic-minor-mode
"A minor mode so that my key settings override annoying major modes."

t " attic" 'attic-minor-mode-map)
(defun attic-minibuffer-setup-hook ()
	(attic-minor-mode 0))


(define-minor-mode hakyll-minor-mode
"A minor mode to make hakyll feel more sexy?"

t " hakyll" 'hakyll-minor-mode-map)
(defun hakyll-minibuffer-setup-hook ()
	(hakyll-minor-mode 0))


(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(cua-mode t)
(global-auto-complete-mode 1)
(key-chord-mode 1)
(multiple-cursors-mode 1)
(color-theme-midnight)
(put 'downcase-region 'disabled nil)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(global-rainbow-delimiters-mode)
(workgroups-mode 1)

(zsh "term")
(sr-speedbar-open)
(wg-load "~/.emacs.d/workgroups/Haskell")

;haskell mode configuration
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
                ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)

;adding the following lines according to which modules you want to use:


(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
(put 'upcase-region 'disabled nil)


(set-face-foreground 'flymake-errline "white")
(set-face-background 'flymake-errline "red")
(set-face-background 'flymake-warnline "yellow")
(set-face-foreground 'flymake-warnline "white")

(set-face-foreground 'font-lock-string-face "orange")
(set-face-background 'region "blue")
(set-face-foreground 'region "black")
(set-face-foreground 'isearch "white")
(set-face-foreground 'linum "black")
(set-face-background 'linum "gray")

(set-face-foreground 'comint-highlight-prompt "white")
(set-face-background 'magit-section-title "black")
(set-face-background 'magit-branch "black")
(set-face-foreground 'magit-section-title "white")
(set-face-foreground 'magit-branch "white")

(set-face-foreground 'mc/cursor-face "white")
(set-face-background 'mc/cursor-face "black")

(set-face-foreground 'magit-diff-file-header "black")
(put 'set-goal-column 'disabled nil)

