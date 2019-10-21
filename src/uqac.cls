%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Format LaTeX pour memoire et these de l'UQAC
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Date de création: Janvier 2018
%% Auteur: Florentin Thullier 

%%%%%%%%%%%%%%%%%
%%
%% Modifications
%%
% Date - Auteur - Commentaire

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uqac}

%%%&&&&&&&&&&&&&&&&&&&&&&&
%%
%% Définitions des options
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Times
\def\@uqactimes{false}
\DeclareOption{times}{%
  \def\@uqacpdctimes{true}
}

%% Thèse
\def\@uqacthese{false}
\DeclareOption{these}{%
  \def\@uqacthese{true}
}

%% Projet de Thèse
\def\@uqacprojthese{false}
\DeclareOption{projthese}{%
  \def\@uqacprojthese{true}
}

%% Sujet de Thèse
\def\@uqacsujthese{false}
\DeclareOption{sujthese}{%
  \def\@uqacsujthese{true}
}

%% Mémoire
\def\@uqacmemoire{false}
\DeclareOption{memoire}{%
  \def\@uqacmemoire{true}
}

%% Essai
\def\@uqacessai{false}
\DeclareOption{essai}{%
  \def\@uqacessai{true}
}

%% Rapport
\def\@uqacrapport{false}
\DeclareOption{rapport}{%
  \def\@uqacrapport{true}
}

%% French
\def\@uqacfrench{false}
\DeclareOption{french}{%
  \def\@uqacfrench{true}
}

%% English
\def\@uqacenglish{false}
\DeclareOption{rapport}{%
  \def\@uqacenglish{true}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

%%%%%%%%%%
%%
%% Packages
%%
%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifthen}
\ifthenelse{\equal{\@uqacfrench}{true}}{%
  \RequirePackage[french]{babel}
}{
  \RequirePackage[english]{babel}
}
\RequirePackage{graphicx}
\RequirePackage{url}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[explicit]{titlesec}
\RequirePackage{natbib}
\RequirePackage{regexpatch}
\RequirePackage{titletoc}
\RequirePackage{acronym}
\RequirePackage{enumitem}
\RequirePackage{hyphenat}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{textcomp}
\RequirePackage{rotating}
\RequirePackage{microtype}
\RequirePackage{chngcntr}

\ifthenelse{\equal{\@uqacfrench}{true}}{%
  \RequirePackage[lined,boxed,linesnumbered,french,onelanguage,resetcount,algochapter]{algorithm2e}
  \RequirePackage{babel}
  \RequirePackage[autolanguage]{numprint}
}{
 \RequirePackage[lined,boxed,linesnumbered,english,onelanguage,resetcount,algochapter]{algorithm2e}
}
\RequirePackage{silence}

\WarningsOff

% interligne simple
\def\mystretch{1}
\def\baselinestretch{\mystretch}

\newlength{\simpleinter}
\setlength{\simpleinter}{\baselineskip}
\newlength{\doubleinter}
\setlength{\doubleinter}{1\baselineskip}

\ifthenelse{\equal{\@uqacpdctimes}{true}}{%
  \RequirePackage{mathptmx}
  \renewcommand{\sfdefault}{phv}
}

%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Définition des marges
%%
%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\oddsidemargin}{1cm}
\setlength{\evensidemargin}{0.35cm}
\setlength{\topmargin}{-0.25cm}
\setlength{\textwidth}{14.6cm}
\setlength{\textheight}{23.45cm}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}

%%%%%%%  End of margins and formatting params %%%

\renewcommand*{\@seccntformat}[1]{\csname the#1\endcsname\hspace{-0.15cm}}

% Ne pas paginer les pages vides
% Code for creating empty pages
% No headers on empty pages before new chapt  er
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}

\edef\partpdf#1\expandafter{\uppercase{#1}}

\AtBeginDocument{
   \@ifpackageloaded{hyperref}
   {\newcommand{\UpperRef}[1]{\texorpdfstring{\MakeUppercase{#1}}
                   { \expandafter\expandafter\partpdf\expandafter{#1} } }}
   {\newcommand{\UpperRef}[1]{\MakeUppercase{#1}}}

%%%%%%%%%%%%%%%%%
%%
%%  Bibliographie
%%
%%%%%%%%%%%%%%%%%

\renewenvironment{thebibliography}[1]
     {\chapter*{\bfseries\UpperRef{\bibname}
        \@mkboth{\UpperRef{\bibname}}{\UpperRef{\bibname}}}%
      \addtocontents{toc}{\protect\vspace{1.5ex}}
      \addcontentsline{toc}{chapter}{\bfseries\UpperRef{\bibname}}
      \baselineskip=\simpleinter
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \settowidth{\leftmargin}{rr}
            %\leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \setlength{\listparindent}{-\leftmargin}
            \setlength{\itemsep}{2em} % double spacing entre chaque référence
            \setlength{\parsep}{0em}
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\arabic{enumiv}}}%
      \sloppy\clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.=\@m}
      %\raggedright} % bibliographie non justifié à droite
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
}
%% Ajout des commandes setstrerch et doublespacing si
%% package setspace non chargé

\AtBeginDocument{ \@ifpackageloaded{setspace}
   {\relax}
   {\newcommand{\restore@spacing}{%
	    \par
	    \vskip \parskip
	    \vskip \baselineskip
	  \endgroup
	  \vskip -\parskip
	  \vskip -\baselineskip
	}

	\newcommand{\setstretch}[1]{%
	  \def\baselinestretch{#1}%
	  \@currsize
	}
	\newcommand{\doublespacing}{%
	  \setstretch {2}%  default
	}

	% double spacing is 2 x pt size
	\newenvironment{doublespace}{%
	  \begingroup
	    \doublespacing
	}{%
	  \restore@spacing
	}
	}
}

% Redefine '/chapter' to always start on an odd page.
% Should make no difference in singleside mode.
%
\def\chapter{\cleardoublepage   % Starts new page.
   \thispagestyle{empty}        % Page non numerotee
   \global\@topnum\z@           % Prevents figures from going at top of page.
   \@afterindenttrue            % indent in first paragraph.  Change
   \secdef\@chapter\@schapter}  % to \@afterindentfalse to have none.

% If using the report style, use - instead of . in the figure number.

\newcommand\numerochap{\Roman{chapter}}
\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\thesection{\thechapter.\arabic{section}}
\@ifundefined{thechapter}{}{\def\thefigure{\thechapter-\arabic{figure}}}

\def\@makechapterhead#1{%
  {\parskip=0ex
    \parindent \z@ \raggedright \reset@font
    \ifnum \c@secnumdepth >\m@ne
         \centering {\textbf{\expandafter\MakeUppercase\expandafter{\@chapapp{} \numerochap}}} \par
         \vskip 0 truecm
       \fi
     \centering {\textbf{\MakeUppercase{ #1}}}\par

    \nopagebreak
    \vspace*{1cm}
  \parskip=2ex}}

\def\@makeschapterhead#1{
   \parskip=0ex
   \begin{center}
     {\MakeUppercase{ #1 }}\par

   \end{center}
   \nobreak
   \parskip=2ex  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Redéfinition des termes
%% en Francais et en anglais
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\equal{\@uqacfrench}{true}}{%
	\addto\captionsfrench{%
	   \renewcommand\contentsname{Table des Mati\`eres}}
	\addto\captionsfrench{%
	   \renewcommand\listfigurename{Liste des Figures}}
	\addto\captionsfrench{%
	   \renewcommand\listtablename{Liste des Tableaux}}
	\addto\captionsfrench{%
	   \renewcommand\bibname{Bibliographie}}
	\addto\captionsfrench{%
	   \renewcommand\indexname{Index}}
	\addto\captionsfrench{%
	   \renewcommand\figurename{Figure}}
	\addto\captionsfrench{%
	   \renewcommand\tablename{Tableau}}
	\addto\captionsfrench{%
	   \renewcommand\partname{Partie}}
	\addto\captionsfrench{%
	   \renewcommand\chaptername{Chapitre}}
	\addto\captionsfrench{%
	   \renewcommand\appendixname{Annexe}}
	\addto\captionsfrench{%
	   \renewcommand\abstractname{R\'esum\'e}}
}{%
	\addto\captionsenglish{%
	   \renewcommand\contentsname{Table of Contents}}

   \addto\captionsenglish{%
	   \renewcommand\bibname{References}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Indentation des sections
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\section{\@startsection{section}{1}%
                                    {\z@}%
                                    {2ex\@plus.2ex\@minus.2ex}%
                                    {.5pt \@plus .2ex}%
                                    {\normalsize\bfseries\MakeUppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {3ex\@plus .2ex \@minus .2ex}%
                                     {.5pt \@plus .2ex}%
                                     {\normalsize\bfseries\MakeUppercase}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {3ex\@plus .2ex \@minus .2ex}%
                                     {2ex \@plus .2ex}%
                                     {\normalsize\bfseries\MakeUppercase}}

%\let\oldsection\section
%\renewcommand{\section}{\leftskip=0cm \oldsection}

%\let\oldsubsection\subsection
%\renewcommand{\subsection}{\leftskip=1cm \oldsubsection}

%\let\oldsubsubsection\subsubsection
%\renewcommand{\subsubsection}{\leftskip=2cm \oldsubsubsection}

\markright{}
\pagestyle{myheadings}

 % Numéroration des pages en chiffres Arabes
\pagenumbering{arabic}

% Renfoncement au début d'un paragraphe
\parindent=1cm

%%%%%%%%%%%%%%%%%%%%%
%%
%%  Figures & tables
%%
%%%%%%%%%%%%%%%%%%%%%

\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{5\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{#1} #2}
  \ifdim \wd\@tempboxa >\hsize
    {#1} #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%% Numérotation des figures avec un "." à la place d'un "-"
\renewcommand\thefigure{{\thechapter.\@arabic\c@figure}}
%\def\fps@figure{tbp}
%\def\ftype@figure{1}
%\def\ext@figure{lof}
%\def\fnum@figure{{\figurename~}\thefigure\vspace{-0.5cm}}
%\renewenvironment{figure}
%               {\vspace{1cm}\@float{figure}}
%               {\end@float}
%\renewenvironment{figure*}
%               {\@dblfloat{figure}}
%               {\end@dblfloat}

%\renewcommand\thetable{{\thechapter.\@arabic\c@table}}
%\def\fps@table{tbp}
%\def\ftype@table{2}
%\def\ext@table{lot}
%\def\fnum@table{{\tablename~}\thetable\vspace{-0.25cm}}
%\renewenvironment{table}
%               {\vspace{.5cm}\@float{table}}
%               {\end@float}
%\renewenvironment{table*}
%               {\@dblfloat{table}}
%               {\end@dblfloat}

\RequirePackage{etoolbox}
\RequirePackage{caption, subfig}

%% Espacements avant et après les figures
\BeforeBeginEnvironment{figure}{\vspace{1cm}}
\AfterEndEnvironment{figure}{\vspace{-0.5cm}}
\BeforeBeginEnvironment{figure*}{\vspace{1cm}}
\AfterEndEnvironment{figure*}{\vspace{-0.5cm}}

%% Espacements avant et après les tableaux
\BeforeBeginEnvironment{table}{\vspace{0.5cm}}
\AfterEndEnvironment{table}{\vspace{-0.5cm}}

%% Espacements avant et après les algorithmes
\BeforeBeginEnvironment{algorithm}{\vspace{1cm}}
\AfterEndEnvironment{algorithm}{\vspace{1cm}}

\SetAlCapSkip{12pt}
\SetAlgoInsideSkip{medskip}
\renewcommand\AlCapFnt{\bfseries\small}
\renewcommand{\AlCapNameSty}{\bfseries\small}

%% Formatage des captions pour les figures et les tableaux
\captionsetup[figure]{position=bottom, labelfont={bf, small, stretch=1.17}, labelsep=colon, textfont={bf, small, stretch=1.17}, justification=centering}
\captionsetup[subfloat]{labelfont={small, stretch=1.17}, textfont={small, stretch=1.17}, justification=centering}
\captionsetup[table]{position=top, margin=0.5cm, labelfont={bf, small, stretch=1.17}, labelsep=colon, textfont={bf, small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=centering}

\DeclareCaptionLabelSeparator{colon}{ : }

%%%%%%%%%%%%%%%%%%%%%
%%
%% Table des matieres
%%
%%%%%%%%%%%%%%%%%%%%%

\renewcommand\tableofcontents{%
  \thispagestyle{empty}
  \baselineskip=\simpleinter
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{\bfseries\expandafter\MakeUppercase\expandafter{\contentsname}}
  \parskip=0ex
  \vspace*{.75cm}
  \@starttoc{toc}%
  \noindent
  \if@restonecol\twocolumn\fi
  \baselineskip=\doubleinter
  \parskip=2ex}

\renewcommand\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \nopagebreak
      \leavevmode
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addtocontents{toc}{\protect\vspace{1.5ex}}
                    \addcontentsline{toc}{chapter}{\noindent\UpperRef{\bfseries\@chapapp\protect\hskip 0.5em \numerochap\hskip 0.5em \textendash\hskip 0.5em}\bfseries\UpperRef{#1}}
                     \else
                      \addcontentsline{toc}{chapter}{\bfseries\UpperRef{#1}}
                    \fi
                    \chaptermark{#1}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
                    }

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
      \let\@svsec\@empty \else
    \refstepcounter{#1} \protected@edef\@svsec{\@seccntformat{#1}\hskip 1em}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup #6{\relax
        \@hangfrom{\hskip #3\relax\@svsec}\interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
  \ifnum #2>\tw@ \else
    \addtocontents{toc}{\protect\vspace{1.5ex}} %ne pas inserer si niveau de section > 2
    \addcontentsline
    {toc}{#1}{\ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi #7} \fi \else
    \def\@svsechd{%
      #6{\hskip #3\relax
       \@svsec #8}\csname #1mark\endcsname
        {#7} \addcontentsline{toc}{#1}{
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}
  \fi
  \@xsect{#5}}

\renewcommand\l@chapter{\@dottedtocline{0}{0em}{0em}}
\newcommand\l@specialchapitre{\@dottedtocline{0}{0em}{0em}}
\renewcommand\l@section{\@dottedtocline{1}{1.15em}{2.3em}}
\renewcommand\l@subsection{\@dottedtocline{2}{2.3em}{3.2em}}
\renewcommand\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}

\xpatchcmd*{\@sect}{\fi#7}{\fi\@nameuse{format#1}{#7}}{}{}

%% Titre des sections et sous-sections en majuscules dans la table des matières
\protected\def\formatsection{\MakeUppercase}
\protected\def\formatsubsection{\MakeUppercase}

%%%%%%%%%%%%%%%%%%%%
%%
%% Liste des figures
%%
%%%%%%%%%%%%%%%%%%%%

%% Préfixer la référence de la figure par le mot "figure" en majuscules
%% et gestion de l'indentation lorsque la légende admet plusieurs lignes.

\titlecontents{figure}[2.74cm]
  {}
  {
  	\makebox[-3pt][r]{%
      \makebox[2.78cm][l]{\MakeUppercase{figure}\space\thecontentslabel\protect\space\textendash}%
    }%
  }
  {}
  {\titlerule*[8pt]{.}\contentspage}

\let\svcaption\caption
\let\svfigure\figure
\def\figure{\figurecaps\svfigure}
\def\figurecaps{%
  \renewcommand\caption[2][]{\svcaption[\MakeUppercase{##2}]{##2}}
}

\renewcommand\listoffigures{%
{
    \baselineskip=\simpleinter
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\textbf{\UpperRef{\listfigurename}}
      \@mkboth{\UpperRef{\listfigurename}}%
              {\UpperRef{\listfigurename}}}%
    \addtocontents{toc}{\protect\vspace{1.5ex}}
    \addcontentsline{toc}{chapter}{\bfseries\UpperRef{\listfigurename}}
    \vspace*{.35cm}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
}

%%%%%%%%%%%%%%%%%%%%%
%%
%% Liste des tableaux
%%
%%%%%%%%%%%%%%%%%%%%%

\titleformat{name=\table}
  {\normalfont\Large\bfseries}{\thetable}{1em}{\hspace{0em}}{}


%% Préfixer la référence du tableau par le mot "tableau" en majuscules
%% et gestion de l'indentation lorsque la légende admet plusieurs lignes.

\ifthenelse{\equal{\@uqacfrench}{true}}{%
	\titlecontents{table}[3.1cm]
  	{}
  	{
  		\makebox[-3pt][r]{%©
      		\makebox[3.15cm][l]{\MakeUppercase{\tablename}\space\thecontentslabel\protect\space : }%
    	}%
  	}
  	{}
  	{\titlerule*[8pt]{.}\contentspage}
}{
	\titlecontents{table}[2.45cm]
  	{}
  	{
  		\makebox[-3pt][r]{%©
      		\makebox[2.5cm][l]{\MakeUppercase{\tablename}\space\thecontentslabel\protect\space : }%
    	}%
  	}
  	{}
  	{\titlerule*[8pt]{.}\contentspage}
}


\let\svcaption\caption
\let\svtable\table
\def\table{\tablecaps\svtable}
\def\tablecaps{%
  \renewcommand\caption[2][]{\svcaption[\MakeUppercase{##2}]{##2}}
}

\renewcommand\listoftables{%
  {
    \baselineskip=\simpleinter

    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\textbf{\UpperRef{\listtablename}}
      \@mkboth{\UpperRef{\listtablename}}{\UpperRef{\listtablename}}}%
    \addtocontents{toc}{\protect\vspace{1.5ex}}
    \addcontentsline{toc}{chapter}{\bfseries\UpperRef{\listtablename}}
    \vspace*{.35cm}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Liste des abréviations
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

% éviter un fail de compilation lorsqu'un acronyme est utilisé dans une section
\protected\def\sl@Terminator{\sl@Terminator}

\def\acrolistpath#1{\gdef\@acrolistpath{#1}}

\def\listofacro{
  \ifthenelse{\equal{\@uqacfrench}{true}}{%
  	\chapter*{\textbf{\UpperRef{Liste des Abr\'eviations}}}
  }{
  	\chapter*{\textbf{\UpperRef{List of Abbreviations}}}
  }
  \addtocontents{toc}{\protect\vspace{1.5ex}}
  \ifthenelse{\equal{\@uqacfrench}{true}}{%
 	 \addcontentsline{toc}{chapter}{\bfseries\UpperRef{Liste des Abr\'eviations}}
  }{
  	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{List of Abbreviations}}
  }
  \vspace*{.35cm}
  \input{\@acrolistpath}
}

%%%%%%%%%%%%
%%
%% Footnotes
%%
%%%%%%%%%%%%

\setlength{\footnotesep}{\doubleinter}

\renewcommand{\@makefntext}[1]%
  {\setlength{\parindent}{2em}%
   \makebox[1.8em][r]{\@makefnmark}#1}

\renewcommand{\footnoterule}{
 \noindent
 \rule{4cm}{0.4pt}
}

\counterwithout*{footnote}{chapter}

%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Resume
%%
%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{abstract}{%
\chapter*{\textbf{\UpperRef{\abstractname}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{\abstractname}}
\vspace*{.35cm}
\baselineskip=\simpleinter}

%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Resume
%% en Français
%%
%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{resume}{%
\chapter*{\textbf{\MakeUppercase{Résumé}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Résumé}}
\vspace*{.35cm}
\baselineskip=\simpleinter}

%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Dédicace
%%
%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{dedic}{%
\ifthenelse{\equal{\@uqacfrench}{true}}{%
  	\chapter*{\textbf{\MakeUppercase{D\'edicace}}}
}{
  	\chapter*{\textbf{\UpperRef{Dedication}}}
}

\addtocontents{toc}{\protect\vspace{1.5ex}}

\ifthenelse{\equal{\@uqacfrench}{true}}{%
	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{D\'edicace}}
}{
  	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Dedication}}
}
\raggedleft
\vspace*{.35cm}
\baselineskip=1.5\baselineskip
% \baselineskip=\simpleinter
\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Remerciements
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{ack}{%

\ifthenelse{\equal{\@uqacfrench}{true}}{%
  	\chapter*{\textbf{\MakeUppercase{Remerciements}}}
}{
  	\chapter*{\textbf{\UpperRef{Acknowledgements}}}
}

\addtocontents{toc}{\protect\vspace{1.5ex}}

\ifthenelse{\equal{\@uqacfrench}{true}}{%
	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Remerciements}}
}{
  	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Acknowledgements}}
}

\vspace*{.35cm}
\baselineskip=\simpleinter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Avant-propos
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{preface}{%

\ifthenelse{\equal{\@uqacfrench}{true}}{%
  	\chapter*{\textbf{\MakeUppercase{Avant-propos}}}
}{
  	\chapter*{\textbf{\UpperRef{Preface}}}
}

\addtocontents{toc}{\protect\vspace{1.5ex}}

\ifthenelse{\equal{\@uqacfrench}{true}}{%
	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Avant-propos}}
}{
  	\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Preface}}
}

\vspace*{.35cm}
\baselineskip=\simpleinter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Introduction
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{introduction}{%
\chapter*{\textbf{\MakeUppercase{Introduction}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Introduction}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Conclusion
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{conclusion}{%
\chapter*{\textbf{\MakeUppercase{Conclusion}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Conclusion}}
}

%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Annexes
%%
%%%%%%%%%%%%%%%%%%%%%%%%

\def\appendix{\par
\setcounter{chapter}{0}%
\setcounter{section}{0}%
\def\@chapapp{\textbf{\UpperRef{\appendixname}}}%
\renewcommand\numerochap{\Alph{chapter}}
\def\thechapter{\Alph{chapter}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Pagination
%% en bas à droite de la page
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\fancyhf{}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Définitions des différentes
%% parties du document
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\opening{
  \pagenumbering{roman}
  \addtocounter{page}{1}
}

\def\maincontent{
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \doublespacing
}

%%%%%%%%%%%%%%%%
%%
%% Page de Garde
%%
%%%%%%%%%%%%%%%%

\def\concentration#1{\gdef\@concentration{#1}}
\concentration{}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\programme#1{\gdef\@programme{#1}}
\programme{}
\degreeyear{\the\year}

\ifthenelse{\equal{\@uqacthese}{true}}{%
	\ifthenelse{\equal{\@uqacfrench}{true}}{%
  		\gdef\thesetype{\textbf{\MakeUppercase{th\`ese}}}
   		\gdef\thesegrade{\textbf{\MakeUppercase{philosophi\ae{} doctor (Ph.D.) en \expandafter\expandafter{\@programme}}}}
   		\gdef\accord{e}
	}{
		\gdef\thesetype{\textbf{\MakeUppercase{thesis}}}
   		\gdef\thesegrade{\textbf{\MakeUppercase{philosophi\ae{} doctor (Ph.D.) in the subject of \expandafter\expandafter{\@programme}}}}
   		\gdef\accord{e}
	}
}{%
	\ifthenelse{\equal{\@uqacprojthese}{true}}{%
		\ifthenelse{\equal{\@uqacfrench}{true}}{%
	  		\gdef\thesetype{\textbf{\MakeUppercase{projet de th\`ese}}}
	   		\gdef\thesegrade{\textbf{\MakeUppercase{philosophi\ae{} doctor (Ph.D.) en \expandafter\expandafter{\@programme}}}}
	   		\gdef\accord{}
   		}{
   			\gdef\thesetype{\textbf{\MakeUppercase{thesis project}}}
	   		\gdef\thesegrade{\textbf{\MakeUppercase{philosophi\ae{} doctor (Ph.D.) in the subject of \expandafter\expandafter{\@programme}}}}
	   		\gdef\accord{}
   		}
	}{
    \ifthenelse{\equal{\@uqacsujthese}{true}}{%
      \ifthenelse{\equal{\@uqacfrench}{true}}{%
          \gdef\thesetype{\textbf{\MakeUppercase{sujet de th\`ese}}}
          \gdef\thesegrade{\textbf{\MakeUppercase{philosophi\ae{} doctor (Ph.D.) en \expandafter\expandafter{\@programme}}}}
          \gdef\accord{}
        }{
          \gdef\thesetype{\textbf{\MakeUppercase{thesis subject}}}
          \gdef\thesegrade{\textbf{\MakeUppercase{philosophi\ae{} doctor (Ph.D.) in the subject of \expandafter\expandafter{\@programme}}}}
          \gdef\accord{}
        }
    }{
      \ifthenelse{\equal{\@uqacmemoire}{true}}{%
        \ifthenelse{\equal{\@uqacfrench}{true}}{%
            \gdef\thesetype{\textbf{\MakeUppercase{m\'emoire}}}
            \gdef\thesegrade{\textbf{\MakeUppercase{ma\^itre \`es sciences en \expandafter\expandafter{\@programme}}}}
          \gdef\accord{}
        }{
          \gdef\thesetype{\textbf{\MakeUppercase{master thesis}}}
            \gdef\thesegrade{\textbf{\MakeUppercase{master of science in the subject of \expandafter\expandafter{\@programme}}}}
          \gdef\accord{}
        }
      }{
        \ifthenelse{\equal{\@uqacessai}{true}}{%
          \ifthenelse{\equal{\@uqacfrench}{true}}{%
              \gdef\thesetype{\textbf{\MakeUppercase{essai}}}
              \gdef\thesegrade{\textbf{\MakeUppercase{ma\^itre \`es sciences en \expandafter\expandafter{\@programme}}}}
            \gdef\accord{}
          }{
            \gdef\thesetype{\textbf{\MakeUppercase{research essay}}}
              \gdef\thesegrade{\textbf{\MakeUppercase{master of science in the subject of \expandafter\expandafter{\@programme}}}}
            \gdef\accord{}
          }
        }{
          \ifthenelse{\equal{\@uqacrapport}{true}}{%
            \ifthenelse{\equal{\@uqacfrench}{true}}{%
                \gdef\thesetype{\textbf{\MakeUppercase{rapport de recherche}}}
                \gdef\thesegrade{\textbf{\MakeUppercase{ma\^itre \`es sciences en \expandafter\expandafter{\@programme}}}}
              \gdef\accord{}
            }{
              \gdef\thesetype{\textbf{\MakeUppercase{research report}}}
                \gdef\thesegrade{\textbf{\MakeUppercase{master of science in the subject of \expandafter\expandafter{\@programme}}}}
              \gdef\accord{}
            }
          }
        }
      }
    }
  }
}

\newpage\null\thispagestyle{empty}\newpage

\def\maketitle{\begin{titlepage}
\begin{doublespace}
\begin{center}

\includegraphics[width=1.5in]{logo-uqac}

\vfill

{\textbf{\MakeUppercase{\@title}}}\\
\vfill

\textbf{\MakeUppercase{par \expandafter{\@author}}}
\vfill

\thesetype{}
\ifthenelse{\equal{\@uqacfrench}{true}}{%
	\textbf{\MakeUppercase{pr\'esent\'e\accord{} à l'université du québec à chicoutimi comme exigence partielle en vue de l'obtention du grade de}}
}{
	\textbf{\MakeUppercase{presented to l'université du québec à chicoutimi in partial fulfillment of the requierments for the degree of}}
}
\thesegrade{}
\ifx\@concentration\empty
\else
\textbf{\MakeUppercase{\@concentration}}
\fi
\vfill

\textbf{\MakeUppercase{qu\'ebec, canada}}
\vfill

\textbf{\MakeUppercase{\textsuperscript{\textcopyright} \@author, \@degreeyear}}
\vfill

\thispagestyle{empty}

\end{center}
\end{doublespace}
\end{titlepage}
}