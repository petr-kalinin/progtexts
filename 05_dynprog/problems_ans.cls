
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

