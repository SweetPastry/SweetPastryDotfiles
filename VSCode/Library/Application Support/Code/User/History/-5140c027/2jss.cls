\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{briefArticle}[2024/01/03 version: 1.00.01, Author: Sweet Pastry]
\RequirePackage{kvoptions, etoolbox, xstring}
\SetupKeyvalOptions{%
    family = @sp,
    prefix = @sp@
}
\DeclareStringOption[\undefined]{bibstyle}
\ProcessKeyvalOptions*
\relax

\ifx\@sp@bibstyle\undefined
    \IfStrEq{\@sp@lang}{en}{%
        \def\@sp@bibstyle{ieee}
    }{%
    \IfStrEq{\@sp@lang}{cn}{%
        \def\@sp@bibstyle{b7714-2015}
    }{%
    \PackageError{spArticle}{Only Support en(English) and cn(Chinese)!}{Use en or cn instead.}
    }}  
\fi

\message{
    ########################
    \@sp@bibstyle
    ########################
}