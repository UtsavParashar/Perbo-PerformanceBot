.utils.cer:{[s] /- cer - check existing report
    lrl:("inter company trades";"any test"); /- lrl: report list
    :lrl where except[s;" _"] like/:{"*",x,"*"}peach lrl
    };