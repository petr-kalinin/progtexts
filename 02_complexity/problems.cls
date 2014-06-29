  \NeedsTeXFormat{LaTeX2e}
\ProvidesClass{problems}[2006/11/03]

% identification
% initial code
% declaration of options
% execution of options
% package loading
% main code

% Declaration of Options
\DeclareOption{draft}{\PassOptionsToClass{draft}{article}\AtEndOfClass{\geometry{showframe}}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}

\hfuzz=0.1cm

% Опцию a4paper будем использовать для формата, в котором задачки
% печатались раньше на бумаге A4.
\DeclareOption{a4paper}{
 \PassOptionsToPackage{a4paper,includehead,includefoot,headheight=10pt,headsep=2mm,width=17cm,height=27cm,footskip=0.5cm}{geometry}
}

% Execution of Options
\ProcessOptions\relax

% Package Loading
\LoadClass[a4paper]{article}

\RequirePackage[T2A]{fontenc}
\RequirePackage[cp866]{inputenc}
\RequirePackage{mathtext}
\RequirePackage[english,russian]{babel}
\RequirePackage[dvips,final]{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amscd}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{longtable}
\RequirePackage[dvips]{geometry}

% Main Code
\columnseprule=0.4pt
\raggedbottom


% AK: думаю, лучше везде использовать вариант "".
%\declare@shorthand{russian}{""}{\nobreak\hskip.2em\ignorespaces}
%\declare@shorthand{russian}{",}{\nobreak\hskip.2em\ignorespaces}
% KAP: чтобы кавычки всегда были правильные
%\declare@shorthand{russian}{"<}{<<}
%\declare@shorthand{russian}{">}{>>}
%---------- From package "lastpage" ------------------
\def\lastpage@putlabel{\addtocounter{page}{-1}%
   \immediate\write\@auxout{\string\newlabel{LastPage}{{}{\thepage}}}%
   \addtocounter{page}{1}}
\AtEndDocument{\clearpage\lastpage@putlabel}%
%---------- end of "lastpage" ------------------

\newcommand{\headernono}[1]{%
\par\pagebreak[2]\vspace{1.5ex plus1ex minus .7ex}%
\noindent{\large\bf\sffamily\strut #1}\par
\nopagebreak\vspace{.8ex plus.8ex minus.3ex}%
}

\newcounter{headercount}
\renewcommand{\theheadercount}{\Roman{headercount}}
\newcommand{\header}[1]{%
\refstepcounter{headercount}\headernono{Часть \Roman{headercount}. #1}
}

\newcounter{lheadercount}[headercount]
\renewcommand{\thelheadercount}{\theheadercount.\arabic{lheadercount}}
\newcommand{\lheader}[1]{%
\par\pagebreak[3]\vspace{0.5ex plus1ex}%
\refstepcounter{lheadercount}{\bf \S\arabic{lheadercount}. #1.}\nopagebreak{}%
}

\newcommand{\Header}[1]{%
\par\pagebreak[2]\vspace{2.7ex plus 1.3ex minus 1.3ex}%
\noindent{\Large\bf\sffamily #1}\par
\nopagebreak\vspace{2ex plus 1ex minus 1ex}%
}

\newcounter{llheadercount}[lheadercount]
\renewcommand{\thellheadercount}{\thelheadercount.\arabic{llheadercount}}
\newcommand{\llheader}{%
\par\pagebreak[3]%
\refstepcounter{llheadercount}{\bf \arabic{llheadercount}.} %
}

%\def\nought{\ensuremath{{\mkern-3.25mu{\not}\mkern3.25mu\mbox{\tt0}}}}
\def\slnought{{\tt\O}}

\newcommand{\todo}[1]{\marginpar{\raggedright\footnotesize!~TODO:\\#1}}

\renewcommand{\@oddhead}{}

\renewcommand{\@oddfoot}{%
\vbox{%
\hrule\vspace{0.1cm}%
\hbox to \textwidth{%
\sf\footnotesize%
\hfill\strut Страница \thepage\ из \pageref{LastPage}\hfill%
}}}

\renewcommand{\leq}{\leqslant}
\renewcommand{\le}{\leqslant}
\renewcommand{\geq}{\geqslant}

\newcommand{\unit}[1]{\mbox{ \rm #1}}
% \vstring#1
%   Написать #1 как строку вх/вых файла (в кавычках шрифтом \tt без 
%   переносов)
\newcommand*{\vstring}[1]{`\mbox{\tt#1}'}

%БАГ: пока не работает генерация автоматических ссылок на пункты перечня
\newcounter{tmp}

\newenvironment{ulists}[2]{%
\bgroup\begin{list}{#1}{\topsep=0.6ex plus 0.3ex minus 0.6ex \partopsep=0.6ex minus 0.6ex \parsep=0pt \itemsep=0pt #2}%
}
{\end{list}\egroup}

\newenvironment{ulist}{%
\begin{ulists}{$\bullet$}{}%
}
{\end{ulists}}

\newenvironment{olist}{%
\setcounter{tmp}{0}\renewcommand{\thetmp}{\arabic{tmp}}
\begin{ulists}{\refstepcounter{tmp}\thetmp.}{}%
}
{\end{ulists}}

\newenvironment{olistzero}{%
\setcounter{tmp}{0}\renewcommand{\thetmp}{\arabic{tmp}}
\begin{ulists}{\refstepcounter{tmp}\thetmp.}{\topsep=0ex \partopsep=0ex}%
}
{\end{ulists}}

\newenvironment{wideolist}{%
\setcounter{tmp}{0}\renewcommand{\thetmp}{\arabic{tmp}}
\begin{ulists}{\refstepcounter{tmp}\thetmp.}{\topsep=0ex \parsep=0pt \itemsep=0pt \leftmargin=0pt \itemindent=\labelwidth}%
}
{\end{ulists}}

% Нумерованный список с сквозной нумерацией
\newcounter{olistcount}\renewcommand{\theolistcount}{\arabic{olistcount}}
\newcommand{\resetolist}{\setcounter{olistcount}{0}}
\newenvironment{olistc}{%
\renewcommand{\theolistcount}{\arabic{olistcount}}
\begin{ulists}{\refstepcounter{olistcount}\theolistcount.}{}%
}
{\end{ulists}}

% Нумерованный список для использования в тексте, когда каждый пункт 
% пишется с маленькой буквы и отделяется ";".
% Здесь помечается арабской цифрой со скобкой.
\newenvironment{tllist}{%
\setcounter{tmp}{0}
\begin{ulists}{\refstepcounter{tmp}\thetmp)}{}%
}
{\end{ulists}}

\newcommand*{\hm}[1]{#1\nobreak\discretionary{}{\hbox{$\mathsurround=0pt #1$}}{}}

\newcommand{\wvec}[1]{\overrightarrow{#1}}

\newcommand{\wnote}[1]{{\sl [~#1~]\todo{!}}}

\relpenalty=10000
\binoppenalty=10000

\newcommand{\OR}{\mathrel{\mathrm{or}}}
\newcommand{\XOR}{\mathrel{\mathrm{xor}}}
\newcommand{\AND}{\mathrel{\mathrm{and}}}
\newcommand{\NOT}{\mathop{\mathrm{not}}}
\newcommand{\SHL}{\mathop{\mathrm{shl}}}
\newcommand{\SHR}{\mathop{\mathrm{shr}}}


% Суммарная ширина столбцов в двухколоночной таблице, выровненной по ширине
\newlength\twowidth
\newcommand{\settwowidth}{
\twowidth=\textwidth
\addtolength\twowidth{-4\tabcolsep}
\addtolength\twowidth{-3\arrayrulewidth}
}
\AtBeginDocument{\settwowidth}%т.к. \textwidth надо сначала установить

% --= поддержка примеров программ, сделаных conv.pas =--
% Это для борьбы с разрывами страницы после окружений multicols
\newlength{\cs@topskip}
\newlength{\cs@bottom}
\newlength{\cs@bottomback}
\newlength{\cs@top}
\cs@topskip=1.5ex
\cs@bottom=1.5ex
\cs@bottomback=1ex plus 0.5ex minus 0.3ex
\footnotesize\cs@top=2.4ex\normalsize

\newenvironment{codesamplec}[1]
{% локальные определения:
\newcommand{\codelf}{\kern-1.5em\\}%
\newcommand{\codespace}{{\ttfamily\symbol{`\ }}}%
\newcommand{\codetok}[1]{{\bfseries##1}}%
\newcommand{\codecmt}[1]{{\ttfamily\slshape##1}}%
\vspace{0.5ex plus 0.3ex minus 0.1ex}
\topskip=\cs@topskip%KAP: не знаю почему, но работает :):):) !!! От этого параметра зависимость --- пороговая. Пришлось еще подрегулировать \vspace строкой ниже
%KAP: тут где-то еще видимо затесался vspace с plus/minus компонентой, так что, если сильно ужимать страницу, то все переедет...
\par\begin{multicols}{#1}[\footnotesize\hrule\nopagebreak\vspace{-\cs@top}]\tt\noindent}
{\end{multicols}\par\vspace*{-\cs@bottom}\hrule\vspace*{\cs@bottomback}\pagebreak[0]}

\newenvironment{codesample}{\begin{codesamplec}{2}}{\end{codesamplec}}

\newenvironment{codesampleo}
{\vspace{0.5ex plus 0.3ex minus 0.1ex}
\par\footnotesize\hrule\nopagebreak\vspace{-1.3ex}\tt\noindent}
{\par\nopagebreak\vspace{-1.3ex}\hrule\vspace{\cs@bottomback}}

% --= * =--

\newcommand{\noten}[2]{{\vspace{0.1cm}\par\pagebreak[3]\small \textit{#1:} #2 \vspace{0.1cm plus 0.1cm}\par}}
\newcommand{\note}[1]{\noten{Примечание}{#1}}

\newcommand{\eps}{\varepsilon}

\newcommand{\epigraph}[2]{%\hangindent=0.4\textwidth\begin{flushright}\small\textit{#1}\par\footnotesize#2\par\end{flushright}
{\parindent=0cm
\parshape 1 0.4\textwidth 0.6\textwidth
\begin{flushright}%
\small\textit{#1}\par%
\vspace{0.1cm}%
\footnotesize#2\par%
\end{flushright}}%
}

\newcounter{taskcount}
\renewcommand{\thetaskcount}{\arabic{taskcount}}
\newcommand{\taskon}[2]{%
\refstepcounter{taskcount}%
\textbf{#1\mbox{~}\thetaskcount:} {\it #2}%
}
\newcommand{\tasko}[1]{\taskon{Задание}{#1}}

\newcommand{\hint}[2]{\textbf{Посказка \ref{#1}:} #2}

\newcommand{\answer}[2]{\textbf{Ответ \ref{#1}:} #2}

\renewcommand{\ddots}{\,\,.\,.\,\,}

%ANSWERS +
\newlinechar=`\^^M

\newwrite\tsk
\immediate\openout\tsk=\jobname.tsk\relax
\newwrite\ans
\immediate\openout\ans=\jobname.ans\relax
\newwrite\hnt
\immediate\openout\hnt=\jobname.hnt\relax
\newwrite\dup

\def\makerusother{%
  \@tempcnta128\relax%
  \loop%
    \catcode\@tempcnta12%
  \ifnum\@tempcnta<255\relax%
     \advance\@tempcnta\@ne%
  \repeat%
}

\def\makeallother{%
  \let\do\@makeother\dospecials%
  \makerusother%
}

\def\writeansno#1#2{%
  \begingroup%
  \makeallother%
  \obeylines%
  \long\def\copyans#2##1#2{%
  \def\tmp{##1}%
  \if\tmp\empty%
  \else%
  \immediate\write#1{\noexpand\answer{\taskname{} \thetaskcount}{\thepage}}%
  \immediate\write#1{##1}%
  \fi%
  \endgroup\afterwriteans%
  }%
  \copyans#2%
}

\def\dupeans#1#2{%
  \immediate\write#1{\noexpand\answer{\taskname{} \thetaskcount}{\thepage}}%
  \immediate\openout\dup=\jobname.dup\relax%
  \begingroup%
  \makeallother%
  \obeylines%
  \long\def\copyans#2##1#2{%
    \immediate\write#1{##1}%
    \immediate\write\dup{##1\noexpand\endinput}%
    \endgroup\immediate\closeout\dup%
    \input{\jobname.dup}%
    \afterwriteans%
  }%
  \copyans#2%
}

\def\tasknn#1{%
\endgroup%
\refstepcounter{taskcount}%
\gdef\taskname{#1}%
\immediate\openout\dup=\jobname.dup\relax%
\immediate\write\dup{\noexpand\taskcaption{\taskname{}\noexpand~\thetaskcount:}\noexpand\endinput}%
\immediate\closeout\dup%
\input{\jobname.dup}%
\let\afterwriteans\relax%
\gdef\afterwriteans{%
  \gdef\afterwriteans{%
    \let\afterwriteans\endgroup%
    \writeansno\ans%
  }%
  \writeansno\hnt%
}
\begingroup\it%
\dupeans\tsk%
}

\def\taskn{%
\begingroup\makerusother\tasknn%
}

{\makerusother
\gdef\deftaskname{Задание}
}

\def\task{\taskn{\deftaskname}}

\def\taskcaption#1{\textbf{#1}}

\long\def\answer#1#2{
\par\pagebreak[3]\mbox{\taskcaption{#1} (стр. #2):}
}

\def\inputanswers{%
\immediate\closeout\tsk
\immediate\closeout\hnt
\immediate\closeout\ans
\eject\header{Условия всех задач}
\input{\jobname.tsk}
\eject\header{Подсказки}
\input{\jobname.hnt}
\eject\header{Ответы}
\input{\jobname.ans}
}

