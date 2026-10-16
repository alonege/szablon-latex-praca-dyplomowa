# Szablon pracy dyplomowej (LaTeX) — Politechnika Białostocka, Wydział Informatyki

Szablon LaTeX dla prac inżynierskich i magisterskich, przygotowany pod wymagania edytorskie Wydziału Informatyki Politechniki Białostockiej. Składany silnikiem XeLaTeX. Zawiera autotutorial — rozdział opisujący obsługę szablonu na żywych przykładach, usuwany przed złożeniem pracy.

## Cechy

- XeLaTeX + `fontspec`/`unicode-math` (Latin Modern; mono: DejaVu Sans Mono),
- bibliografia: `biblatex` (styl numerowany, numery w kolejności cytowań, backend biber),
- listingi z kolorowaniem składni: `minted` (dowolny język wspierany przez Pygments),
- pseudokod: `algorithm2e` z polskimi nazwami,
- rysunki wektorowe i wykresy w kodzie: TikZ + pgfplots,
- numeracja wzorów, rysunków i tabel wewnątrz rozdziałów (np. 3.1, 3.2),
- marginesy, interlinia 1,5 i wcięcia akapitowe wg wymagań wydziału.

## Wymagania

- dystrybucja TeX z XeLaTeX i `latexmk` (np. TeX Live),
- `biber` — backend bibliografii,
- Pygments (`pip install Pygments`; sprawdzenie: `pygmentize -V`) — wymagany przez `minted`,
- fonty Latin Modern i DejaVu Sans Mono (standard w TeX Live i większości dystrybucji Linuksa).

Testowane na Linuksie (Debian 13) z TeX Live.

## Kompilacja

```bash
bash compile.sh
```

równoważnie:

```bash
latexmk -bibtex -shell-escape -interaction=nonstopmode -pdfxe main.tex
```

Flaga `-shell-escape` jest wymagana przez `minted` (kolorowanie składni odbywa się przez zewnętrzny program `pygmentize`). Artefakty pośrednie sprząta `latexmk -c`.

## Struktura projektu

| Plik / katalog          | Opis                                                    |
|-------------------------|---------------------------------------------------------|
| `main.tex`              | plik główny; kolejność rozdziałów                       |
| `core/packages.tex`     | preambuła: pakiety, fonty, konfiguracja bibliografii    |
| `core/macros.tex`       | dane pracy (temat, autor, promotor, typ, Summary)       |
| `sections/`             | rozdziały pracy                                         |
| `sections/05-tutorial.tex` | autotutorial (usuwać przed oddaniem)                 |
| `img/`                  | obrazki                                                 |
| `bibl.bib`              | baza źródeł                                             |
| `compile.sh`            | kompilacja jednym poleceniem                            |

## Jak zacząć

1. Uzupełnij dane pracy w `core/macros.tex`: `\thesisType`, `\topicPL`, `\topicEN`, `\thesisAuthor`, `\promotor`, `\thesisDate`, `\summaryEN`.
2. Rozdziały pisz w plikach w `sections/` i podpinaj je w `main.tex` w odpowiednim miejscu. Szkielet kolejności rozdziałów (wstęp → podstawy → analiza → projekt → implementacja → badania → podsumowanie) pozostaw zgodny z wymaganiami wydziału.
3. Przeczytaj autotutorial w złożonym PDF — opisuje kompilację, strukturę projektu, wzorce dla rysunków, tabel, wzorów, listingów i algorytmów oraz pracę z bibliografią.
4. **Przed oddaniem pracy** usuń (lub zakomentuj) w `main.tex` linię dołączającą tutorial i przejdź listy kontrolnej z jego końca.

Uwagi:

- Repozytorium zawiera przykładową treść rozdziałów (fragmenty realnej pracy o bibliotece tensorowej w Rust). Służą jako demonstracja elementów składu i należy je podmienić na własną treść.
- Wartości oznaczone w preambule komentarzem `WYMOGI` (marginesy, interlinia, wcięcia, rozmiar czcionki) wynikają z wymagań edytorskich wydziału — nie zmieniaj ich bez konsultacji z promotorem.

## Status i pochodzenie

Ten szablon **nie jest oficjalnym materiałem Politechniki Białostockiej** ani jej Wydziału Informatyki — to niezależny, prywatny projekt. Zgodność z aktualnymi wymaganiami edytorskimi (marginesy, interlinia, układ stron wstępnych itd.) należy zweryfikować przed rozpoczęciem pracy, najlepiej z promotorem lub na stronie wydziału.

Część fragmentów szablonu (m.in. układ stron wstępnych i niektóre rozwiązania składu) pochodzi z bliżej nieokreślonych, „antycznych" źródeł — starszych szablonów przekazywanych z rocznika na rocznik, których pierwotne autorstwo nie jest znane.

## Asysta AI

Projekt modyfikowano przy użyciu asysty AI (GLM 5.3 flash). Z jej udziałem powstały m.in.: komentarze dokumentacyjne w plikach źródłowych, rozdział autotutoriala (`sections/05-tutorial.tex`), niniejszy README oraz drobne poprawki techniczne. Wszystkie zmiany były nadzorowane i akceptowane przez autora repozytorium, a poprawność szablonu zweryfikowano kompilacją (XeLaTeX + biber).

## Licencja

Kod szablonu udostępniany na licencji [Apache License 2.0](LICENSE).

Wyjątek: dołączony przykładowy obrazek `img/duck.jpeg` pochodzi z Wikimedia Commons (autor: Ciwir, [File:Pigeon.jpg](https://commons.wikimedia.org/wiki/File:Pigeon.jpg)) i jest dostępny na licencji CC BY-SA 2.5; atrybucja znajduje się w podpisie rysunku w dokumencie.
