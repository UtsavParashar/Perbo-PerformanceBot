.ut.pq:{ /- pq -> function to parse question
    pl:.da.cp[x]; //- pl --> period list
    $[(*)pl;[.da.sd:pl@0;.da.ed:pl@1]; :.da.co[x]];
    if[(~)0b~aq:.re.cf[x];:(aq;pl)];
    if[(~)0b~er:.re.cer[x];:(er;pl)];
    if[(~)0b~id:.re.gID[x];:0!id];
    :pl; //TODO replace pl with 0b post testing
  };

//*** String Utils ***//
.ut.csl:{vs[" ";x]}; /- csl - convert string to list

.ut.cew:{[s;w] /- cew - check exact word or list of words
    :$[(@)w;$[all{[s;w]any .ut.csl[s] like w}[s]@'w;1b;0b] ;$[any .ut.csl[s] like w;1b;0b]];
  };


//*** Top/Bottom Values ***//
.ut.up:("top";"first");
.ut.down:("bottom";"last");


//*** Temporal Utils ***//
// Weekdays support
.ut.weekdays:{x(&)1<x mod 7};

//Previous business day support
.ut.inpbd:{x-1^1 2 3 x mod 7}.z.d;

// Common dicts
.ut.dnm:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine";"ten";"eleven";"twelve";"thirteen";"fourteen";"fifteen";"sixteen";"seventeen";"eighteen";"ninteen";"twenty")!((,/)(,)1+(!)20);