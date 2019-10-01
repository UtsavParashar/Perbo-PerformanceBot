// @param - input - string from user
// returns - name of report; else 0b

lf:{[s;l]s:lower s; :$[first in[tm:l where except[s;" _-"] like/:{"*",x,"*"}peach l;l]; tm; 0b]}; / lf- local function, tm: temporary member
.utils.cer:{[s;pl] /- cer - check existing report
    lrl:("intercompanytrades";"fixreport";"fixreportextract"); /- lrl: report list
    if[0b~rn:lf[s;lrl];:0b]; /- report name
    sd:pl[0];ed:pl[1];
    :lf[s;lrl];
    /if["intercompanytrades"~rn;:erw_hrintc[sd;ed]];
    /if["fixreport"~rn or "fixreportextract"~rn;:fix_ex[sd;ed]];
  };

// @param - input - string from user
// returns - name of flow; else 0b
.utils.cf:{[s;pl] /- check flows
    lfl:("dmasmart";"dmafull";"dmalite";"dmasa";"dmamlxn";"dsa";"cash";"pt"); /- lfl: flow list
    :lf[s;lfl]
  };