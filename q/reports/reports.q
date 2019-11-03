system "l /Users/utsav/Desktop/repos/chatu/q/reports/exrepo.q";
system "l /Users/utsav/Desktop/repos/chatu/q/reports/adcreq.q";

// @param - input - string from user
// returns - name of report; else 0b

lf:{[s;l]s:lower s; :$[(*)in[tm:l(&)except[s;" _-"] like/:{"*",x,"*"}peach l;l]; tm; 0b]}; / lf- local function, tm: temporary member

.re.cer:{[s] /- cer - check existing report
    lrl:("intercompanytrades";"test";"test1"); /- lrl: report list
    if[0b~rn:lf[s;lrl];:0b]; /- report name
    :lf[s;lrl];
  };

// @param - input - string from user
// returns - name of flow; else 0b
.re.cf:{[s] /- check flows
    lfl:("dma";"dsa";"cash"); /- lfl: flow list
    :lf[s;lfl]
  };