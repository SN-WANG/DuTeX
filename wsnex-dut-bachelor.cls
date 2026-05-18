% =============================================================================
% WsNeX DUT Bachelor Thesis Class
% Maintainer: Shengning Wang
% Description: Undergraduate thesis template for Dalian University of Technology.
% =============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wsnex-dut-bachelor}[2026/04/24 DUT undergraduate thesis class]

% =============================================================================
% 1. CLASS OPTIONS
% =============================================================================
% The official Word template is visually one-sided, while printed copies may be
% duplexed. The class keeps oneside as the default and exposes twoside when the
% author needs print-facing margins.
\newif\ifDUT@twoside
\DUT@twosidefalse

\DeclareOption{oneside}{\DUT@twosidefalse}
\DeclareOption{twoside}{\DUT@twosidetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\ifDUT@twoside
  \LoadClass[UTF8,a4paper,zihao=-4,scheme=chinese,fontset=none,twoside,openright]{ctexbook}
\else
  \LoadClass[UTF8,a4paper,zihao=-4,scheme=chinese,fontset=none,oneside,openany]{ctexbook}
\fi

% =============================================================================
% 2. CORE PACKAGES
% =============================================================================
% Keep the thesis class compact: load only packages used by ordinary theses.
\RequirePackage{amsmath,amssymb,amsthm,bm}
\RequirePackage{array}
\RequirePackage{booktabs,longtable,makecell,multirow,tabularx}
\RequirePackage{caption,subcaption}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{titletoc}
\RequirePackage{xcolor}
\RequirePackage{xparse}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage[hidelinks,hypertexnames=false]{hyperref}

% =============================================================================
% 3. PAGE LAYOUT
% =============================================================================
% DUT undergraduate Word template: A4, top 3.5 cm, bottom 2.5 cm,
% left/right 2.5 cm, header about 2.5 cm, footer about 2.0 cm.
\geometry{
  paper=a4paper,
  top=3.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm,
  headheight=15pt,
  headsep=0.50cm,
  footskip=1.20cm
}

\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\setCJKmainfont{STSong}[BoldFont={Songti SC Bold},ItalicFont={STSong}]
\setCJKsansfont{Heiti SC}[AutoFakeBold=2.5,ItalicFont={Heiti SC}]
\setCJKmonofont{STSong}
\setCJKfamilyfont{zhsong}{STSong}[BoldFont={Songti SC Bold},ItalicFont={STSong}]
\setCJKfamilyfont{zhhei}{Heiti SC}[AutoFakeBold=2.5,ItalicFont={Heiti SC}]
\setCJKfamilyfont{zhkai}{Songti SC}
\setCJKfamilyfont{zhfs}{Songti SC}
\setCJKfamilyfont{zhxingkai}{Xingkai.ttc}[
  Path={/System/Library/AssetsV2/com_apple_MobileAsset_Font8/13b8ce423f920875b28b551f9406bf1014e0a656.asset/AssetData/},
  AutoFakeBold=2.5
]
\providecommand{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{\CJKfamily{zhkai}}
\providecommand{\fangsong}{\CJKfamily{zhfs}}
\providecommand{\xingkai}{\CJKfamily{zhxingkai}}

\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{0pt}
\setstretch{1.25}

% =============================================================================
% 4. THESIS METADATA
% =============================================================================
% Public commands mirror the cover fields in the official Word template.
\def\DUT@value@title{大连理工大学本科毕业论文（设计）题目}
\def\DUT@value@englishtitle{The Subject of Undergraduate Graduation Project (Thesis) of DUT}
\def\DUT@value@college{}
\def\DUT@value@major{}
\def\DUT@value@author{}
\def\DUT@value@studentid{}
\def\DUT@value@advisor{}
\def\DUT@value@reviewer{}
\def\DUT@value@completiondate{}

\renewcommand{\title}[1]{\gdef\DUT@value@title{#1}}
\newcommand{\englishtitle}[1]{\gdef\DUT@value@englishtitle{#1}}
\newcommand{\college}[1]{\gdef\DUT@value@college{#1}}
\newcommand{\major}[1]{\gdef\DUT@value@major{#1}}
\renewcommand{\author}[1]{\gdef\DUT@value@author{#1}}
\newcommand{\studentid}[1]{\gdef\DUT@value@studentid{#1}}
\newcommand{\advisor}[1]{\gdef\DUT@value@advisor{#1}}
\newcommand{\reviewer}[1]{\gdef\DUT@value@reviewer{#1}}
\newcommand{\completiondate}[1]{\gdef\DUT@value@completiondate{#1}}

% =============================================================================
% 5. RUNNING HEADS AND PAGE NUMBERS
% =============================================================================
% Header text follows the Word template requirement: thesis title centered.
\definecolor{DUT@headergray}{gray}{0.42}
\newcommand{\DUT@headertext}{\color{DUT@headergray}\songti\zihao{5}\DUT@value@title}
\newcommand{\DUT@headrule}{%
  {\color{DUT@headergray}\hrule width\headwidth height0.4pt}%
}

\fancypagestyle{DUT@thesis}{%
  \fancyhf{}%
  \fancyhead[C]{\DUT@headertext}%
  \fancyfoot[C]{\songti\zihao{-5}--~\thepage~--}%
  \renewcommand{\headrulewidth}{0.4pt}%
  \renewcommand{\headrule}{\DUT@headrule}%
  \renewcommand{\footrulewidth}{0pt}%
}

\fancypagestyle{DUT@declaration}{%
  \fancyhf{}%
  \fancyhead[C]{\DUT@headertext}%
  \renewcommand{\headrulewidth}{0.4pt}%
  \renewcommand{\headrule}{\DUT@headrule}%
  \renewcommand{\footrulewidth}{0pt}%
}

\fancypagestyle{DUT@empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\headrule}{}%
  \renewcommand{\footrulewidth}{0pt}%
}

\pagestyle{DUT@thesis}
\let\ps@plain\ps@DUT@thesis

\renewcommand{\frontmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \pagestyle{DUT@thesis}%
}

\renewcommand{\mainmatter}{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}%
  \pagestyle{DUT@thesis}%
}

% =============================================================================
% 6. HEADINGS AND CONTENTS
% =============================================================================
% Numbered chapters are left aligned. Front/back matter headings are centered.
\newlength{\DUT@chapterbeforeskip}
\newlength{\DUT@chapterafterskip}
\newlength{\DUT@sectionbeforeskip}
\newlength{\DUT@sectionafterskip}
\newlength{\DUT@subsectionbeforeskip}
\newlength{\DUT@subsectionafterskip}
\setlength{\DUT@chapterbeforeskip}{20bp}
\setlength{\DUT@chapterafterskip}{31bp}
\setlength{\DUT@sectionbeforeskip}{7.8bp}
\setlength{\DUT@sectionafterskip}{18bp}
\setlength{\DUT@subsectionbeforeskip}{7.8bp}
\setlength{\DUT@subsectionafterskip}{8bp}

\newcommand{\DUT@headingformat}[1]{%
  \raggedright\heiti\bfseries#1\linespread{1.5}\selectfont
}

\ctexset{
  chapter = {
    name = {},
    number = \arabic{chapter},
    aftername = \quad,
    format = \DUT@headingformat{\zihao{-3}},
    beforeskip = \DUT@chapterbeforeskip,
    afterskip = \DUT@chapterafterskip,
    afterindent = true,
    fixskip = true
  },
  section = {
    format = \DUT@headingformat{\zihao{4}},
    beforeskip = \DUT@sectionbeforeskip,
    afterskip = \DUT@sectionafterskip,
    afterindent = true,
    fixskip = true
  },
  subsection = {
    format = \DUT@headingformat{\zihao{-4}},
    beforeskip = \DUT@subsectionbeforeskip,
    afterskip = \DUT@subsectionafterskip,
    afterindent = true,
    fixskip = true
  },
  subsubsection = {
    format = \DUT@headingformat{\zihao{-4}},
    beforeskip = \DUT@subsectionbeforeskip,
    afterskip = \DUT@subsectionafterskip,
    afterindent = true,
    fixskip = true
  }
}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\titlecontents{chapter}
  [0pt]{\songti\zihao{-4}}
  {\thecontentslabel\hspace{0.1\ccwd}}{}
  {\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{section}
  [2\ccwd]{\songti\zihao{-4}}
  {\thecontentslabel\hspace{0.4\ccwd}}{}
  {\hspace{0em}\titlerule*{.}\contentspage}
\titlecontents{subsection}
  [4\ccwd]{\songti\zihao{-4}}
  {\thecontentslabel\hspace{0.5\ccwd}}{}
  {\hspace{0em}\titlerule*{.}\contentspage}

\newcommand{\DUT@centerchapter}[2][]{%
  \clearpage
  \phantomsection
  \if\relax\detokenize{#1}\relax
    \addcontentsline{toc}{chapter}{#2}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \markboth{#2}{#2}%
  \begin{center}
    {\heiti\bfseries\zihao{-3}\linespread{1.5}\selectfont #2\par}
  \end{center}
  \vspace{11bp}%
  \@afterindenttrue\@afterheading
}

\renewcommand{\contentsname}{目录}
\renewcommand{\tableofcontents}{%
  \clearpage
  \phantomsection
  \markboth{\contentsname}{\contentsname}%
  \begin{center}
    {\heiti\bfseries\zihao{-3}\linespread{1.5}\selectfont \contentsname\par}
  \end{center}
  \vspace{11bp}%
  \@starttoc{toc}%
  \clearpage
}

% =============================================================================
% 7. COVER AND DECLARATIONS
% =============================================================================
% These pages follow the visible layout and fixed text of the undergraduate Word
% template. They are intentionally unnumbered.
\newcommand{\DUT@underline}[2]{\underline{\makebox[#1][c]{#2}}}
\newcommand{\DUT@signaturedate}{\makebox[11\ccwd][l]{日\quad 期：}}
\newlength{\DUT@revisionsignaturerightskip}
\setlength{\DUT@revisionsignaturerightskip}{9.0\ccwd}

\newcommand{\DUT@coverlabeltwo}[2]{\hbox to 4.80\ccwd{#1\hfil#2}}
\newcommand{\DUT@coverlabelfour}[4]{\hbox to 4.80\ccwd{#1\hfil#2\hfil#3\hfil#4}}
\newcommand{\DUT@coverfield}[2]{%
  \makebox[5.25\ccwd][l]{#1：}\DUT@underline{7.2cm}{#2}\\[0.35em]
}

\newcommand{\makecover}{%
  \clearpage
  \thispagestyle{DUT@empty}%
  \begin{center}
    \vspace*{0.6cm}
    {\songti\zihao{-1}\bfseries 大连理工大学本科毕业论文（设计）\par}
    \vspace{1.55cm}
    {\heiti\zihao{2}\bfseries\DUT@value@title\par}
    \vspace{0.18cm}
    {\bfseries\zihao{3}\makebox[\textwidth][c]{\DUT@value@englishtitle}\par}
    \vspace{4.35cm}
    {\songti\zihao{-3}
      \begin{tabular}{@{}l@{}}
        \DUT@coverfield{\DUT@coverlabeltwo{学}{院}}{\DUT@value@college}
        \DUT@coverfield{\DUT@coverlabeltwo{专}{业}}{\DUT@value@major}
        \DUT@coverfield{\DUT@coverlabelfour{学}{生}{姓}{名}}{\DUT@value@author}
        \DUT@coverfield{\DUT@coverlabeltwo{学}{号}}{\DUT@value@studentid}
        \DUT@coverfield{\DUT@coverlabelfour{指}{导}{教}{师}}{\DUT@value@advisor}
        \DUT@coverfield{\DUT@coverlabelfour{评}{阅}{教}{师}}{\DUT@value@reviewer}
        \DUT@coverfield{\DUT@coverlabelfour{完}{成}{日}{期}}{\DUT@value@completiondate}
      \end{tabular}\par}
    \vfill
    {\xingkai\bfseries\zihao{-2}大连理工大学\par}
    \vspace{0.1cm}
    {\zihao{-4}Dalian University of Technology\par}
  \end{center}
  \clearpage
}

\newcommand{\makeoriginalitystatement}{%
  \clearpage
  \thispagestyle{DUT@declaration}%
  \begin{center}
    {\heiti\bfseries\zihao{2}原创性声明\par}
  \end{center}
  \vspace{11bp}
  {\songti\zihao{-3}
  \parindent=2\ccwd
  \noindent\hspace*{2\ccwd}本人郑重声明：本人所呈交的毕业论文（设计），是在指导老师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等，均已明确注明出处。除文中已经注明引用的内容外，不包含任何其他个人或集体已经发表或撰写过的科研成果。对本文的研究成果做出重要贡献的个人和集体，均已在文中以明确方式标明。\par
  \vspace{\baselineskip}
  \noindent 本声明的法律责任由本人承担。\par
  \vspace{2\baselineskip}
  \noindent 作者签名：\hfill\DUT@signaturedate\par}
  \clearpage
}

\newcommand{\makeauthorizationstatement}{%
  \clearpage
  \thispagestyle{DUT@declaration}%
  \begin{center}
    {\heiti\bfseries\zihao{2}关于使用授权的声明\par}
  \end{center}
  \vspace{11bp}
  {\songti\zihao{-3}
  \parindent=2\ccwd
  \noindent\hspace*{2\ccwd}本人在指导老师指导下所完成的毕业论文（设计）及相关的资料（包括图纸、试验记录、原始数据、实物照片、图片、录音带、设计手稿等），知识产权归属大连理工大学。本人完全了解大连理工大学有关保存、使用毕业论文（设计）的规定，本人授权大连理工大学可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文（设计）。如果发表相关成果，一定征得指导教师同意，且第一署名单位为大连理工大学。本人离校后使用毕业论文（设计）或与该论文直接相关的学术论文或成果时，第一署名单位仍然为大连理工大学。\par
  \vspace{2\baselineskip}
  \noindent 论文作者签名：\hfill\DUT@signaturedate\par
  \vspace{\baselineskip}
  \noindent 指导老师签名：\hfill\DUT@signaturedate\par}
  \clearpage
}

\newcommand{\makedeclarations}{%
  \makeoriginalitystatement
  \makeauthorizationstatement
}

% =============================================================================
% 8. ABSTRACTS AND BACK MATTER
% =============================================================================
\NewDocumentEnvironment{cnabstract}{}{%
  \DUT@centerchapter{摘要}%
}{}

\NewDocumentCommand{\keywords}{m}{%
  \par\vspace{\baselineskip}
  \noindent{\heiti\zihao{-4}\bfseries 关键词：#1}\par
}

\NewDocumentEnvironment{enabstract}{}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{Abstract}%
  \markboth{Abstract}{Abstract}%
  \begin{center}
    {\bfseries\zihao{-3}\DUT@value@englishtitle\par}
    \vspace{\baselineskip}
    {\bfseries\zihao{-3}Abstract\par}
  \end{center}
  \vspace{11bp}%
}{}

\NewDocumentCommand{\englishkeywords}{m}{%
  \par\vspace{\baselineskip}
  \noindent{\bfseries\zihao{-4}Key Words: #1}\par
}

\newcommand{\revisionrecordsignatures}{%
  \par\vspace{4\baselineskip}
  {\parindent=0pt
    \hfill\makebox[12\ccwd][r]{记录人（签字）：}\hspace*{\DUT@revisionsignaturerightskip}\par
    \vspace{\baselineskip}
    \hfill\makebox[12\ccwd][r]{指导教师（签字）：}\hspace*{\DUT@revisionsignaturerightskip}\par}%
}

\NewDocumentEnvironment{introduction}{}{%
  \DUT@centerchapter{引言}%
}{}

\NewDocumentEnvironment{conclusion}{}{%
  \DUT@centerchapter{结论}%
}{}

\NewDocumentEnvironment{revisionrecord}{}{%
  \DUT@centerchapter{修改记录}%
}{}

\NewDocumentEnvironment{acknowledgements}{}{%
  \DUT@centerchapter{致谢}%
}{}

% =============================================================================
% 9. FIGURES, TABLES, EQUATIONS, AND REFERENCES
% =============================================================================
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

\newif\ifDUT@table@centercells
\DUT@table@centercellsfalse
\newcommand{\DUT@tablefont}{\songti\zihao{5}\selectfont}
\newcommand{\DUT@table@setup}{%
  \DUT@table@centercellstrue
  \DUT@tablefont
  \renewcommand{\arraystretch}{1.20}%
  \setlength{\extrarowheight}{0pt}%
}
\newcommand{\DUT@table@teardown}{\DUT@table@centercellsfalse}

\let\DUT@array@classz\@classz
\def\@classz{%
  \ifDUT@table@centercells
    \@classx
    \@tempcnta \count@
    \prepnext@tok
    \@addtopreamble{\ifcase \@chnum
      \hfil
      \hskip1sp%
      \d@llarbegin
      \insert@column
      \d@llarend
      \do@row@strut \hfil \or
      \hfil
      \hskip1sp%
      \d@llarbegin
      \insert@column
      \d@llarend
      \do@row@strut \hfil \or
      \hfil
      \hskip1sp%
      \d@llarbegin
      \insert@column
      \d@llarend
      \do@row@strut \hfil \or
      \setbox\ar@mcellbox\vbox
      \@startpbox{\@nextchar}\unexpanded{\centering\arraybackslash}%
      \insert@pcolumn \@endpbox
      \ar@align@mcell
      \do@row@strut \or
      \setbox\ar@mcellbox\vbox
      \@startpbox{\@nextchar}\unexpanded{\centering\arraybackslash}%
      \insert@pcolumn \@endpbox
      \ar@align@mcell
      \do@row@strut \or
      \setbox\ar@mcellbox\vbox
      \@startpbox{\@nextchar}\unexpanded{\centering\arraybackslash}%
      \insert@pcolumn \@endpbox
      \ar@align@mcell
      \do@row@strut
    \fi}%
    \prepnext@tok
  \else
    \DUT@array@classz
  \fi
}

\AtBeginEnvironment{tabular}{\DUT@table@setup}
\AtEndEnvironment{tabular}{\DUT@table@teardown}
\AtBeginEnvironment{tabular*}{\DUT@table@setup}
\AtEndEnvironment{tabular*}{\DUT@table@teardown}
\AtBeginEnvironment{tabularx}{\DUT@table@setup}
\AtEndEnvironment{tabularx}{\DUT@table@teardown}
\AtBeginEnvironment{longtable}{\DUT@table@setup}
\AtEndEnvironment{longtable}{\DUT@table@teardown}
\renewcommand{\tabularxcolumn}[1]{>{\centering\arraybackslash}p{#1}}
\renewcommand{\cellalign}{cc}
\renewcommand{\theadalign}{cc}

\DeclareCaptionLabelSeparator{DUT@space}{\quad}
\captionsetup{
  font={small},
  labelfont={normalfont},
  labelsep=DUT@space,
  justification=centering
}
\captionsetup[figure]{position=bottom,aboveskip=6bp,belowskip=6bp}
\captionsetup[table]{position=top,aboveskip=6bp,belowskip=6bp}

\setlist{nosep,leftmargin=2\ccwd}
\setlist[enumerate,1]{label=(\arabic*)}

\renewcommand{\bibname}{参考文献}
\newcommand{\upcite}[1]{\cite{#1}}

\renewenvironment{thebibliography}[1]{%
  \DUT@centerchapter{参考文献}%
  \songti\zihao{5}
  \list{\@biblabel{\@arabic\c@enumiv}}{%
    \settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \setlength{\parsep}{0pt}%
    \setlength{\itemsep}{0pt}%
    \setlength{\listparindent}{0pt}%
    \setlength{\itemindent}{0pt}%
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \widowpenalty4000
  \sfcode`\.=\@m
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}

\let\DUT@originalappendix\appendix
\renewcommand{\appendix}{%
  \DUT@originalappendix
  \ctexset{
    chapter = {
      name = {},
      number = 附录\kern0pt\Alph{chapter},
      aftername = \kern0pt,
      format = \centering\heiti\bfseries\zihao{-3}\linespread{1.5}\selectfont,
      beforeskip = \DUT@chapterbeforeskip,
      afterskip = \DUT@chapterafterskip,
      afterindent = true,
      fixskip = true
    }
  }%
  \renewcommand{\thefigure}{\Alph{chapter}\arabic{figure}}%
  \renewcommand{\thetable}{\Alph{chapter}\arabic{table}}%
  \renewcommand{\theequation}{\Alph{chapter}\arabic{equation}}%
}

% =============================================================================
% 10. DOCUMENT METADATA
% =============================================================================
\AtBeginDocument{%
  \hypersetup{
    pdftitle={\DUT@value@title},
    pdfauthor={\DUT@value@author},
    pdfsubject={DUT undergraduate thesis},
    pdfcreator={XeLaTeX with wsnex-dut-bachelor}
  }%
}

\endinput
