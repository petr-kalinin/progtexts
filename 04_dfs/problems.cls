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
%\RequirePackage{fancyvrb}
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
\refstepcounter{lheadercount}{\bf \S\arabic{lheadercount}. #1.}%
}

\newcommand{\Header}[1]{%
\par\pagebreak[2]\vspace{2.7ex plus 1.3ex minus 1.3ex}%
\noindent{\Large\bf\sffamily #1}\par
\nopagebreak\vspace{2ex plus 1ex minus 1ex}%
}

%\def\nought{\ensuremath{{\mkern-3.25mu{\not}\mkern3.25mu\mbox{\tt0}}}}
\def\slnought{{\tt\O}}

%\DefineVerbatimEnvironment{codeblock}{Verbatim}{xleftmargin=\parindent}

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
\begin{list}{#1}{\topsep=0.6ex plus 0.3ex minus 0.6ex \partopsep=0.6ex minus 0.6ex \parsep=0pt \itemsep=0pt #2}%
}
{\end{list}}

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

\newcommand{\note}[1]{{\par\pagebreak[3]\small \textit{Примечание:} #1 \par}}

\newcommand{\eps}{\varepsilon}

\newcommand{\epigraph}[2]{\hangindent=0.4\textwidth\begin{flushright}\small\textit{#1}\par\footnotesize#2\par\end{flushright}}


\newcounter{taskcount}
\renewcommand{\thetaskcount}{\arabic{taskcount}}
\newcommand{\taskn}[2]{\refstepcounter{taskcount}\textbf{#1 \thetaskcount:} {\it #2}}
\newcommand{\task}[1]{\taskn{Задание}{#1}}

\newcommand{\hint}[2]{\textbf{Посказка \ref{#1}:} #2}

\newcommand{\answer}[2]{\textbf{Ответ \ref{#1}:} #2}