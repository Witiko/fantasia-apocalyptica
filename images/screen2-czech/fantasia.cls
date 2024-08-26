\LoadClass[oneside]{book}
\pagestyle{empty}

\RequirePackage{geometry}
\geometry{
  paperheight = 127mm,
  paperwidth = 203mm,
  top = 0pt, bottom = 0pt,
  left = 19pt, right = 19pt,
}

\RequirePackage{fontspec}
\setmainfont{Slabo27px}

\RequirePackage{xcolor}
\definecolor{blood}{HTML}{B22222}
\definecolor{brown}{HTML}{A0522D}
\definecolor{darkgreen}{HTML}{A0522D}
\definecolor{gold}{HTML}{DAA520}
\definecolor{lightblue}{HTML}{B7F6F6}
\definecolor{orange}{HTML}{FFA07A}

\colorlet{background}{lightblue}
\colorlet{body}{darkgreen}
\colorlet{motif}{orange}

\RequirePackage{tikz}

\RequirePackage{xstring}
\newif\ifbackground
\ifx\view\undefined
  \backgroundtrue
\else
  \IfEq{\view}{background}{\backgroundtrue}{\backgroundfalse}
\fi
\newif\ifeffects
\ifx\view\undefined
  \effectstrue
\else
  \IfEq{\view}{effects}{%
    \effectstrue
    \colorlet{background}{white}
  }{\effectsfalse}
\fi
\newif\iftext
\ifx\view\undefined
  \texttrue
\else
  \IfEq{\view}{text}{\texttrue}{\textfalse}
\fi

\RequirePackage{microtype}
\RequirePackage{ragged2e}
\RaggedRight
\emergencystretch=10em

\RequirePackage{polyglossia}
\setmainlanguage{czech}
\AtBeginDocument{%
  \lefthyphenmin=2
  \righthyphenmin=4
  \hyphenation{cír-kvím}
}

\def\@makechapterhead#1{{%
  \iftext
      \newgeometry{
        top = 0pt, bottom = 0pt,
        left = 9pt, right = 9pt,
      }
      \null
      \vspace*{10pt}%
      \centering
      \fontsize{49}{59}\selectfont%
      \textcolor{brown}{\bfseries #1}%
      \clearpage
      \restoregeometry
  \else
    \null
    \clearpage
  \fi
}}

\def\colorbar{%
  \ifbackground
      \begin{tikzpicture}[remember picture,overlay]
        \node[anchor=north west,yshift=\dimexpr(3.5pt - 19pt),xshift=-3.5pt] at (current page.north west) {%
          \textcolor{background}{\rule{\paperwidth}{132pt}}%
        };
      \end{tikzpicture}%
  \fi
  \par
}

\def\verse#1#2#3{{%
  \colorbar
  \vspace*{10pt}%
  \ifnum#2<263\relax
    \ifnum#2<134\relax
      \fontsize{30}{36.7}\selectfont
    \else
      \fontsize{23}{28}\selectfont
    \fi
  \else
    \vspace*{2pt}%
    \fontsize{18}{22}\selectfont
  \fi
  \noindent
  \iftext
      \textcolor{body}{#3}%
  \else
      \textcolor{background}{#3}%
  \fi
  \clearpage
}}

\def\motif#1{{%
  \ifeffects
    \textcolor{motif}{#1}%
  \else
    #1%
  \fi
}}

\def\coloredmotif#1#2{%
  \iftext
    \textcolor{#1}{\textbf{#2}}%
  \else
    \textcolor{background}{\textbf{#2}}%
  \fi
}

\def\inputchapter#1{{%
  \ifnum#1<10
    \input ch0#1\relax
  \else
    \input ch#1\relax
  \fi
  \colorbar
  \vspace*{13.2pt}%
  \noindent
  \iftext
      \textcolor{body}{%
        \fontsize{19}{22.5}\selectfont
        Zjevení Janovo\\
        \chaptername{} \thechapter\\[20.3pt]
        \fontsize{10}{11}\selectfont
        Český ekumenický překlad\\[0.7pt]
        Česká biblická společnost, 1987\\[-0.7pt]
        Použito se svolením%
      }
  \fi
}}

\RequirePackage{hyperref}
