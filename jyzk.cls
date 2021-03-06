% MIT License
%
% Copyright (c) 2020 Jinyang Li
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jyzk}[2020/10/22 My Zettelkestan Class]

% Build based on the article class
\LoadClass[8pt]{extarticle}

% Define variable `notetitle'
\def\notetitle#1{\def\@notetitle{#1}}
\newcommand{\printnotetitle}{\@notetitle}

% Define variable `notedate'
\def\notedate#1{\def\@notedate{#1}}
\newcommand{\printnotedate}{\@notedate}

% A shorthand to print bold face ``See also''
\newcommand{\seealso}{\vfill\emph{See also: }}

% A shorthand to create a link to another file
\newcommand{\zl}[1]{\href{file:#1.pdf}{\emph{#1}}}

% Default variables to empty
\notetitle{}
\notedate{}

% Page setting mimics Niklas Luhmann's index card: A6
\RequirePackage[paper=a6paper,landscape,bmargin=.1in,tmargin=.5em,hmargin=.3in,includehead,headsep=.5em]{geometry}

% Math fonts
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

% Bibliography setup. Default to the zetero_library.bib which should be in sync
% with the Zotero library (with the help of Better BibTex plugin).
\RequirePackage{biblatex}
\addbibresource{zotero_library.bib}

% Make section font size the same size as the normal text.
\RequirePackage{titlesec}
\titleformat*{\section}{\normalsize\bfseries}

% Make the skip between items smaller.
\RequirePackage{enumitem}
\setlist{nosep}

% Verbatim and code
\RequirePackage[outputdir=slipbox,cache=false]{minted}

% Use small skip to indicate paragraphs instead of indentation
\setlength\parindent{0pt}
\setlength{\parskip}{0.5em}

% Enable hyperref
\RequirePackage[colorlinks=true,linkcolor=magenta,citecolor=magenta,urlcolor=magenta]{hyperref}

% Set up header. Left header shows the file name, the center one shows the
% title and the right one shows the create date.
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[L]{\href{file:0index.pdf}{\jobname}}
\fancyhead[C]{\printnotetitle}
\fancyhead[R]{\printnotedate}
\renewcommand{\headrulewidth}{0pt}

% Add this line at the beginning of the document so that we can put the filename
% in the header.
\AtBeginDocument{
    \markboth{\jobname}{\jobname}
}

% Add a `See also' line and print bibliography
\AtEndDocument{
    \printbibliography[heading=none]
}
