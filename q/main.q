

/- Conversation
name:"chatu";
.da.co:{[q] /- question
/- Greetings - GoodBye
    lgreet:("hi";"hello";"hey";{"hi ", x}name; {"hello ", x}name);
    lgreetresp:("hi";"hello";"hey");
    :$[(lower q)in lgreet;(1b; lgreetresp[rand count lgreetresp]);(0b;"");];
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
    :$[1b~((res:.da.aq[q])[0]); res[1];
        1b~((res:.da.pv[q])[0]); res[1];
        1b~((res:.da.er[q])[0]); res[1];
        1b~((res:.da.co[q])[0]); res[1]; q];
  }

.z.ws:{neg[.z.w].j.j @[.da.mf;x;"I'm sorry, I couldn't comprehend that. Please write to us at"];}



