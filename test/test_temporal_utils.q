system "l ./q/utils/utils.q"

.test.utils.cp.a1:{
    :$[(o:.utils.cp[x])~y;0N!("|" vs ("pass|",".test.utils.cp.a1|",x,"|"," "sv($)o));0N!("|" vs        ("fail|",".test.utils.cp.a1|",x,"|"," "sv($)o))];
  };



// Test all months
.test.utils.cp.a1["This is Jun"; (2019.06.01; 2019.06.30)];
.test.utils.cp.a1["Data for July"; (2019.07.01; 2019.07.31)];
.test.utils.cp.a1["Consists of May 2018"; (2018.05.01; 2018.05.31)];
.test.utils.cp.a1["string has 2017 dec"; (2017.12.01; 2017.12.31)];
.test.utils.cp.a1["sep 2013"; (2013.09.01; 2013.09.30)];


// Test date format yyyy./-mm./-dd
.test.utils.cp.a1["I need data for 2019.01.03"; (2019.01.03;2019.01.03)];
.test.utils.cp.a1["btw 2017.01.02 and 2017.01.21 here"; (2017.01.02;2017.01.21)];
.test.utils.cp.a1["I like date with 2019/01-21 2019-01-31"; (2019.01.21;2019.01.31)];
.test.utils.cp.a1["or in  2017-01-02 2017-01-21 here"; (2017.01.02;2017.01.21)];

// Test date format mm./-dd./-yyyy
.test.utils.cp.a1["I need data for 01.03.2019"; (2019.01.03;2019.01.03)];
.test.utils.cp.a1["btw 01.02.2017 and 01.21.2017 here"; (2017.01.02;2017.01.21)];
.test.utils.cp.a1["I like date with 01-21/2019 01-31-2019"; (2019.01.21;2019.01.31)];
.test.utils.cp.a1["or in  01/02/2017 01/21/2017 here"; (2017.01.02;2017.01.21)];

// Test date jargons
.test.utils.cp.a1["I will provide pbd"; (2019.10.17;2019.10.17)];
.test.utils.cp.a1["wtd jargons"; (2017.01.04;2019.10.17)];
.test.utils.cp.a1["mtd"; (2019.10.01;2019.10.17)];
.test.utils.cp.a1["qtd"; (2019.10.01;2019.10.17)];
.test.utils.cp.a1["ytd"; (2019.01.01;2019.10.17)];
.test.utils.cp.a1["week lastweek"; (2019.10.07;2019.10.11)];
.test.utils.cp.a1["lastmonth month"; (2019.09.01;2019.09.30)];
.test.utils.cp.a1["qtr lastqtr qtr"; (2019.07.01;2019.09.30)];


// Test date with space jargons
// Test date jargons
.test.utils.cp.a1["Provide date for last month data"; (2019.09.01;2019.09.30)];
.test.utils.cp.a1["data for previous quarter"; (2019.07.01;2019.09.30)];
.test.utils.cp.a1["week of last"; (2019.10.07;2019.10.11)];
.test.utils.cp.a1["previous day data"; (2019.10.17;2019.10.17)];
.test.utils.cp.a1["previous quarter data"; (2019.07.01;2019.09.30)];



//* Negative Cases
    / Date before 2011
    / Difference of one year data
    /*//
// .test.utils.cp.a1["This is Nov 2011";"'Please provide year in the range of 2012 and 2019"];
// .test.utils.cp.a1["What if date is in month 2011.09.21";"'Please provide year in the range of 2012 and 2019"];
// .test.utils.cp.a1["Difference is date 2016.01.01 2017.03.02";"'Difference between start and end data is greater than one year"]


