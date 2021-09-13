% Florentin Thullier, juin 2021.
% based on `apalike2'.
%
%%
% CHANGES
% report every changes below :
%

ENTRY
{
  address
  assignee
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
  month
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
  university
  url
  urldate
  volume
  year
}
{}
{ label extra.label sort.label }

FUNCTION{fr.and}
{
  " \& "
}

FUNCTION{fr.editeur}
{
  " (\'Ed.)"
}

FUNCTION{fr.editeurs}
{
  " (\'Eds.)"
}

FUNCTION{fr.et.al}
{
  " \emph{et~al.}"
}

FUNCTION{fr.in}
{
  "Dans "
}

FUNCTION{fr.in.spc}
{
  " de "
}

FUNCTION{fr.of}
{
  " de "
}

FUNCTION{fr.number}
{
  "num\'ero "
}

FUNCTION{fr.number.short}
{
  "\no "
}

FUNCTION{fr.number.maj}
{
  "Num\'ero "
}

FUNCTION{fr.volume}
{
  "Vol."
}

FUNCTION{fr.edition}
{
  " \'ed."
}

FUNCTION{fr.pages}
{
  "pp."
}

FUNCTION{fr.page}
{
  "p."
}

FUNCTION{fr.chapter}
{
  "chapitre"
}

FUNCTION{fr.tech.rep}
{
  "Rapport technique"
}

FUNCTION{sans.date}
{
  "s.d."
}

STRINGS {
  journart
  urlintro
}

FUNCTION{init.variables}
{
  "journal article" 'journart :=
  "Rep\'er\'e" 'urlintro :=
}

% used for month field
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

INTEGERS
{
  output.state
  before.all
  mid.sentence
  after.sentence
  after.block
}

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS
{
  s
  t
}

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
	{
	  ": " write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    {
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

FUNCTION {eho.output.nonnull}
{ 's :=
  output.state mid.sentence =
    { "\string: " * write$ }
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

FUNCTION {eho.output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'eho.output.nonnull
  if$
}

FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { write$
    year sans.date =
      {
      " [" sans.date * "]" *
      }
           {
      " (" year * ")" *
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
{doi empty$
 url empty$
 and
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

FUNCTION {format.assignee}
{ assignee empty$
    { "" }
    { " [" assignee * "]" *}
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
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 =
		{ " " * }
		'skip$
	      if$
	      t "others" =
		{ fr.et.al * }
		{ fr.and * t * }
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

FUNCTION {eho.format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.} {vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ fr.et.al * }
		{ fr.and * t * }
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

FUNCTION {format.key}
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
	{ fr.editeurs * }
	{ fr.editeur * }
      if$
    }
  if$
}

FUNCTION {eho.format.editors}
{ editor empty$
    { "" }
    { editor eho.format.names
      editor num.names$ #1 >
	{ fr.editeurs * }
	{ fr.editeur * }
	      if$
    }
  if$
}


FUNCTION {format.doi}
{
  doi empty$
    { "" }
    {"doi\string: \href{https://doi.org/" doi * "}{{\detokenize{" * doi * "}}}" *}
  if$
}


FUNCTION {format.url}
{ url empty$
   { "" }
   {
      urlintro
          urldate empty$
            { "there is url but no urldate in " cite$ * warning$ }
            { "~le " * urldate * "," * }
          if$
      " \`a \url{" * url * "}" *
    }
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
    % { title "t" change.case$ }
    { title }
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
{ title empty$
    { "" }
    % { title "t" change.case$ }
    { title emphasize}
  if$
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
    { fr.volume volume tie.or.space.connect
      series empty$
	'skip$
	{ fr.of * series emphasize * }
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
	    { fr.number }
	    { fr.number.maj }
	  if$
	  number tie.or.space.connect
	  series empty$
	    { "there's a number but no series in " cite$ * warning$ }
	    { fr.in.spc * series * }
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
	      { "(" edition "l" change.case$ * ")" * }
	      { "(" edition "t" change.case$ * ")" * }
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
	{ fr.pages pages n.dashify tie.or.space.connect }
	{ fr.page pages tie.or.space.connect }
      if$
      "." *
    }
  if$
}

FUNCTION {format.edition.pages.inbook}
{ pages empty$
    { "" }
    {
      pages multi.page.check
	      { ", " fr.pages * pages n.dashify tie.or.space.connect }
	      { ", " fr.page * pages tie.or.space.connect }
      if$
      "" *
    }
  if$
}

FUNCTION {format.pages.inbook}
{ pages empty$
    { "" }
    {
      pages multi.page.check
	      { "(" fr.pages * pages n.dashify tie.or.space.connect }
	      { "(" fr.page * pages tie.or.space.connect }
      if$
      ")." *
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume emphasize field.or.null
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
	{ ", " * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
	{ fr.chapter }
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
    {
      editor empty$
	      { fr.in booktitle emphasize * }
	      { fr.in eho.format.editors * ". " * booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {eho.format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ "Dans " booktitle emphasize * }
	{ "Dans " eho.format.editors * ", " * booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{
  type empty$
    'skip$
    { pop$
      "(" type "t" change.case$ * ")" *      %
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "" }
    { "" }
  if$
  number empty$
    { "t" change.case$ }
    {
      " publication " * fr.number.short
      number tie.or.space.connect *
    }
  if$
}

FUNCTION {format.article.crossref}
{ fr.in
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      fr.in
    }
    { "Volume" volume tie.or.space.connect
      fr.of *
    }
  if$
  "\cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ fr.in
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  month missing$
    { output.year.check }
    {
      number missing$
      { output.year.check }
      { " (" * year * ", " * number * ")" * }
      if$
    }
  if$
  new.block
  format.title "title" output.check
  format.support output.point
  new.block
  crossref missing$
    {
      journal emphasize "journal" output.check
      month missing$ not
        { format.pages output }
        {
          format.vol.num.pages output
        }
      if$
    }
    {
      format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output

  doi missing$ not
    {
      doi empty$ not
      { format.doi output }
      { format.url output }
      if$
    }
    { format.url output }
  if$

  new.block

  %type "l" change.case$ journart =
  %  'skip$
  %  { format.url output }
  %if$

  fin.entry
}



FUNCTION {book}
{ output.bibitem

  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
   {
      format.authors add.period$ output.nonnull
       crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$

  output.year.check
  new.block
  format.btitle "title" output.check
  format.edition eho.special.output
  format.support output.point

  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      address eho.output
      publisher "publisher" eho.output.check
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$

  new.block
  note output

  doi missing$ not
    {
      doi empty$ not
      { format.doi output }
      { format.url output }
      if$
    }
    { format.url output }
  if$

  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  howpublished output
  address output
  new.block
  note output
  format.doi output
  new.block
  format.url output

  fin.entry
}

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
  output.year.check
  new.block
  format.title "title" output.check

  crossref missing$
   {
      new.block
      format.in.ed.booktitle "booktitle" output.check

      format.support  output.point
      format.bvolume output

      edition missing$
        { " " * format.pages.inbook * }
        {
          " (" * edition "t" change.case$ *
          format.edition.pages.inbook *
          ")" *
        }
      if$

      new.block
      format.number.series output
      new.sentence
      address eho.output
      publisher "publisher" eho.output.check
    }
    {
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$

  new.block

  doi missing$ not
    {
      doi empty$ not
      { format.doi output }
      { format.url output }
      if$
    }
    { format.url output }
  if$

  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block

  crossref missing$
    { eho.format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages eho.special.output
      new.sentence
      address eho.output
      publisher "publisher" eho.output.check
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
  author format.key output

  month missing$
    { output.year.check }
    {
      month year =
      { output.year.check }
      { " (" * year * ", " * month * ")" * }
      if$
    }
  if$

  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.support  output.point
      format.bvolume output
      format.number.series output
      format.pages output
      address output
      new.sentence
      organization output
      publisher output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output

  doi missing$ not
    {
      doi empty$ not
      { format.doi output }
      { format.url output }
      if$
    }
    { format.url output }
  if$

  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  month missing$
    { output.year.check }
    {
      month year =
      { output.year.check }
      { " (" * year * ", " * month * ")" * }
      if$
    }
  if$
  new.block

  type empty$
    {
      format.btitle output
    }
    {
      format.btitle output
      " [" * type * "]" *
    }
  if$

  assignee missing$
    'skip$
    {
      new.block
      format.assignee output
      new.block
      number output
    }
  if$

  new.sentence
  address eho.output
  institution output
  new.block
  howpublished output
  format.support output.point
  new.block
  note output

  doi missing$ not
    {
      doi empty$ not
      { format.doi output }
      { format.url output }
      if$
    }
    { format.url output }
  if$

  fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  new.block
  type format.thesis.type output.nonnull
  format.support output.point
  new.block
  university output
  address output
  new.block
  note output

  doi missing$ not
    {
      doi empty$ not
      { format.doi output }
      { format.url output }
      if$
    }
    { format.url output }
  if$

  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address output
  new.sentence
  organization output
  publisher output
  new.block
  note output
  format.doi output
  new.block
  format.url output
  fin.entry
}


FUNCTION {techreport}
{ output.bibitem

  author "l" change.case$ institution "l" change.case$ =
    { author * }
    { format.authors "author" output.check }
  if$


  author format.key output
  output.year.check
  new.block

  format.btitle output
  format.tr.number *
  new.block


  author "l" change.case$ institution "l" change.case$ =
    'skip$
    { institution "institution" output.check }
  if$

  address output
  new.block
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check

  type empty$
    'skip$
    { " [" * type * "]" * }
  if$

  new.block
  publisher "publisher" output.check
  address "address" output.check
  new.block
  note "note" output.check
  new.block
  format.url output
  fin.entry
}

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

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ fr.et.al * }
    { #2 <
	'skip$
	{ s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { fr.et.al * }
	    { fr.and * s #2 "{vv~}{ll}" format.name$ * }
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
	'key
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
	    'key
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
	'key
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
	    'editor.key.label
        'author.key.label
      if$
    }
  if$
  ", "
  *
  year field.or.null purify$ #-1 #4 substring$
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
      if$
      s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
	{ fr.et.al * }
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
  #1 entry.max$ substring$
  'sort.label :=
  sort.label
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

SORT

STRINGS { last.label next.extra }

INTEGERS { last.extra.num }

FUNCTION {initialize.extra.label.stuff}
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

SORT

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{}" write$ newline$
}

EXECUTE {begin.bib}
EXECUTE {init.variables}
EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
