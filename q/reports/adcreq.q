// instrument adhoc

// Provide top notional
.re.dcs:("ric";"ticker";"isin")!`ric`ticker`isin; /- dcs - dictionary client stats

/- h:(<)`:host:port:userid;
.re.tNIB:[d;c;b;s]{ /- tNIB - Today Number of instruments by, args - date count by sort
    c sublist b xcols s[`notional;Q.id
        (h((,/)"table_name[",($:)d,";enlist func]"))] /- get data from gateway from desired function
    };

.re.tNIBW:{[c;b;s] /- tNIBW - today Number of Instruments by wrapper - args - count by sort
    b:.re.dcs[b];
    c sublist s[`notional;(,/).re.tNIB[;c;b;s]@'.da.sd+(!)1+.da.ed-.da.sd]
    }
