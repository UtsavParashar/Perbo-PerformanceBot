

/- Conversation
name:"chatu";
.da.co:{[q] /- question
/- Greetings - GoodBye
    ifgco:{[q] /- ifgco -> inner function greetings conversations
    g1:"hi";g2:"hello";g3:"hey";g4:"doing";g5:"today";
    q1:"howareyou";qmark:"?";
    a1:", how can I help you";a2:", how may I help you";

    lgr:(g1;g2;g3); /- lgr -> list greeting response
    lg2:(g1,name;g2,name;g3,name);
    lg:lgr,lg2; / lg ->list greetings
    lgq:(q1;q1,"?";q1,g4;q1,g4,"?";q1,g4,name;q1,g4,name,"?"); /- lgq -> List greeting questions
    lga:("Good";"I'm doing good";"Doing fine");
    lrq: (a1,qmark; a1," ",g5,qmark; a2,qmark; a2," ",g5,qmark); /-lrq -> list response question

    q:lower trim ssr[q;" ";""];
    ifrg:{rand count x}; /- ifrgn -> inner function random generator
    :$[q in (lg,(lg cross "!"));(1b; (lgr[ifrg[lgr]]),(lrq[ifrg[lgq]]));
       q in (lgq,(raze ((raze (lg{x,y}\:/:({x}@'(",";"!")))),\:/:(lgq)))); (1b; (lga[ifrg[lga]]),(lrq[ifrg[lga]]));
      (0b;"")];
    };

    :$[or[98h~type q;99h~type q];(0b;""); ifgco[q]];
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



