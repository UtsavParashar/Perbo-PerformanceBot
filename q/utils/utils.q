.ut.pq:{ /- pq -> function to parse question
    pl:.da.cp[x]; /- pl --> period list
    if[0b~pl;:.da.co[x]];
    if[(~)0b~aq:.re.cf[x;pl];:(aq;pl)];
    if[(~)0b~er:.re.cer[x;pl];:(er;pl)];
    :pl; //TODO replace pl with 0b post testing
  };

//*** String Utils ***//
.ut.csl:{vs [" ";x]}; /- csl - convert string to list

.ut.cew:{[s;w] /- cew - check exact word or list of words
    :$[(@)w;$[all{[s;w]any .ut.csl[s] like w}[s]@'w;1b;0b] ;$[any .ut.csl[s] like w;1b;0b]];
  };


//*** Temporal Utils ***//
// Weekdays support
.ut.weekdays:{x(&)1<x mod 7};

//Previous business day support
.ut.inpbd:{x-1^1 2 3 x mod 7}.z.d;
