# WsNeX DUT Undergraduate Thesis Template

This repository is a LaTeX template for the undergraduate graduation thesis
or design report of Dalian University of Technology.

## Files

```text
.
├── thesis.tex                  # Main thesis entry
├── wsnex-dut-bachelor.cls      # DUT undergraduate thesis class
├── wsnex-base.sty              # Reusable WsNeX base macros
├── chapters/                   # Thesis sections
├── reference/references.bib    # BibTeX database
├── latexmkrc                   # XeLaTeX build recipe
└── build/thesis.pdf            # Generated PDF after compilation
```

## Build

Use the LaTeX Workshop-style command from this directory:

```bash
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdfxe -outdir=build thesis.tex
```

The template is designed for XeLaTeX because it uses Chinese system fonts. On
macOS it explicitly uses Songti SC, Heiti SC, Times New Roman, Arial, and
Courier New.

## Writing

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

Then replace the sample content in `chapters/`. The front matter, page numbers,
headers, chapter styles, captions, appendix numbering, and GB/T 7714 numerical
references are handled by `wsnex-dut-bachelor.cls`.
