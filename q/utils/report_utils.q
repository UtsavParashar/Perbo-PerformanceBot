// @param - input - string from user
// returns - name of report; else 0b
.utils.cer:{[s] /- cer - check existing report
    lrl:("intercompanytrades";"anytest"); /- lrl: report list
    $[first in[tm:lrl where except[s;" _"] like/:{"*",x,"*"}peach lrl;lrl]; :tm; :0b];
  };