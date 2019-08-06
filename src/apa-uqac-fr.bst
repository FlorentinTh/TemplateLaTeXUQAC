% Bibtex `apalike-uqam'
% Gisele Legault, 28 aout 2013.
% construit sur le style `apalike2'.
% Changements:
%  1) francisation des mots et des fonctions fr.XXX, exemple fr.and, fr.editeur
%     etc... . Utilise apalike-fr
%     http://www.lsv.ens-cachan.fr/~markey/BibTeX/bst/apalike-fr.bst
%  2) ajout des champs url, doi et support
%     exemple support: DVD, document electronique, logiciel.
%  3) modifie output.year.check pour que "sans date" apparaisse
%     entre [] et non ()
%  4) modifie fin.entry pour n'ajoute pas de point si la reference se termine
%     par un url ou doi
%  5) modifie format.name -- utilisation de fr.et.al et fr.and
%     modifie format.editors et eho.format.editors -- utilisation de fr.editeur %     et fr.editeurs
%     modifie format.bvolume -- utilisation de fr.volume et fr.of
%     modifie format.number.series pour qu'il utilise fr.number et
%     fr.number.maj et fr.in.spc
%     modifie format.edition -- utilisation de fr.edtion
%     modifie format.pages -- utilisation de fr.page et fr.pages + retire la
%     parenthese a la fin du format.pages
%     modifie format.vol.num.pages -- volume en italique (emphasize)
%     modifie format.chapter.pages -- utilisation de fr.chapter
%     modifie format.in.ed.booktitle -- utilisation de fr.in et
%     eho.format.editors et remplace virgule par point
%     modifie format.thesis.type -- ajoute parentheses
%     modifie format.tr.number -- utilisation de fr.tech.rep
%     modifie format.article.crossref et format.incoll.inproc.crossref  --
%     utilisation de fr.in
%     modifie format.book.crossref --utilisation de fr.in et fr.of
%  6) ajout des fonctions format.doi, format.url et format.support
%  7) ajout de format.support, format.doi, format.url dans fonction article
%  8) deplace format.edition apres le titre et ajout format.support, format.doi
%     et format.url dans fonction book
%  9) ajout des fonctions output.nonnull.point et output.point
% 10) ajout de format.url dans fonction book
% 11) ajout de format.support apres booktitle + format.url dans
%     function{inproceedings}
% 12) utilisation de format.btitle, format.support, format.doi et
%     format.url dans function{mastersthesis}
% 13) ajout de format.support, format.doi et format.url dans function{misc}
% 14) utilisation de fr.phd + ajout de format.support, format.doi et
%     format.url dans function{misc}
% 15) ajout de format.doi et format.url dans function{proceedings}
% 16) utilisation de fr.et.al et fr.and dans function{format.lab.names}
% 17) utilisation de fr.et.al dans function{sort.format.name}
% 18) ajout execute{init.variables}
% 2 novembre 2016
% 19) ajout du champ urldate
% 20) modifie variable urlintro (retire "de")
% 21) modifie format.url pour y ajouter la date de recuperation

% BibTeX `apalike' bibliography style (24-Jan-88 version)
% Adapted from the `alpha' style, version 0.99a; for BibTeX version 0.99a.
% Copyright (C) 1988, all rights reserved.
% Copying of this file is allowed, provided that if you make any changes at all
% you name it something other than `apalike.bst'.
% This restriction helps ensure that all copies are identical.
% Differences between this style and `alpha' are generally heralded by a `%'.
% The file btxbst.doc has the documentation for alpha.bst.
%
% This style should be used with the `apalike' LaTeX style (apalike.sty).
% \cite's come out like "(Jones, 1986)" in the text but there are no labels
% in the bibliography, and something like "(1986)" comes out immediately
% after the author.  Author (and editor) names appear as last name, comma,
% initials.  A `year' field is required for every entry, and so is either
% an author (or in some cases, an editor) field or a key field.
%
% Editorial note:
% Many journals require a style like `apalike', but I strongly, strongly,
% strongly recommend that you not use it if you have a choice---use something
% like `plain' instead.  Mary-Claire van Leunen (A Handbook for Scholars,
% Knopf, 1979) argues convincingly that a style like `plain' encourages better
% writing than one like `apalike'.  Furthermore the strongest arguments for
% using an author-date style like `apalike'---that it's "the most practical"
% (The Chicago Manual of Style, University of Chicago Press, thirteenth
% edition, 1982, pages 400--401)---fall flat on their face with the new
% computer-typesetting technology.  For instance page 401 anachronistically
% states "The chief disadvantage of [a style like `plain'] is that additions
% or deletions cannot be made after the manuscript is typed without changing
% numbers in both text references and list."  LaTeX sidesteps the disadvantage.
%
% History:
%   15-sep-86	(SK,OP)	Original version, by Susan King and Oren Patashnik.
%   10-nov-86	(OP)	Truncated the sort.key$ string to the correct length
%			in bib.sort.order to eliminate error message.
%   24-jan-88	(OP)	Updated for BibTeX version 0.99a, from alpha.bst 0.99a;
%			apalike now sorts by author, then year, then title;
%			THIS `apalike' VERSION DOES NOT WORK WITH BIBTEX 0.98i.
% Local modifications 10/89 -- Brian Reiser

ENTRY
  { address
    author
    booktitle
    chapter
    doi
    edition
    editor
    howpublished
    institution
    journal
    key
%    month		not used in apalike
    note
    number
    organization
    pages
    publisher
    school
    series
    support
    title
    type
    url
    urldate  % ajout G.L. 2/11/2016
    volume
    year
  }
  {}
  { label extra.label sort.label }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% C'est ici que je definis les "traductions". Normalement, y a
%% que ca a changer pour franciser le style...
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION{fr.and}{		%% le "et" entre les deux derniers auteurs
" et "
}

FUNCTION{fr.editeur}{		%% ", \'editeur" au singulier, ou " (\'editeur)"...
" (dir.)"
}

FUNCTION{fr.editeurs}{		%% ", \'editeurs" au pluriel, ou " (\'editeurs)"...
" (dir.)"
}

FUNCTION{fr.et.al}{		%% " et~al."
" \emph{et~al.}"
}

FUNCTION{fr.in}{		%% "Dans "
"Dans "
}

FUNCTION{fr.in.spc}{		%% " de " (ou " de la s\'erie ")
" de "
}

FUNCTION{fr.of}{		%% " de "
" de "
}

FUNCTION{fr.number}{		%% "num{\'e}ro "
"num\'ero "
}

FUNCTION{fr.number.maj}{	%% "Num\'ero "
"Num\'ero "
}

FUNCTION{fr.volume}{		%% "volume"
"volume"
}

FUNCTION{fr.volume.maj}{	%% "Volume"
"Volume"
}

FUNCTION{fr.edition}{		%% " \'edition"
" \'ed."
}

FUNCTION{fr.pages}{		%% "pages"
""
}

FUNCTION{fr.page}{		%% "page"
"p.~"
}

FUNCTION{fr.chapter}{		%% "chapitre"
"chapitre"
}

FUNCTION{fr.tech.rep}{		%% "Rapport Technique"
"Rapport technique"
}

FUNCTION{fr.master}{		%% "M\'emoire de maîtrise."
"(M\'emoire de ma\^itrise)"
}

FUNCTION{fr.phd}{		%% "Th\`ese de doctorat"
"(Th\`ese de doctorat)"
}

FUNCTION{sans.date}{		%% "sans date"
"s.d."
}

STRINGS { urlintro doiprefix doiurl }

FUNCTION{init.variables}
{
  "R\'ecup\'er\'e" 'urlintro := % prefix before URL; typically "Available from:" or "URL":
  "http://dx.doi.org/" 'doiurl := % prefix to make URL from DOI
  "" 'doiprefix :=      % text prefix printed before DOI ref; typically "doi:"
}

MACRO {jan} {"janvier"}
MACRO {feb} {"f\'evrier"}
MACRO {mar} {"mars"}
MACRO {apr} {"avril"}
MACRO {may} {"mai"}
MACRO {jun} {"juin"}
MACRO {jul} {"juillet"}
MACRO {aug} {"ao\^ut"}
MACRO {sep} {"septembre"}
MACRO {oct} {"octobre"}
MACRO {nov} {"novembre"}
MACRO {dec} {"d\'ecembre"}

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {eho.special.output.nonnull}
{ 's :=
  output.state mid.sentence =
    { "  " * write$ }
    { output.state after.block =
	{ % add.period$ write$
	  ": " write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { % add.period$ " " * write$
	      ": " * write$
            }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {eho.special.output}
{ duplicate$ empty$
    'pop$
    'eho.special.output.nonnull
  if$
}

%% Added by Eric Ho <eho@word> on Wed Jan 10 20:13:56 1990
%% A special patch for output.nonnull in book environment.

FUNCTION {eho.output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ": " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output.nonnull.point}
{ 's :=
  output.state mid.sentence =
    { ". " * write$ }
    { output.state after.block =
    { add.period$ write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

%% Added by Eric Ho <eho@word> on Wed Jan 10 20:13:56 1990
%% A special patch for output in book environment.

FUNCTION {eho.output}
{ duplicate$ empty$
    'pop$
    'eho.output.nonnull
  if$
}

FUNCTION {output.point}
{ duplicate$ empty$
    'pop$
    'output.nonnull.point
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

%% Added by Eric Ho <eho@word> on Wed Jan 10 20:13:56 1990
%% A special patch for output.check in book environment.

FUNCTION {eho.output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'eho.output.nonnull
  if$
}

%					apalike needs this function because
%					the year has special punctuation;
%					apalike ignores the month
FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { write$
    year sans.date =	            %UQAM G.L. 28/08/2013
      {                             %
      " [" sans.date * "]" *        %
      }                             %
           {
      " (" year * extra.label * ")" *
      }
      if$
      mid.sentence 'output.state :=
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {fin.entry}
{doi empty$						%UQAM G.L. 28/08/2013
 url empty$                     %
 and                            %
  {add.period$}
  {skip$}
  if$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}



FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=   % last name first
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 =    %UQAM pas de virgule devant "et" s'il reste 2 auteurs G.L. 03/09/2013
		{ " " * }          %UQAM  G.L. 03/09/2013
		'skip$
	      if$
	      t "others" =
		{ fr.et.al * }		%UQAM G.L. 28/08/2013
		{ fr.and * t * }    %
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

%% Added by Fri Jan 12 19:03:22 1990 on Fri Jan 12 19:03:27 1990
%% Mainly to make sure that editors have initials before last names.

FUNCTION {eho.format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.} {vv~}{ll}{, jj}" format.name$ 't :=  %% initials first.
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ fr.et.al * }		%UQAM G.L. 28/08/2013
		{ fr.and * t * }    % changed from " and " for names -- BJR 10/5/89
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.key}			% this function is just for apalike
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ fr.editeurs * }    %UQAM G.L. 28/08/2013
	{ fr.editeur * }     %UQAM G.L. 28/08/2013
      if$
    }
  if$
}

%% Added by Eric Ho <eho@word> Fri Jan 12 19:11:12 1990
%% Mainly to call eho.format.names instead of format.names and
%% to make Eds or Ed to be surrounded by pararentheses instead of preceeded by
%% a comma.

FUNCTION {eho.format.editors}
{ editor empty$
    { "" }
    { editor eho.format.names
      editor num.names$ #1 >
	{ fr.editeurs * }    %UQAM G.L. 28/08/2013
	{ fr.editeur * }     %UQAM G.L. 28/08/2013
	      if$
    }
  if$
}


FUNCTION {format.doi}
{
  doi empty$
    { "" }
    {doiprefix "\url{" * doiurl * doi * "}" *}

  if$
}

FUNCTION {format.url}
{ url empty$
   { "" }
   { urlintro
          urldate empty$                          %UQAM G.L. 2/11/2016 ajout de date de recuperation
         { "there is url but no urldate in " cite$ * warning$ }
         {
            "~le " * urldate *
         }
         if$
       " de \url{" * url * "}" * }
   if$
}


FUNCTION {format.support}
{ support empty$
    { "" }
    { " [" support * "]" *}
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}


FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { fr.volume volume tie.or.space.connect	    %UQAM G.L. 28/08/2013
      series empty$
	'skip$
	{ fr.of * series emphasize * }				%UQAM G.L. 28/08/2013
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
	{ series field.or.null }
	{ output.state mid.sentence =
	    { fr.number }						%UQAM G.L. 28/08/2013
	    { fr.number.maj }					%UQAM G.L. 28/08/2013
	  if$
	  number tie.or.space.connect
	  series empty$
	    { "there's a number but no series in " cite$ * warning$ }
	    { fr.in.spc * series * }			%UQAM G.L. 28/08/2013
	  if$
	}
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
	{ "(" edition "l" change.case$ * fr.edition * ")" * }	%UQAM G.L. 28/08/2013
	{ "(" edition "t" change.case$ * fr.edition * ")" * }	%UQAM G.L. 28/08/2013
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
	{ fr.pages pages n.dashify tie.or.space.connect }	%UQAM G.L. 28/08/2013
	{ fr.page pages tie.or.space.connect }				%UQAM G.L. 28/08/2013
      if$
      "." *								%UQAM retirer ")"   G.L. 28/08/2013
    }
  if$
}

FUNCTION {format.pages.inbook}                              %UQAM G.L.  02/06/2015
{ pages empty$
    { "" }
    { pages multi.page.check
	{ "(" fr.page * pages n.dashify tie.or.space.connect }	%UQAM G.L. 02/06/2015
	{ "(" fr.page * pages tie.or.space.connect }			%UQAM G.L. 02/06/2015
      if$
      ")." *								
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume emphasize field.or.null						%UQAM Vol en italique G.L. 28/08/2013
  number empty$
    'skip$
    { "(" number * ")"  * *
      volume empty$
	{ "there's a number but no volume in " cite$ * warning$ }
	'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ ", " * pages n.dashify * }    % changed from ":" for vol,pgs -- BJR 10/5/89
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
	{ fr.chapter }										%UQAM G.L. 28/08/2013
	{ type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
	'skip$
	{ ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ fr.in booktitle emphasize * }									%UQAM G.L. 28/08/2013
	{ fr.in eho.format.editors * ". " * booktitle emphasize * }     %UQAM remplace "," par "." G.L. 28/08/2013
      if$
    }
  if$
}

%% Added by Eric Ho <eho@word> Fri Jan 12 19:17:37 1990
%% Primarily to call eho.format.editors instead of format.editors.

FUNCTION {eho.format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ "In " booktitle emphasize * }
	{ "In " eho.format.editors * ", " * booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{
  type empty$
    'skip$
    { pop$
      "(" type "t" change.case$ * ")" *      %UQAM ajout "(" ")" G.L. 28/08/2013
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { fr.tech.rep }						   %UQAM G.L. 28/08/2013
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ fr.in							          %UQAM terme francais G.L. 28/08/2013
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      fr.in								%UQAM terme francais G.L. 28/08/2013
    }
    { "Volume" volume tie.or.space.connect
      fr.of *							%UQAM terme francais G.L. 28/08/2013
    }
  if$
  "\cite{" * crossref * "}" *				% this is for apalike
}

FUNCTION {format.incoll.inproc.crossref}
{ fr.in							%UQAM terme francais G.L. 28/08/2013
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "title" output.check
  format.support output.point			%UQAM ajout support G.L. 28/08/2013
  new.block
  crossref missing$
    { journal emphasize "journal" output.check
      format.vol.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  format.doi output					%UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output					%UQAM ajout url G.L. 28/08/2013
  fin.entry
}

%% Modified by Eric Ho <eho@word> on Wed Jan 10 20:30:11 1990
%% Making it to call eho.output.check instead of output.check and eho.output
%% instead of output.

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
   {
      %UQAM ajout add.period$ dans le cas o l'auteur est un D.B. ou site web G.L. 03/09/2013
      format.authors add.period$ output.nonnull
       crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  output.year.check				% special for apalike
  new.block
  format.btitle "title" output.check
  format.edition eho.special.output     % UQAM edition apres titre G.L. 28/08/2013
  format.support output.point           % UQAM ajout support G.L. 28/08/2013
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      address eho.output	% Using eho.output instead of output.
      publisher "publisher" eho.output.check	% Using eho.output.check
      						% instead of output.check.
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
   new.block
  note output
 format.doi output				%UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output				%UQAM ajout url G.L. 28/08/2013
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "title" output.check
  new.block
  howpublished output
  address output
  new.block
  note output
  format.doi output				%UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output			%UQAM ajout url G.L. 28/08/2013

  fin.entry
}

FUNCTION {database} { book }

FUNCTION {electronic} { book }

%% Modified by Eric Ho <eho@word> on Wed Jan 10 20:27:26 1990
%% Making it to call eho.output.check instead of output.check and eho.output
%% instead of output.

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  output.year.check				% special for apalike
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check     % UQAM titre du livre 02/06/2015
      format.support  output.point			              % UQAM ajout support apres titre G.L. 28/08/2013
      format.bvolume output
      format.pages.inbook  "chapter and pages" output.check  %UQAM G.L. Mise en forme des pages 02/06/2015
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" eho.output.check	% Using eho.output.check instead
						% of output.check.
      address eho.output	% Using eho.output instead of output.
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  new.block
  note output
  fin.entry
}

%% Modified by Eric Ho <eho@word> on Wed Jan 10 20:27:26 1990
%% Making it to call eho.output.check instead of output.check and eho.output
%% instead of output.  Also modified by Eric Ho <eho@word> on Fri Jan 12
%% 19:21:59 1990 so as to call eho.format.in.ed.booktitle instead of the old
%% format.in.ed.booktitle.

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { eho.format.in.ed.booktitle "booktitle" output.check
	% The above line is changed by Eric Ho <eho@word> on Fri Jan 12
	% 19:20:28 1990 so that it'll call eho.format.in.ed.booktitle instead
	% of format.in.ed.booktitle.

      format.bvolume output
      format.number.series output
      format.chapter.pages eho.special.output
      new.sentence
%      publisher "publisher" output.check
%      address output
% switched order of publisher and address for incollection -- BJR 1/3/90
      address eho.output	% Use eho.output instead of output.
      publisher "publisher" eho.output.check	% Use eho.output.check instead
						% of output.check.
      format.edition output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.support  output.point			% UQAM ajout support apres titre G.L. 28/08/2013
      format.bvolume output
      format.number.series output
      format.pages output
      address output			% for apalike
      new.sentence					% there's no year
      organization output			% here so things
      publisher output			% are simpler
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  format.doi output				% UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output				% UQAM ajout url G.L. 28/08/2013
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "title" output.check
  organization address new.block.checkb
  organization output
  address output
  format.edition output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "title" output.check	% UQAM Titre en italique G.L. 28/08/2013
  new.block
  fr.master format.thesis.type output.nonnull	% UQAM terme francais G.L. 28/08/2013
  format.support output.point					% UQAM ajout support G.L. 28/08/2013
  new.block
  school "school" output.check
  address output
  new.block
  note output
  format.doi output				% UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output			    % UQAM ajout url G.L. 28/08/2013
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title output
  new.block
  howpublished output
  new.block
  format.support output.point	% UQAM support url G.L. 28/08/2013
  new.block
  note output
  format.doi output		% UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output		% UQAM ajout url G.L. 28/08/2013

  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "title" output.check
  new.block
  fr.phd format.thesis.type output.nonnull	% UQAM terme francais G.L. 28/08/2013
  format.support output.point		% UQAM ajout support G.L. 28/08/2013
  new.block
  school "school" output.check
  address output
  new.block
  note output
  format.doi output					% UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output					% UQAM ajout url G.L. 28/08/2013
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output				% special for
  output.year.check					% apalike
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address output				% for apalike
  new.sentence					% we always output
  organization output				% a nonempty organization
  publisher output				% here
  new.block
  note output
  format.doi output		        % UQAM ajout doi G.L. 28/08/2013
  new.block
  format.url output				% UQAM ajout url G.L. 28/08/2013
  fin.entry
}

FUNCTION {software} { book }


FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
%  format.title "title" output.check
  format.btitle "title" output.check            % change to ital title -- BJR
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  fin.entry
}

FUNCTION {webpage} { book }

FUNCTION {default.type} { misc }

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%			There are three apalike cases: one person (Jones),
%			two (Jones and de~Bruijn), and more (Jones et~al.).
%			This function is much like format.crossref.editors.
%
FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ fr.et.al * }		% UQAM terme francais G.L. 28/08/2013
    { #2 <
	'skip$
	{ s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { fr.et.al * }		% UQAM terme francais G.L. 28/08/2013
	    { fr.and * s #2 "{vv~}{ll}" format.name$ * } % " and " --  BJR 10/5/89
	  if$
	}
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key					% apalike uses the whole key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    'key				% apalike uses the whole key
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{
  editor empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key			% apalike uses the whole key, no organization
      if$
    }
    { editor format.lab.names }
  if$

}


FUNCTION {calc.label}
{
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	    'editor.key.label			% apalike ignores organization
        'author.key.label
      if$
    }
  if$
  ", "							% these three lines are
  *							% for apalike, which
  year field.or.null purify$ #-1 #4 substring$     % uses all four digits
  *
  'label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$						% apalike uses initials
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't := % <= here
      nameptr numnames = t "others" = and
	{ fr.et.al * }				% UQAM terme francais G.L. 28/08/2013
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}


FUNCTION {editor.sort}
{
  editor empty$
    { key empty$
	{ "to sort, need editor or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

%			apalike uses two sorting passes; the first one sets the
%			labels so that the `a's, `b's, etc. can be computed;
%			the second pass puts the references in "correct" order.
%			The presort function is for the first pass. It computes
%			label, sort.label, and title, and then concatenates.
FUNCTION {presort}
{
  calc.label

  label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	    'editor.sort
        'author.sort
      if$
    }
  if$
  #1 entry.max$ substring$	% for
  'sort.label :=		% apalike
  sort.label			% style
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT		% by label, sort.label, title---for final label calculation

STRINGS { last.label next.extra }	% apalike labels are only for the text;

INTEGERS { last.extra.num }		% there are none in the bibliography

FUNCTION {initialize.extra.label.stuff}	% and hence there is no `longest.label'
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  label extra.label * 'label :=
  extra.label 'next.extra :=
}

EXECUTE {initialize.extra.label.stuff}

ITERATE {forward.pass}

REVERSE {reverse.pass}

%				Now that the label is right we sort for real,
%				on sort.label then year then title.  This is
%				for the second sorting pass.
FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT		% by sort.label, year, title---giving final bibliography order

FUNCTION {begin.bib}
{ preamble$ empty$				% no \etalchar in apalike
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{}" write$ newline$		% no labels in apalike
}

EXECUTE {begin.bib}
EXECUTE {init.variables}      % urlbst UQAM initialisation francais G.L. 28/08/2013
EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
