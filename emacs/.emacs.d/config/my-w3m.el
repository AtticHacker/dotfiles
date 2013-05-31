(defun w3m-open-in-new-tab ()
  (interactive)
  (w3m-copy-buffer)
  (w3m-view-this-url)
)

(defun web ()
  (interactive)
  (w3m)
  (define-key w3m-mode-map (kbd "n")   'w3m-next-anchor)
  (define-key w3m-mode-map (kbd "p")   'w3m-previous-anchor)
  (define-key w3m-mode-map (kbd "M-p")   'w3m-scroll-down)
  (define-key w3m-mode-map (kbd "f")   'w3m-tab-next-buffer)
  (define-key w3m-mode-map (kbd "b")   'w3m-tab-previous-buffer)
  (define-key w3m-mode-map (kbd "F")   'w3m-view-next-page)
  (define-key w3m-mode-map (kbd "B")   'w3m-view-previous-page)
  (define-key w3m-mode-map (kbd "M-m")   'w3m-open-in-new-tab)
  (set-face-background 'w3m-header-line-location-content "brightblack")
  (set-face-background 'w3m-header-line-location-title "brightblack")
)



(provide 'my-w3m)
