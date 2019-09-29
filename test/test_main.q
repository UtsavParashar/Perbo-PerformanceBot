system "l ./q/main.q"

.test.da.co.a1:{
    out:.da.co[x];
    :$[out in raze(("hi, ";"hey, ";"hello, "){x,y}\:/:("how can I help you?"; "how can I help you today?";"how may I help you?";"how can I help you today?"));0N!("|" vs ("pass|",".test.da.co.a1|",x,"|",out));0N!("|" vs ("fail|",".test.da.co.a1|",x,"|",out))];
  };

.test.da.co.a2:{
    out:.da.co[x];
    :$[out in raze(("Good, ";"I'm doing good, ";"Doing fine, "){x,y}\:/:("how can I help you?"; "how can I help you today?";"how may I help you?";"how can I help you today?"));0N!("|" vs ("pass|",".test.da.co.a1|",x,"|",out));0N!("|" vs ("fail|",".test.da.co.a1|",x,"|",out))];
 };


.test.da.co.a1@'("hi";"hey";"hello");
.test.da.co.a2@'("how are you";"how are you?";"how are you doing";"how are you doing?";"how are you ",.da.name; "how are you ",.da.name,"?";"how are you doing ",.da.name; "how are you doing ",.da.name,"?"; "how are you doing today ",.da.name; "how are you doing today ",.da.name,"?"; "how are you today"; "how are you today?"; "how are you today ",.da.name; "how are you today",.da.name,"?");