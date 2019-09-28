system "l ./q/utils/report_utils.q";
system "l ./q/utils/temporal_utils.q";

.utils.csl:{vs [" ";x]}; /- csl - convert string to list

.utils.cew:{[s;w] /- cew - check exact word or list of words
    :$[0h~type w;$[all{[s;w]any .utils.csl[s] like w}[s]@'w;1b;0b] ;$[any .utils.csl[s] like w;1b;0b]];
  };

.utils.pq:{ /- pq -> function to parse question
    pl:.utils.cp[x]; /- pl --> period list
    if[0b~pl;:.da.co[x]];
    if[not 0b~aq:.utils.cf[s;pl];:(aq;pl)];
    if[not 0b~er:.utils.cer[s;pl];:(er)];
    :pl; //TODO replace pl with 0b post testing
  };
