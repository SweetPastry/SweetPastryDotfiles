\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spBeamer}[2024/01/05 version: 1.00.01, Author: Sweet Pastry]


\RequirePackage{kvoptions, etoolbox, xstring}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareBoolOption[true]{nocite}
\DeclareIntOption[0]{style}
\DeclareStringOption[en]{lang}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[undefined]{bibstyle}
\DeclareStringOption[Here is title]{title}
\DeclareStringOption{subtitle}
\DeclareStringOption[author]{author}
\DeclareStringOption[\@sp@author]{authorinshort}
\DeclareStringOption[affiliation]{affiliation}
\DeclareStringOption[\@sp@affiliation]{affiliationinshort}
\DeclareStringOption[\today]{date}
\ProcessKeyvalOptions*
\relax


\LoadClass[aspectratio=43]{beamer}
\setbeamertemplate{frametitle continuation}{}


\newcommand{\spTitle}[1]{\def\@sp@title{#1}}
\newcommand{\spSubtitle}[1]{\def\@sp@subtitle{#1}}
\newcommand{\spAuthor}[1]{\def\@sp@author{#1}}
\newcommand{\spAuthorInShort}[1]{\def\@sp@authorinshort{#1}}
\newcommand{\spAffiliation}[1]{\def\@sp@affiliation{#1}}
\newcommand{\spAffiliationInShort}[1]{\def\@sp@affiliationinshort{#1}}
\newcommand{\spDate}[1]{\def\@sp@date{#1}}


\typeout{
> > > > > > > > > >^^J
check point1: inner val^^J
colorlinks=[sp: bool type]^^J
author=\@sp@author^^J
aythorinshort=\@sp@authorinshort^^J
affiliation=\@sp@affiliation^^J
affiliationinshort=\@sp@affiliationinshort^^J
date=[sp: some internal date type]^^J
title=\@sp@title^^J
substitle=\@sp@subtitle^^J
ref=\@sp@ref^^J
bibstyle=\@sp@bibstyle^^J
< < < < < < < < < <^^J
}


\PassOptionsToPackage{version=4}{mhchem}
\RequirePackage{amsmath, amssymb, amsfonts, mathrsfs, esint, yhmath, cancel, tensor, physics, chemstyle, mhchem, chemfig, xcolor, xkcdcolors, graphicx, pgfplots, tabularx, float, cuted, tikz, tikz-cd, circuitikz, array, pdfpages, lipsum, xeCJK, fancyvrb, refcount}
\newcommand{\song}{\CJKfamily{song}}
\usetikzlibrary{backgrounds}
\usetikzlibrary{arrows,shapes}
\usetikzlibrary{tikzmark}
\usetikzlibrary{calc}


\IfStrEq{\@sp@bibstyle}{undefined}{%
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{gb7714-2015}
    }{%
    \typeout{
        > > > > > > > > > >^^J
        check point3: bibstyle determin^^J
        determin failed!^^J
        lang=\@sp@lang^^J
        < < < < < < < < < <^^J
    }
    \PackageError{spBeamer}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
}}}


\RequirePackage{xurl}
\RequirePackage[backend=biber, style=\@sp@bibstyle]{biblatex}
\AtEndPreamble{%
    \IfEndWith{\@sp@ref}{.bib}{%
        \addbibresource{\@sp@ref}
    }{%
        \addbibresource{\@sp@ref.bib}
}}



\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map{%
			\step[
			fieldsource=url,
			match=\regexp{http://dx.doi.org/(.+)},
			fieldtarget=doi,
			]
			\step[
			fieldsource=doi,
			match=\regexp{http://dx.doi.org/(.+)},
			replace=\regexp{$1}
        ]}
		\map{%
			\step[fieldsource=doi, final]
			\step[fieldset=url, null]
			\step[fieldset=urldate, null]
}}}


\makeatletter
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat{doi}{%
  \ifhyperref
    {\href{https://doi.org/#1}{DOI: \nolinkurl{#1}}}
    {DOI: \nolinkurl{#1}}}
\makeatother


\useoutertheme{infolines}
\useinnertheme{rectangles}
\usefonttheme{professionalfonts}

% Black and Red
\definecolor{orange}{HTML}{f28165}
\definecolor{deepgray}{HTML}{303030}
\definecolor{yellow}{HTML}{f0be52}
\definecolor{lightorange}{HTML}{f19e58}

% Deep Gray Blue
\definecolor{SlateGray}{HTML}{3E4E56}
\definecolor{ReflectiveWhite}{HTML}{F7F7F7}
\definecolor{TealBlue}{HTML}{2B6777}
\definecolor{SeafoamGreen}{HTML}{588A8A}

% Deep Green
\definecolor{primary}{HTML}{556B2F}
\definecolor{ReflectiveWhite}{HTML}{F7F7F7}
\definecolor{highlight}{HTML}{E85D04}
\definecolor{accent}{HTML}{82C91E}

% White and Black
\definecolor{Black}{HTML}{000000}
\definecolor{White}{HTML}{FFFFFF}
\definecolor{highlight}{HTML}{BEBEBE}
\definecolor{accent}{HTML}{4D4D4D}

\ifcase
  \colorlet{primary}{orange}
  \colorlet{secondary}{deepgray}
  \colorlet{highlight}{yellow}
  \colorlet{accent}{lightorange}
\or
  \colorlet{primary}{orange}
  \colorlet{secondary}{gray}
  \colorlet{highlight}{yellow}
  \colorlet{accent}{lightorange}
\or
  \colorlet{primary}{orange}
  \colorlet{secondary}{gray}
  \colorlet{highlight}{yellow}
  \colorlet{accent}{lightorange}
\or
  \colorlet{primary}{orange}
  \colorlet{secondary}{gray}
  \colorlet{highlight}{yellow}
  \colorlet{accent}{lightorange}
\else
  \PackageError{spBeamer}{Style index number exceed!}{Choose a smaller int number, 0 default.}
\fi


\makeatletter
\newcommand{\mybox}[1]{%
  \setbox0=\hbox{#1}%
  \setlength{\@tempdima}{\dimexpr\wd0+13pt}%
  \begin{tcolorbox}[colback=primary,colframe=primary,boxrule=0.5pt,arc=4pt,
      left=6pt,right=6pt,top=6pt,bottom=6pt,boxsep=0pt,width=\@tempdima]
    \textcolor{white}{#1}
  \end{tcolorbox}
}
\makeatother


\usecolortheme[named=primary]{structure}
\usecolortheme{sidebartab}
\usecolortheme{orchid}
\usecolortheme{whale}
\setbeamercolor{alerted text}{fg=highlight}
\setbeamercolor{block title alerted}{bg=alerted text.fg!90!black}
\setbeamercolor{block title example}{bg=lightorange!60!black}
\setbeamercolor{background canvas}{bg=secondary}
\setbeamercolor{normal text}{bg=secondary,fg=white}

\setbeamertemplate{footline}{
  \leavevmode
  \hbox{%
    \begin{beamercolorbox}[wd=0.5\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}
      \usebeamerfont{author in head/foot}\insertshortauthor~~(\insertshortinstitute)
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=0.5\paperwidth,ht=2.25ex,dp=1ex,right]{date in head/foot}
      \usebeamerfont{date in head/foot}\insertframenumber{} / \inserttotalframenumber\hspace{2ex}
    \end{beamercolorbox}
  }
  \vskip0pt%
}

\setbeamertemplate{blocks}[rectangle]
\setbeamercovered{dynamic}

\setbeamertemplate{section page}
{
  \begin{centering}
    \begin{beamercolorbox}[sep=27pt,center]{part title}
      \usebeamerfont{section title}\insertsection\par
      \usebeamerfont{subsection title}\insertsubsection\par
    \end{beamercolorbox}
  \end{centering}
}


\makeatletter
\AtEndPreamble{%
  \title{\bfseries\@sp@title}
  \subtitle{\@sp@subtitle}
  \author[\@sp@authorinshort]{\bfseries\@sp@author}
  \institute[\textit{\@sp@affiliationinshort}]{\textit{\@sp@affiliation}}
  \date{\@sp@date}
}
\makeatother


\makeatletter
\AtBeginDocument{%
  \frame{\titlepage}
  \begin{frame}{\IfStrEq{en}{\@sp@lang}{Summary}{\IfStrEq{\@sp@lang}{cn}{目录}{\PackageError{spBeamer}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}\typeout{AtBeginDocumentErrorSP}}}}
      \tableofcontents
  \end{frame}
}
\makeatother


\makeatletter
\AtEndDocument{
  \section*{References}
    \begin{frame}[allowframebreaks]{\IfStrEq{en}{\@sp@lang}{References}{\IfStrEq{\@sp@lang}{cn}{参考文献}{\PackageError{spBeamer}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}\typeout{AtBeginDocumentErrorSP}}}}
      \if@sp@nocite\nocite{*}\fi
      \IfStrEq{\@sp@lang}{en}{%
          \printbibliography
      }{%
      \IfStrEq{\@sp@lang}{cn}{%
          \printbibliography[title=参考文献]
      }{%
      \typeout{
      > > > > > > > > > >^^J
      check point5: bibliography generate^^J
      generate failed!^^J
      < < < < < < < < < <^^J
      }
      \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
     }}
    \end{frame}

  \section{}
  \begin{frame}{}
    \centering
        \Huge\bfseries
    % change to 'primary' here
    \textcolor{primary}{The End}
  \end{frame}
}
\makeatother


\newcommand{\hlmath}[2]{\colorbox{#1!17}{$\displaystyle #2$}}
\newcommand{\hltext}[2]{\colorbox{#1!17}{#2}}