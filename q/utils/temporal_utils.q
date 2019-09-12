.utils.cp:{[s] /- cp -> check period
    s:trim lower s;
    inyc:{[yr] /- inner function year check
        yr:"I"$yr;ds:2012; /- ds -> date since
        lyr:`int$lyr:ds+til ((`year$.z.d)-ds-1);
        :$[yr in lyr; 1b;'"Please provide year in the range of ",(string first lyr)," and ",(string last lyr)];
    };

    // Support dates for yyyy./-mm./-dd format
    dts:"D"$dts:(2 sublist(" "vs (ssr[" "sv (tm where (tm:(tm where (tm:(" "vs s))like "20[0-9][0-9][./-][0-1][0-9][./-][0-3][0-9]")) like "*[./-]*");"[./-]";"."])));

    // Support dates for mm./-dd./-yyyy format
    if[first null dts; dts:"D"$dts:(2 sublist(" "vs (ssr[" "sv (tm where (tm:(tm where (tm:(" "vs s))like "[0-1][0-9][./-][0-3][0-9][./-]20[0-9][0-9]")) like "*[./-]*");"[./-]";"."])))];

    if[first not null dts;
        [sd:first dts; /- from date
        ed:last dts; /- to date
        if[sd>ed;[sd:sd+ed;ed:sd-ed;sd:sd-ed]];
        if[366<ed-sd;'"Difference between start and end data is greater than one year"];
        //if from and to date are parsed then return it
        if[1b~first (@[inyc;string `year$sd;{'x}]);:sd,ed]]];

        // Support dates with months name, if year is not given then current year will be considered
        lmn:("january";"february";"march";"april";"may";"june";"july";"august";"september";"october";"november";"december"); /- lmn -> list months
        lmn:lmn,3#/:lmn;
        mn: first tm where (tm:" " vs s) in lmn; / get month from string
        yr: first tm where (tm:" " vs s) like "20[0-9][0-9]"; / get year from string
        if[1b~first (@[inyc;$[0h~type yr;yr:string `year$.z.d;yr];{'x}]);
            [if[not 0h~type mn;
            if[mn in lmn; mn:$[0j~(tm:((lmn?mn)+1)mod 12);12;tm]];
            $[mn in 1+til 12;
                [$[mn in 1+til 9;mn:"0",string mn;mn:string mn];
                sd:yr,".",mn,".","01";
                :("D"$sd), (-1+"d"$1+"m"$"D"$sd)]; / start and end date
            '"Please provide month in the form of Jan or January or with date like 2019.01.01 to 2019.01.31"]]]];


    // support dates for jargons
    inpbd:{x-1^1 2 3 x mod 7}.z.d; / inner function previous business day
    ddj:("pbd";"wtd";"mtd";"qtd";"ytd";"lastweek";"lastmonth";"lastqtr")!((inpbd;inpbd);(`week$.z.d-1;.z.d-1);
            ("d"$"m"$.z.d;.z.d-1);("d"$3 xbar `month$.z.d;.z.d-1);("D"$string[`year$.z.d],".01.01";             .z.d-1);(`week$.z.d-7;4+`week$.z.d-7);("d"$-1+"m"$.z.d;-1+"d"$"m"$.z.d);
                ("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d)); /- ddj --> dictionary date jargons
     if[1b~1b in (tm:vs[" ";s]) in key ddj;:ddj[first tm where (tm:vs[" ";s]) in key ddj]];

     // support date jargons with spaces
     if[1b in {[s;x]11b~1b in/:vs[" ";s] like/:x}[s]@'raze ("previous";"last"){(x;y)}\:/:
        ("day";"week";"month";"quarter";"qtr");
         [inf:{[d;s]1b in vs[" ";s]like d};
             if[inf["day";s];:(inpbd;inpbd)];
             if[inf["week";s];:(`week$.z.d-7;4+`week$.z.d-7)];
             if[inf["month";s];:("d"$-1+"m"$.z.d;-1+"d"$"m"$.z.d)];
             lsqtr:("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d); / lsqtr - last quarter
             if[inf["qtr";s];:lsqtr];
             if[inf["quarter";s];:lsqtr];
          ]];
     if[1b in {[s;x]11b~1b in/:vs[" ";s] like/:x}[s]@'raze ("this";"current"){(x;y)}\:/:
             ("week";"month";"quarter";"qtr";"year");
              [inf:{[d;s]1b in vs[" ";s]like d};
                  if[inf["week";s];:(`week$.z.d-1;.z.d-1)];
                  if[inf["month";s];:("d"$"m"$.z.d;.z.d-1)];
                  qtd:("d"$3 xbar `month$.z.d;.z.d-1);
                  if[inf["qtr";s];:qtd];
                  if[inf["quarter";s];:qtd];
                  if[inf["year";s];:("D"$string[`year$.z.d],".01.01";.z.d-1)];
         ]];


    :0b;
 };

// Weekdays support
.utils.weekdays:{x where 1<x mod 7};
