(ido-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode 1)
(auto-complete-mode 1)
(multiple-cursors-mode 1)
(put 'downcase-region 'disabled nil)
(modify-frame-parameters nil '((wait-for-wm . nil)))
(global-rainbow-delimiters-mode)
(workgroups-mode 1)
(show-paren-mode t)
(electric-pair-mode 1)
(setq org-log-done t)
(epa-file-enable)
(window-numbering-mode 1)
(yas-global-mode 1)
(custom-set-variables '(linum-format (quote "%3d")))
(god-mode)
(undo-tree-mode 1)
(define-globalized-minor-mode my-global-auto-complete-mode auto-complete-mode
  (lambda () (auto-complete-mode 1))
  (lambda () (wrap-region-mode 1))
)

(my-global-auto-complete-mode 1)


(define-globalized-minor-mode my-global-wrap-region-mode wrap-region-mode
  (lambda () (wrap-region-mode 1))
)

(my-global-wrap-region-mode 1)



(provide 'my-modes)
