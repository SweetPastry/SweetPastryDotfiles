\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{briefArticle}[2024/01/03 version: 1.00.01, Author: Sweet Pastry]
\RequirePackage{kvoptions, etoolbox, xstring}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareBoolOption[true]{colorlinks}
\DeclareStringOption[twocolumn]{column}
\DeclareStringOption[en]{lang}
\DeclareStringOption[author]{author}
\DeclareStringOption[affiliation]{affiliation}
\DeclareStringOption[\today]{date}
\DeclareStringOption[Here is title]{title}
\DeclareStringOption[Here is abstract]{abstract}
\DeclareStringOption[ref]{ref}
\DeclareStringOption[undefined]{bibstyle}
\ProcessKeyvalOptions*
\relax
\ProcessKeyvalOptions*
\relax

\IfStrEq{\@sp@bibstyle}{undefined}{%
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{b7714-2015}
    }{%
    \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
    }}  
}

\message{########################\@sp@bibstyle########################}
