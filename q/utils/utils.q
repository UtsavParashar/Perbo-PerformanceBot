// Periods Supported
// June, Jun, Jul --> Month for current year
// Jun, 2019 or June 2019 --> Month and year
// 2019.01.01 or 2019-01-01 or 2019/01/01
// 01.21.2019 or 01-21-2019 or 01/21/2019 --> MM.DD.YYYY format

.utils.cp:{[s] /- cp -> check period
    inyc:{[yr] /- inner function year check
        ds:2012; /- ds -> date since
        lyr:`int$lyr:ds+til ((`year$.z.d)-ds-1);
        :$[yr in lyr; 1b;'"Please provide year in the range of ",(string first lyr)," and ",(string last lyr)];
    };

    //check for dates in s for yyyy./-mm./-dd format
    dts:"D"$dts:(2 sublist(" "vs (ssr[" "sv (tm where (tm:(tm where (tm:(" "vs s))like "20[0-9][0-9][./-][0-9][0-9][./-][0-9][0-9]")) like "*[./-]*");"[./-]";"."])));

    if[first not null dts;
        [sd:first dts; /- from date
        ed:last dts; /- to date
        //if from and to date are parsed then return it
        if[1b~first (@[inyc;`year$sd;{x}],@[inyc;`year$ed;{x}]);:sd,ed]]];




    inbm:{[s] /- ingm -> inner function by month
        lmn:("January";"February";"March";"April";"May";"June";"July";"August";"September";"October";"November";"December"); /- lmn -> list months
        lmn:(lmn, 3#/:lmn);
        mn: first tm where (tm:" " vs s) in (lmn, 3#/:lmn); / get month from string
        yr: first tm where (tm:" " vs s) like "20[1-0][0-9]"; / get year from string
        @[inyc;yr;{x}];
        if[mn in lmn; mn:$[0j~(tm:((lmn?mn)+1)mod 12);12;tm]];
        $[mn in 1+til 12;
            [if[mn in 1+til 9;mn:"0",string mn];
            if[0h~type yr;yr:string `year$.z.d];
            sd:yr,".",mn,".","01";
            :("D"$sd), (-1+"d"$1+"m"$"D"$sd)]; / start and end date
            '"Please provide month in the form of Jan or January or with date like 2019.01.01 to 2019.01.31"];
        };
 }