(* Generates the induction principle.

   license: GNU Lesser General Public License Version 2.1 or later           
   ------------------------------------------------------------------------- *)

From elpi Require Import elpi derive.param1 derive.param1P.

Elpi Command derive.tysimpl.

Elpi Accumulate File "coq-lib-extra.elpi".
Elpi Accumulate File "derive/param1.elpi".
Elpi Accumulate Db derive.param1.db.

Elpi Accumulate Db derive.param1P.db.

Elpi Accumulate File "derive/tysimpl.elpi".
Elpi Accumulate "
  main [str I, str O] :- !, coq.locate I T, derive.tysimpl.main T O _.
  main [str I] :- !,
    coq.locate I T, term->gr T GR, Name is {coq.gr->id GR} ^ ""_simple"",
    derive.tysimpl.main T Name _.
  main _ :- usage.

  usage :-
    coq.error ""Usage: derive.tysimpl <term name> [<output name>]"".
".  
Elpi Typecheck.

