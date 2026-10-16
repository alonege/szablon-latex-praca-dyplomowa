#!/bin/bash
# Kompilacja pracy: ./compile.sh   (z katalogu głównego szablonu)
#
# latexmk                     — orkiestrator: sam woła XeLaTeX tyle razy, ile
#                               trzeba (spis treści i \ref dopiero po drugim
#                               przebiegu "łapią" numery) i sam dogradza
#                               bibliografię.
# -bibtex                     — wymuś przebieg narzędzia bibliograficznego.
# -shell-escape               — minted koloruje kod przez zewnętrzny program
#                               pygmentize, a LaTeX domyślnie blokuje uruchamianie
#                               obcych programów. Ta flaga to zgoda (wymagana).
# -interaction=nonstopmode    — przy błędzie nie czekaj na Enter, wypisz i jedź.
# -pdfxe                      — silnik XeLaTeX (wymagany przez fontspec/unicode-math).
#
# Artefakty (aux, log, _minted/...) powstają obok źródeł; sprząta je
# `latexmk -c` (katalog _minted/ i main.pdf — ręcznie, jeśli trzeba).
latexmk -bibtex -shell-escape -interaction=nonstopmode -pdfxe main.tex
