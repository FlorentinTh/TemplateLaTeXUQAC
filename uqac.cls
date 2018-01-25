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
\RequirePackage{graphicx}
\RequirePackage{url}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{ifthen}
\RequirePackage[explicit]{titlesec}
\RequirePackage{natbib}
\RequirePackage[french]{babel}
\RequirePackage{regexpatch}
\RequirePackage{titletoc}
\RequirePackage{acronym} 
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Francisation des 
%% termes de la classe report
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Indentation des sections
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\section{\@startsection{section}{1}%
                                    {\z@}%
                                    {2ex\@plus.2ex\@minus.2ex}%
                                    {2ex \@plus.2ex}%
                                    {\normalfont\scshape\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {3ex\@plus .2ex \@minus .2ex}%
                                     {2ex \@plus .2ex}%
                                     {\normalfont\scshape\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {3ex\@plus .2ex \@minus .2ex}%
                                     {2ex \@plus .2ex}%
                                     {\normalfont\normalsize\scshape\bfseries}}

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
\RequirePackage{caption}

%% Espacements avant et après les figures
\BeforeBeginEnvironment{figure}{\vspace{1cm}}
\AfterEndEnvironment{figure}{\vspace{-0.5cm}}

%% Espacements avant et après les tableaux
\BeforeBeginEnvironment{table}{\vspace{0.5cm}}
\AfterEndEnvironment{table}{\vspace{-0.5cm}}

%% Formatage des captions pour les figures et les tableaux 
\captionsetup[figure]{position=bottom, labelfont={bf, small, stretch=1.17}, labelsep=colon, textfont={bf, small, stretch=1.17}, justification=justified}
\captionsetup[table]{position=top, margin=0.5cm, labelfont={bf, small, stretch=1.17}, labelsep=colon, textfont={bf, small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}
\DeclareCaptionLabelSeparator{colon}{ : }

%%%%%%%%%%%%%%%%%%%%%
%%
%% Table des matieres
%%
%%%%%%%%%%%%%%%%%%%%%

\newcommand\l@specialchapitre {\@dottedtocline{1}{0em}{0em}}

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
        {#7} \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}
  \fi
  \@xsect{#5}}

\renewcommand\l@chapter{\@dottedtocline{0}{0em}{0em}}
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
\titlecontents{figure}
 [0em]{}
{\MakeUppercase{figure}\space\thecontentslabel\space\textendash\space}
 {}{\ \titlerule*[8pt]{$\cdot$}\contentspage}
%%

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

%% Préfixer la référence du tableau par le mot "tableau" en majuscules
\titlecontents{table}
 [0em]{}
{\MakeUppercase{tableau}\space\thecontentslabel\space : }
 {}{\ \titlerule*[8pt]{$\cdot$}\contentspage}
%%

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
  \chapter*{\textbf{\UpperRef{Liste des Abr\'eviations}}}
  \addtocontents{toc}{\protect\vspace{1.5ex}}
  \addcontentsline{toc}{chapter}{\bfseries\UpperRef{Liste des Abr\'eviations}}
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

%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Dédicace
%%
%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{dedic}{%
\chapter*{\textbf{\MakeUppercase{D\'edicace}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{D\'edicace}}
\vspace*{.35cm}
\baselineskip=\simpleinter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Remerciements
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{ack}{%
\chapter*{\textbf{\MakeUppercase{Remerciements}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Remerciements}}
\vspace*{.35cm}
\baselineskip=\simpleinter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Environnement Avant-propos
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{preface}{%
\chapter*{\textbf{\MakeUppercase{Avant-propos}}}
\addtocontents{toc}{\protect\vspace{1.5ex}}
\addcontentsline{toc}{chapter}{\bfseries\UpperRef{Avant-propos}}
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
  \gdef\thesetype{\textbf{\MakeUppercase{th\`ese}}}
   \gdef\thesegrade{\textbf{\MakeUppercase{philosophiae doctor en \expandafter\expandafter{\@programme}}}}
   \gdef\accord{e}
}{%
	\ifthenelse{\equal{\@uqacprojthese}{true}}{%
  		\gdef\thesetype{\textbf{\MakeUppercase{projet de th\`ese}}}
   		\gdef\thesegrade{\textbf{\MakeUppercase{philosophiae doctor en \expandafter\expandafter{\@programme}}}}
   		\gdef\accord{}
	}{
		\ifthenelse{\equal{\@uqacmemoire}{true}}{%
	  		\gdef\thesetype{\textbf{\MakeUppercase{m\'emoire}}}
		   	\gdef\thesegrade{\textbf{\MakeUppercase{ma\^itre \`es sciences en \expandafter\expandafter{\@programme}}}}
			\gdef\accord{}
		}{
			\ifthenelse{\equal{\@uqacessai}{true}}{%
		  		\gdef\thesetype{\textbf{\MakeUppercase{essai}}}
			   	\gdef\thesegrade{\textbf{\MakeUppercase{ma\^itre \`es sciences en \expandafter\expandafter{\@programme}}}}
				\gdef\accord{}
			}{
				\ifthenelse{\equal{\@uqacrapport}{true}}{%
			  		\gdef\thesetype{\textbf{\MakeUppercase{rapport de recherche}}}
				   	\gdef\thesegrade{\textbf{\MakeUppercase{ma\^itre \`es sciences en \expandafter\expandafter{\@programme}}}}
					\gdef\accord{}
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
\textbf{\MakeUppercase{pr\'esent\'e\accord{} comme exigence partielle en vue de l'obtention du grade de }}
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
