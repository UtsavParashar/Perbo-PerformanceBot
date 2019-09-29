

/- Conversation
.da.name:"chatu";
.da.co:{[q] /- question /- co -> conversation
/- Greetings - GoodBye
    ingco:{[q] /- ingco -> inner function greetings conversations
    name:.da.name;
    g1:"hi";g2:"hello";g3:"hey";g4:"doing";g5:"today";
    q1:"howareyou";qmark:"?";
    a1:", how can I help you";a2:", how may I help you";

    lgr:(g1;g2;g3); /- lgr -> list greeting response
    lg2:(g1,name;g2,name;g3,name);
    lg:lgr,lg2; / lg ->list greetings
    lgq:(q1;q1,qmark; q1,g4; q1,g4,qmark;q1,g5; q1,g5,qmark; q1,g4,g5; q1,g4,g5,qmark; q1,name;q1,name,qmark;q1,g4,name; q1,g4,name,qmark; q1,g4,g5,name; q1,g4,g5,name,qmark; q1,g5,name; q1,g5,name,qmark); /- lgq -> List greeting questions
    lga:("Good";"I'm doing good";"Doing fine");
    lrq: (a1,qmark; a1," ",g5,qmark; a2,qmark; a2," ",g5,qmark); /-lrq -> list response question

    q:lower trim ssr[q;" ";""];
    inrg:{rand count x}; /- inrg -> inner function random generator
    :$[q in (lg,(lg cross "!"));(lgr[inrg[lgr]],(lrq[inrg[lga]]));
       q in (lgq,(raze ((raze (lg{x,y}\:/:({x}@'(",";"!";"")))),\:/:(lgq)))); (lga[inrg[lga]]),(lrq[inrg[lga]]);
      (0b;"")];
    };

    :$[or[98h~type q;99h~type q];(0b;""); ingco[q]];
 };

/- exec report name
.da.er:{[q]
    :(0b;"");
 };

/- adhoc query
.da.aq:{[q]
    out:.utils.pq[q];
    :$[0b~out;(0b;"");(1b;out)];
 };

/- predict values
.da.pv:{[q]
    :(0b;"");
 };

/- main function
.da.mf:{[q]
    q:ssr[q;"[\n\t\r]";" "];
    q:trim q;
//    :([] abc:`a`b`c`d`e`f`g`h`i`j; bcd:10+til 10; cde:10?`4; de:10?`5; ef:10?`8; fg:10?`8; gh:10000+til 10; hi:10000+til 10; jk:10?`8; lm:10?`8; nq:10?`8; qr:10?`8; rs:10?`8; st:10?`8; tu:10?`8);
    :$[ 1b~((res:.da.aq[q])[0]); res[1];
        /1b~((res:.da.er[q])[0]); res[1];
        /1b~((res:.da.pv[q])[0]); res[1];
         /1b~((res:.da.co[q])[0]); res[1];
        value q];
  };

.z.ws:{neg[.z.w].j.j @[.da.mf;x;{`$ "'",x}];};



