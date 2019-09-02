// Periods Supported
// June, Jun, Jul --> Month for current year
// Jun, 2019 or June 2019 --> Month and year
// 2019.01.01 or 2019-01-01 or 2019/01/01
// 01.21.2019 or 01-21-2019 or 01/21/2019 --> MM.DD.YYYY format

.utils.cp:{[s] /- cp -> check period
    inyc:{[yr] /- inner function year check
        ds:2012; /- ds -> date since
        lyr:`int$lyr:ds+til ((`year$.z.d)-ds-1);
        :$[yr in lyr; yr;'"Please provide year in the range of ",(string first lyr)," and ",(string last lyr)];
    };

    //check for dates in s for yyyy./-mm./-dd format
    dts:"D"$dts:(2 sublist(" "vs (ssr[" "sv (tm where (tm:(tm where (tm:(" "vs s))like "20[0-9][0-9][./-][0-9][0-9][./-][0-9][0-9]")) like "*[./-]*");"[./-]";"."])));

    if[first not null dts;
        [fd:first dts; /- from date
        td:last dts; /- to date
        //if the from and two date are parsed then return it
        if[1b~first (@[inyc;`year$fd;{x}],@[inyc;`year$td;{x}]);:fd,td]]];




    ingm:{[mn] /- ingm -> inner function get month
        lmn:("January";"February";"March";"April";"May";"June";"July";"August";"September";"October";"November";"December"); /- lmn -> list months
        :if[mn in (lmn, 3#/:lmn); mn:?[0j~(tm:(((lmn, 3#/:lmn)?mn)+1)mod 12);12;tm];0N];
    };

    if[not mn in (1+til 12); mn:ingm[mn]];
    if[not mn in (1+til 12); '"Please provide month in the form of Jan or January or with date like 2019.01.01 to 2019.01.31"];
 }