system "l /Users/utsav/Desktop/repos/chatu/q/reports/exrepo.q";
system "l /Users/utsav/Desktop/repos/chatu/q/reports/adcreq.q";

// @param - input - string from user
// returns - name of report; else 0b

lf:{[s;l]s:(_)s; :$[(*)in[tm:l(&)except[s;" _-"] like/:{"*",x,"*"}peach l;l]; tm; 0b]}; / lf- local function, tm: temporary member

.re.cer:{[s] /- cer - check existing report
    lrl:("reportName";"test";"test1"); /- lrl: report list
    if[0b~rn:lf[s;lrl];:0b]; /- report name
    :lf[s;lrl];
  };

// @param - input - string from user
// returns - name of flow; else 0b
.re.cf:{[s] /- check flows
    lfl:("dma";"dsa";"cash"); /- lfl: flow list
    :lf[s;lfl]
  };

// Instrument checks
// @param - input string from users
// return - instrument values
.re.gID:{ /- get instrument data
    if[max(tm:(td:((!:)[.re.dcs],(!:)[.re.dcs],\:"s"))in sl:.ut.csl x);b:(*)td(&)tm;b:$["s"=b@-1+(#)b;-1_b;b];s:(,/)(t(&)(t:(.ut.up,.ut.down))in sl);
    c:(,/)c(&)(c:(!).ut.dnm) in sl;$[((~)10h=(@)s);s:xdesc;s in .ut.up;s:xdesc; s in .ut.down;s:xasc;" "];$[((~)10h=(@)c);c:5;c in(!).ut.dnm;c:.ut.dnm@c;" "];:.re.tNIBW[c;b;s]]

};