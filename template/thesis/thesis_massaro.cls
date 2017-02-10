% vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{{,}}} foldlevel=0 foldmethod=marker:
%
%                                   _      _
%                   _o)   __ _  ___/ /__ _/ /_  __ _  (o_
%%%%%%%%%%%%%%%%%   /\\  /  ' \/ _  / _ `/ _  \/  ' \ //\   %%%%%%%%%%%%%%%%%%
%                   \_v /_/_/_/\_,_/\_, /_/ /_/_/_/_/ v_/
%                                  /___/
%
% Author:       Michel Massaro
% Version :     V1.0
% Date :        02/01/17
% Description : Personnal class to write a report (thesis)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis_massaro}[2017/01/02 Personnal class, V1.0]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Classe de base                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,11pt,twoside,openright]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Extensions                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{cmap}               % Better search and copy with Adobe
\RequirePackage[T1]{fontenc}        % Police contenant les caracteres francais
\RequirePackage[utf8x]{inputenc}     % Choix de l'encodage
\RequirePackage[francais]{babel}    % Placez ici une liste de langues

\RequirePackage{amsfonts}           % American Mathematical Society
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}

\RequirePackage{stmaryrd}           % Mathematical symbols
\RequirePackage{units}              % Physical units
\RequirePackage{todonotes}          % List of todos
\RequirePackage{subcaption}         % Multiple caption in figures
\RequirePackage{mathrsfs}           % Script fonts
\RequirePackage{url}                % linkable references
\RequirePackage{listings}           % Add piece of codes
\RequirePackage{color}              % For colors

\RequirePackage{geometry}           % Definir les marges
\RequirePackage{fancyhdr}           % En-tete et pied de page
\renewcommand{\footrulewidth}{0.4pt}
  \pagestyle{fancy}                 % Indique que le style sera fancy
  \lfoot[\thepage]{}                % gauche du pied de page
  \cfoot{}                          % milieu du pied de page
  \rfoot[]{\thepage}                % droite du pied de page
  \fancyhead[RO, LE] {}             % En-tete
  \fancyfoot[RE, LO] {\MakeUppercase{Titre en pied de page}}

\RequirePackage{moreverb}           % More verbatim
\RequirePackage{latexsym}           % Latex symbols
\RequirePackage{bbm}                % fonts doubles (pour les ensembles, ...)
\RequirePackage{graphicx}           % pour d'eventuelles figures
\RequirePackage{tikz}               % pour d'eventuelles figures
\usetikzlibrary[patterns]
\usetikzlibrary{external}
  \tikzexternalize%

\RequirePackage{epsfig}             % (preferer graphicx, si possible)
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\RequirePackage{authblk}
\RequirePackage{pifont}
\RequirePackage{calc}
\RequirePackage{time}
\RequirePackage{psfrag}
\RequirePackage{dsfont}
\RequirePackage{array}
\RequirePackage{cases}
\RequirePackage{xparse}
\RequirePackage{hyperref}
\RequirePackage{comment}
\RequirePackage{bbold}
\RequirePackage{breqn}              % Couper les longues Ã©quations
\RequirePackage{float}
\RequirePackage[francais]{minitoc}  % Pour le sommaire dans chaque chapitre
\RequirePackage{qrcode}
\RequirePackage[french]{nomencl}
\RequirePackage{epigraph}           % citation
\RequirePackage[french]{varioref}   % numero de page dans les reference
\RequirePackage{varioref} 
\RequirePackage{etoolbox}           % use toggle
\RequirePackage{setspace}
\RequirePackage{ifthen}
\RequirePackage[final]{pdfpages}    % Include First and last page

\RequirePackage{lipsum}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Some configurations                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Links color
\hypersetup{
  colorlinks=true,
  breaklinks=true,
  urlcolor=blue,
  linkcolor=blue,
  citecolor=green
}

% deal with todo and tikzexternalize
\makeatletter
\renewcommand{\todo}[2][]{\tikzexternaldisable\@todo[#1]{#2}\tikzexternalenable}
\makeatother

% fixe position of tables
\restylefloat{table}

% Minitoc depth
\setcounter{minitocdepth}{2}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Format de la page                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\textheight=8.2 true in
\textwidth=5.0 true in
\topmargin 30pt
\setcounter{page}{1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Raccourcis                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Z}{\ensuremath{\mathds{Z}}}
\newcommand{\C}{\ensuremath{\mathds{C}}}
\newcommand{\R}{\ensuremath{\mathds{R}}}
\newcommand{\Q}{\ensuremath{\mathds{Q}}}
\newcommand{\N}{\ensuremath{\mathds{N}}}

% Partial derivative
\newcommand{\dt}{\ensuremath{\partial_t}}
\newcommand{\dx}{\ensuremath{\partial_x}}
\newcommand{\dy}{\ensuremath{\partial_y}}
\newcommand{\dz}{\ensuremath{\partial_z}}

% Derivative operator
\newcommand{\rot}{\ensuremath{\nabla \times}}
\newcommand{\divv}{\ensuremath{\nabla \cdot}}
\newcommand{\grad}{\ensuremath{\nabla}}

%petit o et grand o
\newcommand{\bigO}[1]{\ensuremath{\mathop{}\mathopen{}\mathcal{O}\mathopen{}\left(#1\right)}}
\newcommand{\smallO}[1]{\ensuremath{\mathop{}\mathopen{}{\scriptstyle\mathcal{O}}\mathopen{}\left(#1\right)}}

% Vector
\newcommand{\vect}[1]{\ensuremath{\mathbf{#1}}}

% Scalar product need vector
\newcommand{\scal}[2]{\ensuremath{\vect{#1}\cdot\vect{#2}}}

% Domain
\newcommand{\timeDomain}{\ensuremath{\left[0, T\right]}}

% Jump
\newcommand{\jump}[1]{\ensuremath{\left[\!\!\left[ #1 \right]\!\!\right]}}

\newcommand{\numeq}[1]{\begin{equation} \text{#1} \end{equation}}
\newcommand{\nnumeq}[1]{\begin{equation*} \text{#1} \end{equation*}}

\newcommand{\tbf}[1]{\textbf{#1}}
\newcommand{\etal}{\textit{et al. }}
\newcommand{\diff}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\diffd}[3]{%
    \if#2#3%
        \frac{\partial ^2#1}{\partial #2^2}%
    \else%
        \frac{\partial ^2#1}{\partial #2 \partial #3}%
    \fi}

\newcommand{\sdiff}[2]{\partial_{#2} (#1)}
\newcommand{\sdiffd}[3]{\partial_{#2#3}(#1)}

\newcommand{\intervalleoo}[2]{\mathopen{\rbrack}#1\,;#2\mathclose{\lbrack}}
\newcommand{\intervalleof}[2]{\mathopen{\rbrack}#1\,;#2\mathclose{\rbrack}}
\newcommand{\intervallefo}[2]{\mathopen{\lbrack}#1\,;#2\mathclose{\lbrack}}
\newcommand{\intervalleff}[2]{\mathopen{\lbrack}#1\,;#2\mathclose{\rbrack}}

\newcommand{\pg}{\ensuremath{\boldsymbol\xi}}
\newcommand{\pgref}{\ensuremath{\widehat{\boldsymbol\xi}}}
\newcommand{\wpg}{\ensuremath{\lambda}}
\newcommand{\wpgref}{\ensuremath{\widehat{\lambda}}}

\newcommand*{\intervalle}[4]{\mathopen{\left{#1}}#2\mathclose{}\mathpunct{};#3\mathclose{\right{#4}}}



%utilise xparse
\NewDocumentCommand{\incl}{m g}{%
    \begin{figure}[!h]
    \includegraphics[width=5cm]{#1}%
    \IfNoValueF{#2}{\hspace{0.5cm}\includegraphics[width=5cm]{#2}}
    \end{figure}
}

\NewDocumentCommand{\inclwc}{m m g}{%
    \begin{figure}[!h]
    \includegraphics[width=5cm]{#2}%
    \IfNoValueF{#3}{\hspace{0.5cm}\includegraphics[width=5cm]{#3}}
    \caption{#1}
    \end{figure}
}


\providecommand{\keywords}[1]{\tbf{\textit{Keywords--}} #1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Informations                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\title{Untitled Project of Michel Massaro}
%\date{}
%\author[1]{Michel Massaro\footnote{IRMA, 7 rue Ren\'e Descartes,
%67084 Strasbourg, France.\\
%Email : massaro@math.unistra.fr}}


