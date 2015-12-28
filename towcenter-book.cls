\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{towcenter-book}[2010/03/28 v3.5.1 Tufte-book class]

%%
% Declare we're towcenter-book
\newcommand{\@towcenter@class}{book}% the base LaTeX class (defaults to the article/handout style)
\newcommand{\@towcenter@pkgname}{towcenter-book}% the name of the package

%%
% Load the common style elements
\input{towcenter-common.def}


%%
% Set up any book-specific stuff now

%%
% The front matter in Tufte's /Beautiful Evidence/ contains everything up
% to the opening page of Chapter 1.  The running heads, when they appear,
% contain only the (arabic) page number in the outside corner.
%\newif\if@mainmatter \@mainmattertrue
\renewcommand\frontmatter{%
  \cleardoublepage%
  \@mainmatterfalse%
  \pagenumbering{arabic}%
  %\pagestyle{plain}%
  \fancyhf{}%
  \ifthenelse{\boolean{@towcenter@twoside}}%
    {\fancyhead[LE,RO]{\thepage}}%
    {\fancyhead[RE,RO]{\thepage}}%
}


%%
% The main matter in Tufte's /Beautiful Evidence/ doesn't restart the page
% numbering---it continues where it left off in the front matter.
\renewcommand\mainmatter{%
  \cleardoublepage%
  \@mainmattertrue%
  \fancyhf{}%
  \ifthenelse{\boolean{@towcenter@twoside}}%
    {% two-side
      \renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
      \fancyhead[LE]{\thepage\quad\footnotesize\allcaps{\newlinetospace{\textsf{Columbia Journalism School \textbar{} \textbf{Tow Center} for Digital Journalism}}}}% book title
      \fancyhead[RO]{\footnotesize{\newlinetospace{\leftmark}}\quad\thepage}% chapter title
    }%
    {% one-side
      \fancyhead[RE,RO]{\smallcaps{\newlinetospace{\plaintitle}}\quad\thepage}% book title
    }%
}


%%
% The back matter contains appendices, indices, glossaries, endnotes,
% biliographies, list of contributors, illustration credits, etc.
\renewcommand\backmatter{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@mainmatterfalse%
}

%%
% Only show the chapter titles in the table of contents
\setcounter{tocdepth}{1}

%%
% If there is a `towcenter-book-local.sty' file, load it.

\IfFileExists{towcenter-book-local.tex}{%
  \@towcenter@info@noline{Loading towcenter-book-local.tex}%
  \input{towcenter-book-local}%
}{}

%%
% End of file
\endinput
