% COVER PAGE FOR INF-UFG TECHNICAL REPORTS
% Last edited on 2006-04-27 12:50:00 by Mauricio Vieira
% Last edited on 2005-02-23 09:50:00 by H. Longo
% Based on tr-inf.cls of 23 Feb 2005, by H. Longo 
% Based on techrep-ic.sty of 03 Mar 2001, by Pedro J. de Rezende and J. Stolfi.
%
% The class tr-inf defines a \TRMakeCover macro that 
% prints a cover page for the standard DIMAP-UFRN technical report
% format. The various cover fields (title, author, report number, etc.)
% are defined by auxiliary macros \TRTitle, \TRAuthor, \TRMonth, etc.
%

%======================================================================
% Identification
%======================================================================
\newcommand{\docdate}{}
\newcommand{\filedate}{}
\newcommand{\fileversion}{}
\renewcommand{\docdate}{2006/04/27}
\renewcommand{\filedate}{2006/04/27}
\renewcommand{\fileversion}{1.0}
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{rt-dimap}%
  [\filedate\space v\fileversion\space DIMAP-UFRN Technical Reports class]


%======================================================================
% Class options
%======================================================================
\RequirePackage{ifthen}

\newboolean{capa}
\setboolean{capa}{false}
\DeclareOption{capa}{
  \setboolean{capa}{true}
}

\newboolean{plain}
\setboolean{plain}{false}
\DeclareOption{plain}{
  \setboolean{plain}{true}
}

\DeclareOption{american,english,french,german,brazil,portuguese}{
  \PassOptionsToPackage{\CurrentOption}{babel,fancyref}
}

\ProcessOptions\relax


%======================================================================
% Preliminary declarations
%======================================================================
\LoadClass[a4paper,12pt]{article}
\makeatletter

\RequirePackage[english,portuguese,brazil]{babel}      %permite acentua�o autom�ica para o Portugu� do Brasil,
\RequirePackage[T1]{fontenc}        %permite a hifeniza�o correta em Portugu�
%\RequirePackage[ansinew]{inputenc}  %permite a inser�o de acentos (Windows)
\RequirePackage[latin1]{inputenc}  %permite a inser�o de acentos (Unix)
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{url} %para a formata�o adequada de endere�s WEB
\RequirePackage[vlined,titlenumbered,algo2e,ruled,portugues]{algorithm2e} 
\RequirePackage{indentfirst}
\RequirePackage{times}

\advance\endlinechar by -256%


%======================================================================
% Declarations
%======================================================================
\typeout{LaTeX 2e package `rt-dimap' -- Released 27 Apr 2006}
\ifx\pagecolor\undefined
  \RequirePackage{color}
\fi

%----------------------------------------------------------------------
% Margins:
%----------------------------------------------------------------------
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}

\setlength{\oddsidemargin}{3.0cm}
\setlength{\evensidemargin}{3.0cm}
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-2.0cm}

\setlength{\topmargin}{0.0cm}
\setlength{\headheight}{1.5cm}
\setlength{\headsep}{1.5cm}

\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\topmargin}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-2.0cm}

\setlength{\parindent}{1cm}
\sloppy

%----------------------------------------------------------------------
% Code lists:
%----------------------------------------------------------------------
\floatstyle{ruled}   %%% tipos: plain, boxed, ruled
\newfloat{codigo}{tbp}{lop}%[section] %%% captions with section number
\floatname{codigo}{C�igo}

%----------------------------------------------------------------------
% These macros should be used by the author, before the \maketitle,
% to define the report number, type and date:
%----------------------------------------------------------------------
\def\TRTitle#1{\def\TRtitl@{#1}}
\TRTitle{A Generic Technical Report}

\def\TRAuthor#1{\def\TRauth@r{#1}}
\TRAuthor{Generic Author One and Generic Author Two and Generic Author Three}

\def\TRNumber#1{\def\TRnumb@r{#1}}
\TRNumber{101}

\def\TRType#1{\def\TRtyp@{#1}}
\TRType{Technical Report}

\def\TRTipo#1{\def\TRtip@{#1}}
\TRTipo{Relat{\'o}rio T{\'e}cnico}

\def\TRYear#1{\def\TRye@r{#1}}
\TRYear{2006}

\def\TRMonth#1{\def\TRm@nth{#1}}
\TRMonth{\month}
  
%----------------------------------------------------------------------
% Handy macro for current month and year, in Portuguese:
%----------------------------------------------------------------------
\def\TRm@nthP{
  \ifcase\TRm@nth\or
    Janeiro\or Fevereiro\or Mar\c{c}o\or 
    Abril\or Maio\or Junho\or 
    Julho\or Agosto\or Setembro\or 
    Outubro\or Novembro\or Dezembro\fi
}

\def\TRm@nthE{
  \ifcase\TRm@nth\or
    January\or February\or March\or 
    April\or May\or June\or 
    July\or August\or September\or 
    October\or November\or December\fi
}

 
%----------------------------------------------------------------------
% Cover page design
%----------------------------------------------------------------------
\newcommand{\TRf@tbox}[2]{
  \vbox{
    \offinterlineskip
    \null\kern#1
    \hbox{\null\kern#1#2\kern#1\null}
    \kern#1\null
  }
}
  
%----------------------------------------------------------------------
% Color boxes
%----------------------------------------------------------------------
\ifx\colorbox\undefined
  \newcommand{\TRc@lorbox}[2]{\hbox{#2}}
\else
  \newcommand{\TRc@lorbox}[2]{\colorbox{#1}{#2}}
\fi

%----------------------------------------------------------------------
% Cover page main font style
%----------------------------------------------------------------------
\newcommand{\TR@sf}[1]{{\usefont{T1}{cmss}{m}{n}#1}}
\newcommand{\TR@bf}[1]{{\usefont{T1}{cmr}{bx}{n}#1}}
\newcommand{\TR@it}[1]{{\usefont{T1}{cmr}{m}{it}#1}}
\newcommand{\TR@Huge}{\fontsize{25}{30pt}}
\newcommand{\TR@LARGE}{\fontsize{17}{22pt}}
\newcommand{\TR@normal}{\fontsize{11}{13.6pt}}
\newcommand{\TR@small}{\fontsize{10}{12pt}}
\DeclareMathSizes{11}{11}{8}{5}

\def\TR@titwd{11.7cm}

%----------------------------------------------------------------------
% \TRMakeCover creates the cover page:
%----------------------------------------------------------------------
  \newsavebox{\TR@tmpbox}

  \def\TRMakeCover{
    \bgroup
    \newpage
    \c@page\z@
    \thispagestyle{empty}
    \parindent 0pt
    \parskip 0pt
    \definecolor{TRBlue}{rgb}{0.00,0.20,0.60}
    \definecolor{TRLightBlue}{rgb}{0.59,0.81,0.81}
    \definecolor{TRLightGray}{rgb}{0.7,0.7,0.7}
    \ifthenelse{\boolean{capa}}{
      \pagecolor{TRLightGray}
      %\pagecolor{TRBlue}
      \TR@normal
      \null
      \vskip -1cm
      \vbox to 0pt{
        \null\kern -6cm 
        \hbox to 0pt{
          \null\kern -4cm
          \TRc@lorbox{TRBlue}{\rule{0cm}{32.5cm}\rule{5.5cm}{0cm}}
          \hss
        }
        \vss
      }
    }{}
    \hspace{2cm}
    \begin{minipage}[top]{15.5cm}
      \begin{center}
        \ifthenelse{\boolean{capa}}{
          \leavevmode
          \hbox to 10pt{
            \null\hss
            \TRc@lorbox{white}{
              \TRf@tbox{5pt}{
                \valign{
                  \vfil##\vfil\cr
                  \hbox{\includegraphics{DIMAP-RT}}
                  \cr
                  \noalign{\kern 10pt}
                }
              }
            }
            \hss
            \null
          }
        }{\vspace{3.8cm}}
        \vskip 97mm
        \TRc@lorbox{white}{
          \TRf@tbox{4mm}{
            \framebox[120mm]{
              \vbox to 45mm{
                \hsize=115mm
                \textwidth=\hsize
                \linewidth=\hsize
                \null
                {
                  \centering
                  \null
                  \baselineskip 12pt
                  \lineskip 1pt plus 3pt minus 0pt
                  \lineskiplimit 1pt
                  \vfill
                  \TR@normal\TR@bf{\TRtitl@\par}
                  \vskip 1.5ex
                  \TR@normal\TR@it{
                    \def\and{\end{tabular}\hskip 1em plus .17fil\begin{tabular}[t]{c}}
                    \begin{tabular}[t]{c}
                        \TRauth@r
                      \end{tabular}
                      \par
                    }
                    \vfill
                    {
                      \TR@small\TR@sf{
                        \TRtyp@
                        \ifthenelse{\equal{\TRtyp@}{Technical Report}}
                        { \quad-\quad
                          UFRN-DIMAp-{\TRye@r}-{\TRnumb@r}-RT
                          \quad-\quad
                        }
                        { \quad-\quad
                        }
                        \TRtip@
                        \par
                      }
                      \TR@small\TR@sf{
                        {\TRm@nthE}
                        \quad-\quad
                        {\TRye@r}
                        \quad-\quad
                        {\TRm@nthP}
                      }
                      \par
                    }
                    \vskip 5mm

                  \kern -5pt
                  \null
                }
                \null
              }
            }
          }
        }
        \par\vskip 5mm
        { 
          \TR@small
          \TR@sf{The contents of this document are the sole responsibility {}
          of the authors.}
          \par
          \TR@sf{O conte{\'u}do do presente documento {\'e} de {\'u}nica {}
          responsabilidade dos autores.}
          \par
        }

        \par\vskip 20mm
        { 
          \TR@normal{
            \TR@bf{
              Departamento de Inform{\'a}tica e Matem{\'a}tica Aplicada\par
              Universidade Federal do Rio Grande do Norte\par
            }
            \TR@it{
              www.dimap.ufrn.br
            }
          }
        }
        \vfill

      \end{center}
      \end{minipage}
    \egroup
    \c@page\z@
    \newpage
    \ifx\xipt\undefined
      \pagecolor{white}
    \fi
  }

%----------------------------------------------------------------------
% Abstract, "Resumo" and "Palavras Chaves":
%----------------------------------------------------------------------
\renewenvironment{abstract}{%
%\selectlanguage{english}
      \list{}{%\advance\topsep by0.35cm\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape Abstract.]\itshape}%
      {\endlist}

\newenvironment{keywords}{%
      \list{}{\advance\topsep by0.35cm\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries Keywords:]}%
      {\endlist}
      
\newenvironment{resumo}{%
      \list{}{%\advance\topsep by0.35cm\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries\itshape Resumo.]\itshape}%
      {\endlist}


\newenvironment{palavras-chave}{%
      \list{}{%\advance\topsep by0.35cm\relax%\small
      \leftmargin=0.8cm
      \labelwidth=\z@
      \listparindent=\z@
      \itemindent\listparindent
      \rightmargin\leftmargin}\item[\hskip\labelsep
                                    \bfseries Palavras-Chave:]}%
      {\endlist}


%----------------------------------------------------------------------
% Restore \endlinechar:
%----------------------------------------------------------------------
\advance\endlinechar by +256%

\AtBeginDocument{%
  \ifthenelse{\boolean{plain}}
    {\bibliographystyle{plain}}%
%    {\bibliographystyle{abnt-num}}%
    {\bibliographystyle{dimap-ufrn}}%
  }
\AtEndDocument{%
  \label{end}%
  }
