//**
.da.cp:{[s] /- cp -> check period
    s:trim(_)s;
    inyc:{[yr] /- inner function year check
        yr:"I"$yr;ds:2012; /- ds -> date since
        lyr:`int$lyr:ds+(!)((`year$.z.d)-ds-1);
        :$[yr in lyr; 1b;'"Please provide year in the range of ",(($)(*)lyr)," and ",(($) last lyr)];
    };

    // Support dates for yyyy./-mm./-dd format
    dts:"D"$dts:(2 sublist(" "vs (ssr[" "sv (tm(&)(tm:(tm (&)(tm:(" "vs s))like "20[0-9][0-9][./-][0-1][0-9][./-][0-3][0-9]")) like "*[./-]*");"[./-]";"."])));

    // Support dates for mm./-dd./-yyyy format
    if[(*)(^) dts; dts:"D"$dts:(2 sublist(" "vs (ssr[" "sv (tm(&)(tm:(tm(&)(tm:(" "vs s))like "[0-1][0-9][./-][0-3][0-9][./-]20[0-9][0-9]")) like "*[./-]*");"[./-]";"."])))];

    // for over excited users who use words jan? jun!
    s:s except "?._!";
    if[(*)(~)(^)dts;
        [sd:(*)dts; /- from date
        ed:last dts; /- to date
        if[sd>ed;[sd:sd+ed;ed:sd-ed;sd:sd-ed]];
        if[366<ed-sd;'"Difference between start and end data is greater than one year"];
        //if from and to date are parsed then return it
        if[(*)(@[inyc;($)`year$sd;{'x}]);:sd,ed]]];

        // Support dates with months name, if year is not given then current year will be considered
        lmn:("january";"february";"march";"april";"may";"june";"july";"august";"september";"october";"november";"december"); /- lmn -> list months
        lmn:lmn,3#/:lmn;
        mn:(*)tm(&)(tm:" " vs s) in lmn; / get month from string
        yr:(*)tm(&)(tm:" " vs s) like "20[0-9][0-9]"; / get year from string
        if[(*)(@[inyc;$[0h~(@)yr;yr:($)`year$.z.d;yr];{'x}]);
            [if[(~)0h~(@)mn;
            if[mn in lmn; mn:$[0j~(tm:((lmn?mn)+1)mod 12);12;tm]];
            $[mn in 1+(!)12;
                [$[mn in 1+(!)9;mn:"0",($)mn;mn:($)mn];
                sd:yr,".",mn,".","01";
                :("D"$sd), (-1+"d"$1+"m"$"D"$sd)]; / start and end date
            '"Please provide month in the form of Jan or January or with date like 2019.01.01 to 2019.01.31"]]]];


    // support dates for jargons
    ddj:("pbd";"wtd";"mtd";"qtd";"ytd";"lastweek";"lastmonth";"lastqtr")!((.ut.inpbd;.ut.inpbd);(`week$.z.d-1;.z.d-1);
            ("d"$"m"$.z.d;.z.d-1);("d"$3 xbar `month$.z.d;.z.d-1);("D"$($:)[`year$.z.d],".01.01";             .z.d-1);(`week$.z.d-7;4+`week$.z.d-7);("d"$-1+"m"$.z.d;-1+"d"$"m"$.z.d);
                ("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d)); /- ddj --> dictionary date jargons
     if[any (tm:vs[" ";s]) in (!)ddj;:ddj[(*)tm(&)(tm:vs[" ";s]) in(!)ddj]];

     // support date jargons with spaces
     if[any{[s;x]11b~1b in/:vs[" ";s] like/:x}[s]@'raze("previous";"last"){(x;y)}\:/:
        ("day";"week";"month";"quarter";"qtr";"year");
         [inf:{[d;s]any vs[" ";s]like d};
             if[inf["day";s];:(.ut.inpbd;.ut.inpbd)];
             if[inf["week";s];:(`week$.z.d-7;4+`week$.z.d-7)];
             if[inf["month";s];:("d"$-1+"m"$.z.d;-1+"d"$"m"$.z.d)];
             lsqtr:("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d); / lsqtr - last quarter
             if[inf["qtr";s];:lsqtr];
             if[inf["quarter";s];:lsqtr];
             if[inf["year";s];:("D"$($:)[-1+`year$.z.d],".01.01"; -1+"D"$($:)[`year$.z.d],".01.01")];
          ]];
     if[any{[s;x]11b~1b in/:vs[" ";s] like/:x}[s]@'raze ("this";"current"){(x;y)}\:/:
             ("week";"month";"quarter";"qtr";"year");
              [inf:{[d;s]any vs[" ";s]like d};
                  if[inf["week";s];:(`week$.z.d-1;.z.d-1)];
                  if[inf["month";s];:("d"$"m"$.z.d;.z.d-1)];
                  qtd:("d"$3 xbar `month$.z.d;.z.d-1);
                  if[inf["qtr";s];:qtd];
                  if[inf["quarter";s];:qtd];
                  if[inf["year";s];:("D"$($:)[`year$.z.d],".01.01";.z.d-1)];
         ]];
    :0b;
 };