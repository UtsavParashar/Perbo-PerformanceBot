// @param - input - string from user
// returns - name of report; else 0b

lf:{[s;l]:$[first in[tm:l where except[s;" _-"] like/:{"*",x,"*"}peach l;l]; tm; 0b]}; / lf- local function, tm: temporary member
.utils.cer:{[s] /- cer - check existing report
    lrl:("intercompanytrades";"anytest"); /- lrl: report list
    :lf[s;lrl];
  };

// @param - input - string from user
// returns - name of flow; else 0b
.utils.cf:{[s] /- check flows
    lfl:("dmasmart";"dsa";"cash";"pt"); /- lfl: flow list
    :lf[s;lfl]
  };