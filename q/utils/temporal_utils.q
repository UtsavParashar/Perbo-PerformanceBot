/************************
/ Temporal Utilities
/ Author - Utsav Parashar
/************************

// Arguments
ar:.Q.opt .z.x;         /- arguments
da:ar[`def];            /- default argument


// Util Functions
.ut.ufts:{($:)'[x]}; /- utils function - to string

/- Parse sentence for month, year, week etc
.ut.ps:{if[max t:x in y;:x where t]}; /- ps - parse sentence, x --> string, y--> list of years, months

/- Get business days from all working days
.ut.gbd:{if[0>type x;x:enlist x]; x where 1<x mod 7};

/-Previous business day support
.ut.inpbd:{x-1^1 2 3 x mod 7}.z.d;

//*** String Utils ***//
.ut.csl:{vs[" ";x]}; /- csl - convert string to list

// Utilities
.ut.up:.ut.ufts`next`coming;
.ut.down:.ut.ufts`last`previous;
.ut.cur:.ut.ufts`this`current;
.ut.wmqy:raze {(x;x,"s")}@'.ut.ufts`week`month`quarter`qtr`year`yr;
.ut.business:.ut.ufts`business`working`work;
.ut.dates:raze {(x;x,"s")}@'.ut.ufts`day`date;

//- Support Jargons
.ut.ddj:(!). flip (
    ("pbd";(.ut.inpbd;.ut.inpbd));
    ("yesterday";(.z.d-1;.z.d-1));
    ("yesterdays";(.z.d-1;.z.d-1));
    ("wtd";(`week$.z.d-1;.z.d-1));
    ("mtd";("d"$"m"$.z.d;.z.d-1));
    ("qtd";("d"$3 xbar `month$.z.d;.z.d-1));
    ("ytd";("D"$($:)[`year$.z.d],".01.01";.z.d-1));
    ("lastweek";(`week$.z.d-7;6+`week$.z.d-7));
    ("previousweek";(`week$.z.d-7;6+`week$.z.d-7));
    ("currentweek";(`week$.z.d;6+`week$.z.d));
    ("thisweek";(`week$.z.d;6+`week$.z.d));
    ("nextweek";(`week$.z.d+7;6+`week$.z.d+7));
    ("comingweek";(`week$.z.d+7;6+`week$.z.d+7));
    ("lastmonth";("d"$-1+"m"$.z.d;-1+"d"$"m"$.z.d));
    ("previousmonth";("d"$-1+"m"$.z.d;-1+"d"$"m"$.z.d));
    ("currentmonth";("d"$"m"$.z.d;-1+"d"$1+"m"$.z.d));
    ("thismonth";("d"$"m"$.z.d;-1+"d"$1+"m"$.z.d));
    ("nextmonth";("d"$1+"m"$.z.d;-1+"d"$2+"m"$.z.d));
    ("comingmonth";("d"$1+"m"$.z.d;-1+"d"$2+"m"$.z.d));
    ("lastqtr";("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d));
    ("lastquarter";("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d));
    ("previousqtr";("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d));
    ("previousquarter";("d"$-3+3 xbar "m"$.z.d;-1+"d"$3 xbar "m"$.z.d));
    ("currentquarter";("d"$3 xbar "m"$.z.d;-1+"d"$3+3 xbar "m"$.z.d));
    ("currentqtr";("d"$3 xbar "m"$.z.d;-1+"d"$3+3 xbar "m"$.z.d));
    ("thisquarter";("d"$3 xbar "m"$.z.d;-1+"d"$3+3 xbar "m"$.z.d));
    ("thisqtr";("d"$3 xbar "m"$.z.d;-1+"d"$3+3 xbar "m"$.z.d));
    ("nextqtr";("d"$3+3 xbar "m"$.z.d;-1+"d"$6+3 xbar "m"$.z.d));
    ("nextquarter";("d"$3+3 xbar "m"$.z.d;-1+"d"$6+3 xbar "m"$.z.d));
    ("comingqtr";("d"$3+3 xbar "m"$.z.d;-1+"d"$6+3 xbar "m"$.z.d));
    ("comingquarter";("d"$3+3 xbar "m"$.z.d;-1+"d"$6+3 xbar "m"$.z.d));
    ("lastyear";("D"$string[-1+`year$.z.d],".01.01";-1+"D"$string[`year$.z.d],".01.01"));
    ("lastyr";("D"$string[-1+`year$.z.d],".01.01";-1+"D"$string[`year$.z.d],".01.01"));
    ("previousyear";("D"$string[-1+`year$.z.d],".01.01";-1+"D"$string[`year$.z.d],".01.01"));
    ("previousyr";("D"$string[-1+`year$.z.d],".01.01";-1+"D"$string[`year$.z.d],".01.01"));
    ("currentyear";("D"$string[`year$.z.d],".01.01";-1+"D"$string[1+`year$.z.d],".01.01"));
    ("currentyr";("D"$string[`year$.z.d],".01.01";-1+"D"$string[1+`year$.z.d],".01.01"));
    ("thisyear";("D"$string[`year$.z.d],".01.01";-1+"D"$string[1+`year$.z.d],".01.01"));
    ("thisyr";("D"$string[`year$.z.d],".01.01";-1+"D"$string[1+`year$.z.d],".01.01"));
    ("nextyear";("D"$string[1+`year$.z.d],".01.01";-1+"D"$string[2+`year$.z.d],".01.01"));
    ("nextyr";("D"$string[1+`year$.z.d],".01.01";-1+"D"$string[2+`year$.z.d],".01.01"));
    ("comingyear";("D"$string[1+`year$.z.d],".01.01";-1+"D"$string[2+`year$.z.d],".01.01"));
    ("comingyr";("D"$string[1+`year$.z.d],".01.01";-1+"D"$string[2+`year$.z.d],".01.01"));
    ("today";(.z.d;.z.d));
    ("todays";(.z.d;.z.d));
    ("daybeforeyesterday";(.z.d-2;.z.d-2));
    ("tomorrow";(.z.d+1;.z.d+1));
    ("dayaftertomorrow";(.z.d+2;.z.d+2))
  ); /- ddj --> dictionary date jargons

.ut.ndl:((,/)(,)1+(!)31); /- .ut.ndl -numeric days list

.ut.dcn:("one";"two";"three";"four";"five";"six";"seven";"eight";"nine";"ten";"eleven";"twelve";"thirteen";"fourteen";"fifteen";"sixteen";"seventeen";"eighteen";"ninteen";"twenty";"twentyone";"twentytwo";"twentythree";"twentyfour";"twentyfive";"twentysix";"twentyseven";"twentyeight";"twentynine";"thirty";"thirtyone")!.ut.ndl; /- dcn - dictionary cardinal number

.ut.don:(.ut.ufts`first`second`third`fourth`fifth`sixth`seventh`eighth`ninth`tenth`eleventh`twelfth`thirteenth`fourteenth`fifteenth`sixteenth`seventeenth`eighteenth`nineteenth`twentieth`twentyfirst`twentysecond`twentythird`twentyfourth`twentyfifth`twentysixth`twentyseventh`twentyeight`twentyninth`thirtieth`thirtyfirst)!.ut.ndl; /- ordinal - dictionary ordinal number

.ut.don2:(("1st";"2nd";"3rd"),((string (4+til 17)),\:"th"),("21st";"22nd";"23rd"),((string (24+til 7)),\:"th"),(enlist"31st"))!.ut.ndl; /- ordinal - dictionary ordinal number2

.ut.dnu:key .ut.dcn,.ut.don,.ut.don2; /- date numberics

// Support dates with months name, if year is not given then current year will be considered
.ut.lmn:("january";"february";"march";"april";"may";"june";"july";"august";"september";"october";"november";"december"); /- lmn -> list months
.ut.lmn:.ut.lmn,3#/:.ut.lmn;

.ut.yrs:string 1970+til 130; /- years from 1970 to 2099

.ut.wtbr:("of";"and";"for";"all";"a"); /- words to be removed

.dbl.m:{[s]
    if[(last s) in "?.,/- ";s:-1_s];
    rs:lower ssr[s except "?_!";"'s";""];
    ms:rs except ".-/'";
    s:{ssr[x;"'s";""]}@'vs[" ";trim(_)s]; /-Lemmatization to remove 's
    s:s except .ut.wtbr;


    //- Support for Months like Jan 2020
    yr:.ut.ps[s;.ut.yrs];
    mn:.ut.ps[s;.ut.lmn];
    if[101h=type yr;yr:enlist string `year$.z.d];

    if[and[count yr; and[1~count mn;not 101h~type mn]];sd:"D"$(first yr), " ", (first mn), " ", "01";dts:(sd; -1+"d"$1+"m"$sd)];
    if[and[count yr; 2~count mn];
    fyr:first yr; fmn:first mn;
    lyr:last yr; lmn:1+"m"$"D"$lyr," ",(last mn)," ","01";
    sd:"D"$fyr, " ", (fmn), " ", "01";
    ed:-1+"d"$lmn;
    dts:(sd;ed);
    ];

   //- Dates with Jargons
   if[any s in key .ut.ddj;dts:.ut.ddj[first s where s in key .ut.ddj]];

   //- Support date jargons with spaces
   if[any{[s;x]11b~1b in/:vs[" ";s] like/:x}[ms]@'raze (.ut.up, .ut.down, .ut.cur){(x;y)}\:/:.ut.wmqy;
    gi:s where s in (.ut.up, .ut.down, .ut.cur);
    gv:s where s in .ut.wmqy;
    dts:.ut.ddj[raze(gi,gv)];
   ];

   //- Support dates for yyyy./-mm./-dd format
   if[1<count tv:"D"$(2 sublist(" "vs (ssr[" "sv (tm(&)(tm:(tm (&)(tm:(" "vs rs))like "[1-2][0-9][0-9][0-9][./-][0-1][0-9][./-][0-3][0-9]")) like "*[./-]*");"[./-]";"."]))); dts:tv;
    ];

    //- Support dates for mm./-dd./-yyyy format
    if[1<count tv:"D"$(2 sublist(" "vs (ssr[" "sv (tm(&)(tm:(tm(&)(tm:(" "vs rs))like "[0-1][0-9][./-][0-3][0-9][./-][1-2][0-9][0-9][0-9]")) like "*[./-]*");"[./-]";"."]))); dts:tv;
    ];



   // Final output with requested format
   if[count dts;
   sd:first dts;
   ed:last dts;
   td:sd+til ed-sd-1; /- temp date
   ffd:fd:$[any .ut.business in s;.ut.gbd@td;td]; /- final date


   /- Return date format
   .dbl.odf:0b;
   .dbl.df:("yyyy";"yy";"mm";"dd");
   if[any ns:(ts:vs[" ";trim(_)rs]) in (df:(,/)((,/)((,/)((,/)({x}'[.dbl.df]),\:/:"./-"),\:/:({x}'[("mm";"dd")])
        ),\:/:"./-"),\:/:("dd";"yy";"yyyy"));
        .dbl.odf:(,/)ts(&)ns]; /- rs - raw string, ns - new string, ts - temp string, df - date format, odf - output date format

   if[10h=(@).dbl.odf;
        ffd:{de:vs[".";string x];yr:de[0];m:de[1];d:de[2];:ssr/[.dbl.odf;.dbl.df;(yr;-2#yr;m;d)]}@'fd; /- ffd - fully final date
     ];

   :$[count ffd;[$[0h=type ffd;ffd;string ffd]];"No working dates for selected range."];
   ];


 };

@[.dbl.m;da;{"I'm not sure if I can help you with your query. Can you please rephrase it?"}]

exit 0;