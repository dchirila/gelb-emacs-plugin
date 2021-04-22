;;; gelb-mode.el --- major mode for editing GeLB files
;;; -*- coding: utf-8; lexical-binding: t; -*--

;; Copyright ©2021, Dragos Bogdan Chirila

;; Author: Dragos Bogdan Chirila (dchirila (at) gmail (dot) com)
;; Version: pre-release
;; Last modified: 22 April, 2021
;; Homepage: gelb.site
;; License: You can redistribute this file and/or modify it under the terms of
;;          the MIT license.
;; Disclaimer: This file is not part of GNU Emacs.
;;
;; Installation (for users of the spacemacs Emacs distribution):
;; 1. Save the file `gelb-mode.el` somewhere in your home folder; note
;;    `your_chosen_directory`, because you will need it later.
;;
;; 2. open your `~/.spacemacs` file
;;
;; 3. inside the `dotspacemacs/user-config` function, add the following lines:
;;
;;    ;; add =gelb-mode.el= (for the GeLB DSL) to load-path
;;    (add-to-list 'load-path (expand-file-name "your_chosen_directory"))
;;    (load "gelb-mode")
;;
;;    where you need to replace `your_chosen_directory` with what you chose at step
;;    (1) above
;;
;; 4. inside the `dotspacemacs/user-init` function, add the following lines:
;;    ;; activate gelb-mode for files with the .gelb extension
;;    (setq auto-mode-alist (cons '("\\.gelb$" . gelb-mode) auto-mode-alist))



;; define several categories of keywords

(setq gelb-keywords '(
  "simulation_metadata"
  "configuration"
  "node_classes"
  "gelb_version"
  "periodicity"
  "initializer"
  "description"
  "short_name"
  "node_class"
  "constants"
  "lattices"
  "geometry"
  "lattice"
  "dynamic"
  "df_type"
  "nodes"
  "gauge"
  "false"
  "const"
  "array"
  "true"
  "size"
  "real"
  "bool"
  "out"
  "int"
  "in"
  "z"
  "y"
  "x"
  "q"
  "d"
))
(setq gelb-types '(
  ; =bool= type
  "bool"
  ; =int= type(s)
  "int"
  ; =real= type(s)
  "real"
  ; array type
  "array"
))
;; (setq gelb-functions '(
;;         "DownStreamDF" "DownStreamDf" "downstreamdf"
;;         "UpStreamDF" "UpStreamDf" "upstreamdf"
;;         "OppositeDF" "OppositeDf" "oppositedf"
;;         "MultiplyElementWise" "multiplyelementwise"
;;         "DotProduct" "dotproduct"
;;         "Transpose" "transpose"
;;         "Inverse" "inverse"
;;         "Reduce" "reduce"
;;         "Random" "random"
;;         "Sqrt" "sqrt"
;;         "Nint" "nint"
;;         "Atan" "atan"
;;         "Sin" "sin"
;;         "Cos" "cos"
;; ))

;; generate regex string for each category of keywords
(setq gelb-keywords-regexp (regexp-opt gelb-keywords 'words))
(setq gelb-type-regexp (regexp-opt gelb-types 'words))
;; (setq gelb-functions-regexp (regexp-opt gelb-functions 'words))

;; create the list for font-lock
;; (each category of keywords is given a particular face)
(setq gelb-font-lock-keywords `(
        (,gelb-type-regexp . font-lock-type-face)
        ;; (,gelb-functions-regexp . font-lock-function-name-face)
        (,gelb-keywords-regexp . font-lock-keyword-face)
        ;; NOTE order above matters, because once colored that part won't change
        ;;      (so put longer words first)
))

;;;###autoload
(define-derived-mode gelb-mode c++-mode "GeLB mode"
  "Major mode for editing GeLB files"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((gelb-font-lock-keywords))))

;; clear memory. no longer needed
(setq gelb-keywords nil)
(setq gelb-types nil)
;; (setq gelb-functions nil)

;; clear memory. no longer needed
(setq gelb-keywords-regexp nil)
(setq gelb-types-regexp nil)
;; (setq gelb-functions-regexp nil)

;; add the mode to the `features' list
(provide 'gelb-mode)
;;; =gelb-mode.el= ends here
