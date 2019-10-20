//- Conversations
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
    q:(_)trim except[q;" "];
    inrg:{{(*)1?x}(#)x}; /- inrg -> inner function random generator - rand count x
    :$[q in (lg,(lg cross "!"));(lgr[inrg[lgr]],(lrq[inrg[lga]]));
       q in (lgq,((,/) (((,/) (lg{x,y}\:/:({x}@'(",";"!";"")))),\:/:(lgq)))); (lga[inrg[lga]]),(lrq[inrg[lga]]);
      (0b;"")];
    };

    :$[or[98h~(@)q;99h~(@)q];(0b;""); ingco[q]];
 };