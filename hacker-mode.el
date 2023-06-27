;;; hacker-mode.el --- major mode for hacker!  -*- lexical-binding: t; -*-

(define-derived-mode metar-mode prog-mode "metar"
  (setq font-lock-defaults '((("^METAR" 0 font-lock-keyword-face)
                              (" [A-Z]\\{4\\} " 0 font-lock-function-name-face)))))
