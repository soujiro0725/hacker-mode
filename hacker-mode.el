;;; hacker-mode.el --- major mode for hacker!  -*- lexical-binding: t; -*-

(define-derived-mode metar-mode prog-mode "metar"
  (setq font-lock-defaults '((("^METAR" 0 font-lock-keyword-face)
                              (" [A-Z]\\{4\\} " 0 font-lock-function-name-face)))))

;; https://stackoverflow.com/a/1511827/5745120
(defun which-active-modes ()
  "Which minor modes are enabled in the current buffer."
  (let ((active-modes))
    (mapc (lambda (mode) (condition-case nil
                        (if (and (symbolp mode) (symbol-value mode))
                            (add-to-list 'active-modes mode))
                      (error nil) ))
          minor-mode-list)
    active-modes))

(defun pop-up-frames-switch-to-buffer (buffer alist)
  "Pop up frames switch to buffer command."
  (member 'pop-up-frames-mode (which-active-modes)))

(setq display-buffer-alist
      (append display-buffer-alist
      '((pop-up-frames-switch-to-buffer . ((display-buffer-reuse-window display-buffer-pop-up-frame) . ((reusable-frames . 0)))
))))

(define-minor-mode pop-up-frames-mode
  "Pop up frames minor mode"
  :lighter " PUF")

(provide 'pop-up-frames-mode)
