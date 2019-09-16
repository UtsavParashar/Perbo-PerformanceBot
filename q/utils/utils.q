system "l ./q/utils/report_utils.q";
system "l ./q/utils/temporal_utils.q";

.utils.pq:{[s] /- pq -> function to parse question
    pl:.utils.cp[s]; /- pl --> period list
    if[0b~pl;:.da.co[s]];
    if[not 0b~aq:.utils.cf[s];:(aq;pl)];
    if[not 0b~er:.utils.cer[s];:(er;pl)];
    :0b;
  };
