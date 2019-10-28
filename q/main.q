system "l /Users/utsav/repos/chatu/q/helper/conversation.q";
system "l /Users/utsav/repos/chatu/q/helper/temporal.q";
system "l /Users/utsav/repos/chatu/q/reports/reports.q";
system "l /Users/utsav/repos/chatu/q/utils/utils.q";

.da.name:"chatu";

/- exec report name
.da.er:{[q]
    :(0b;"");
 };

/- adhoc query
.da.aq:{[q]
    out:.ut.pq[q];
    :$[0b~out;(0b;"");(1b;out)];
 };

/- predict values
.da.pv:{[q]
    :(0b;"");
 };

/- main function
.da.mf:{[q]
    q:trim ssr[q;"[\n\t\r]";" "];
//    :([] abc:`a`b`c`d`e`f`g`h`i`j; bcd:10+til 10; cde:10?`4; de:10?`5; ef:10?`8; fg:10?`8; gh:10000+til 10; hi:10000+til 10; jk:10?`8; lm:10?`8; nq:10?`8; qr:10?`8; rs:10?`8; st:10?`8; tu:10?`8);
    :$[ 1b~((res:.da.aq[q])[0]); res[1];
        /1b~((res:.da.er[q])[0]); res[1];
        /1b~((res:.da.pv[q])[0]); res[1];
         /1b~((res:.da.co[q])[0]); res[1];
        value q];
  };

.z.ws:{neg[.z.w].j.j @[.da.mf;x;{`$ "'",x}];};



