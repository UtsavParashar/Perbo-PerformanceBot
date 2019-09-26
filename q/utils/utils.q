system "l ./q/utils/report_utils.q";
system "l ./q/utils/temporal_utils.q";

.utils.pq:{[s] /- pq -> function to parse question
    pl:.utils.cp[s]; /- pl --> period list
    if[0b~pl;:.da.co[s]];
    if[not 0b~aq:.utils.cf[s;pl];:(aq;pl)];
    if[not 0b~er:.utils.cer[s;pl];:(er)];
    :pl; //TODO replace pl with 0b post testing
  };
