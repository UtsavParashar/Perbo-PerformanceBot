

/- Conversation
name:"chatu";
.da.co:{[q] /- question
/- Greetings - GoodBye
    lgreet:("hi";"hello";"hey";{"hi ", x}name; {"hello ", x}name);
    lgreetresp:("hi";"hello";"hey");
    :$[or[98h~type q;99h~type q];(0b;"");(lower q)in lgreet;(1b; (lgreetresp[rand count lgreetresp]), ", how can I help you today?");(0b;"")];
 }

/- exec report name
.da.er:{[q]
    :(0b;"");
 }

/- adhoc query
.da.aq:{[q]
    :(0b;"");
 }

/- predict values
.da.pv:{[q]
    :(0b;"");
 }

/- main function
.da.mf:{[q]
    :$[ 1b~((res:.da.aq[q])[0]); res[1];
        1b~((res:.da.er[q])[0]); res[1];
        1b~((res:.da.pv[q])[0]); res[1];
        1b~((res:.da.co[q])[0]); res[1];
        value q];
  }

.z.ws:{neg[.z.w].j.j @[.da.mf;x;{`$ "'",x}];}



