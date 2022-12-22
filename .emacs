;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
      '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
 (package-refresh-contents))

(defvar myPackages
 '(better-defaults
   ein
   elpy
   flycheck
   material-theme
   py-autopep8
   markdown-mode))

(mapc #'(lambda (package)
   (unless (package-installed-p package)
     (package-install package)))
     myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(flycheck-python-flake8-executable "/usr/local/bin/flake8")
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (py-autopep8 material-theme markdown-mode flycheck elpy ein better-defaults)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 150)))))

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
 (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
 (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; MARKDOWN CONFIGURATION
;; --------------------------------------

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown file" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; init.el ends here
