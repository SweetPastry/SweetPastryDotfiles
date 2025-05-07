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