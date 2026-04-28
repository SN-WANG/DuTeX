# DuTeX: A LaTeX Thesis Template for DUT Undergraduate Graduation Projects

[![Role](https://img.shields.io/badge/Role-LaTeX%20Template-0f766e)](https://github.com/SN-WANG/DuTeX)
[![Engine](https://img.shields.io/badge/Engine-XeLaTeX-blue)](https://www.tug.org/xetex/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

**DuTeX** is an unofficial LaTeX template for undergraduate graduation projects and theses at
Dalian University of Technology. It is built from the clean source style of
[WsNeX](https://github.com/SN-WANG/WsNeX), while focusing on reproducing the layout requirements of
the DUT undergraduate Word thesis template.

## 📌 Overview

DuTeX keeps the full writing workflow for a DUT undergraduate thesis in one repository:
cover metadata, declaration pages, Chinese and English abstracts, table of contents, main chapters,
references, appendices, revision record, acknowledgements, and a ready-to-build sample document.

The current scope includes:

- undergraduate thesis and graduation design formatting for DUT
- XeLaTeX-based Chinese and English typesetting on macOS
- cover page, originality statement, and authorization statement
- official-style headers, page numbers, headings, table of contents, and appendix numbering
- GB/T 7714 numerical references through `gbt7714`
- chapter-wise source organization for daily thesis writing

## ✨ Highlights

- `wsnex-dut-bachelor.cls` as the main DUT undergraduate thesis class
- Word-template-oriented page margins, line spacing, header rule, cover layout, and declaration pages
- macOS font setup for Songti, Heiti, Times New Roman, Arial, Courier New, and Xingkai-style school name
- Built-in environments for `cnabstract`, `enabstract`, `introduction`, `conclusion`, `revisionrecord`,
  and `acknowledgements`
- Numbered chapters, sections, subsections, equations, figures, and tables
- Centered back-matter chapters for references, revision record, and acknowledgements
- Clean source layout inherited from the WsNeX style

## 🧱 Repository Layout

```text
DuTeX/
├── thesis.tex                  # Main thesis entry and cover metadata
├── wsnex-dut-bachelor.cls      # DUT undergraduate thesis class
├── chapters/
│   ├── abstract.tex
│   ├── introduction.tex
│   ├── chapter1.tex
│   ├── conclusion.tex
│   ├── appendix-a.tex
│   ├── revision-record.tex
│   └── acknowledgements.tex
├── reference/
│   └── references.bib
├── figs/                       # DUT and school logo assets
├── README.md
└── LICENSE
```

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/SN-WANG/DuTeX.git
cd DuTeX
```

### Install the tools you need

DuTeX is designed for XeLaTeX. A typical macOS setup uses MacTeX or TeX Live with:

- `xelatex`
- `bibtex`
- `latexmk`
- the Chinese and Latin fonts shipped with macOS

### Build with latexmk

```bash
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdfxe -outdir=build thesis.tex
```

The generated PDF is written to:

```text
build/thesis.pdf
```

### Build with the explicit XeLaTeX workflow

```bash
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build thesis.tex
bibtex build/thesis
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build thesis.tex
xelatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build thesis.tex
```

## ✍️ Writing Your Thesis

Edit the metadata block in `thesis.tex` first:

```latex
\title{大连理工大学本科毕业论文（设计）题目}
\englishtitle{The Subject of Undergraduate Graduation Project (Thesis) of DUT}
\college{机械工程学院}
\major{机械设计制造及其自动化}
\author{学生姓名}
\studentid{20221040000}
\advisor{指导教师}
\reviewer{评阅教师}
\completiondate{2026年6月}
```

Then replace the sample content in `chapters/`:

- `abstract.tex`: Chinese abstract, English abstract, and keywords
- `introduction.tex`: unnumbered introduction included in the table of contents
- `chapter1.tex`: numbered main-chapter example
- `conclusion.tex`: unnumbered conclusion included in the table of contents
- `appendix-a.tex`: appendix example
- `revision-record.tex`: thesis revision record
- `acknowledgements.tex`: acknowledgements

References are stored in `reference/references.bib` and cited with the numerical GB/T 7714 style.

## 🧩 Template Components

DuTeX provides thesis-facing commands and environments instead of requiring authors to manually format pages:

```latex
\makecover
\makedeclarations

\begin{cnabstract}
...
\keywords{关键词一；关键词二；关键词三}
\end{cnabstract}

\begin{enabstract}
...
\englishkeywords{Keyword One; Keyword Two; Keyword Three}
\end{enabstract}

\begin{introduction}
...
\end{introduction}

\begin{conclusion}
...
\end{conclusion}
```

The thesis class handles page styles, title formatting, table of contents entries, numbering, captions,
appendices, bibliography headings, and PDF metadata.

## 🔗 Relationship to WsNeX

DuTeX is built on top of [WsNeX](https://github.com/SN-WANG/WsNeX).
WsNeX keeps the earlier LaTeX source style and project history, while DuTeX keeps the self-contained
DUT undergraduate thesis class, sample thesis structure, and Word-template-oriented layout decisions.

## 📚 Citation

If DuTeX is useful in your work, please cite it as a software project.

```bibtex
@software{dutex2026,
  author = {Shengning Wang},
  title = {DuTeX},
  year = {2026},
  url = {https://github.com/SN-WANG/DuTeX}
}
```

## 📄 License

This project is released under the MIT License. See [LICENSE](LICENSE) for details.
