system "d .utils";
system "d .qunit";

testCP:{.qunit.assertEquals[.utils.cp["String has Jun"];(2019.06.01;2019.06.30);"Jun 2019"]};