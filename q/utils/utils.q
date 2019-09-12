.utils.

.utils.pq:{[s] /- pq -> function to parse question
    pl:.utils.cp[s]; /- pl --> period list
    :$[0b~pl;.da.co[s];
        [(1b;string pl)]];
  };