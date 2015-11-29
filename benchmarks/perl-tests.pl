
#!./perl

# $Header: append.t,v 4.0 91/03/20 01:51:23 lwall Locked $

print "1..3\n";

$a = 'ab' . 'c';	# compile time
$b = 'def';

$c = $a . $b;
print "#1\t:$c: eq :abcdef:\n";
if ($c eq 'abcdef') {print "ok 1\n";} else {print "not ok 1\n";}

$c .= 'xyz';
print "#2\t:$c: eq :abcdefxyz:\n";
if ($c eq 'abcdefxyz') {print "ok 2\n";} else {print "not ok 2\n";}

$_ = $a;
$_ .= $b;
print "#3\t:$_: eq :abcdef:\n";
if ($_ eq 'abcdef') {print "ok 3\n";} else {print "not ok 3\n";}
#!./perl

# $Header: array.t,v 4.0 91/03/20 01:51:31 lwall Locked $

print "1..36\n";

@ary = (1,2,3,4,5);
if (join('',@ary) eq '12345') {print "ok 1\n";} else {print "not ok 1\n";}

$tmp = $ary[$#ary]; --$#ary;
if ($tmp == 5) {print "ok 2\n";} else {print "not ok 2\n";}
if ($#ary == 3) {print "ok 3\n";} else {print "not ok 3\n";}
if (join('',@ary) eq '1234') {print "ok 4\n";} else {print "not ok 4\n";}

$[ = 1;
@ary = (1,2,3,4,5);
if (join('',@ary) eq '12345') {print "ok 5\n";} else {print "not ok 5\n";}

$tmp = $ary[$#ary]; --$#ary;
if ($tmp == 5) {print "ok 6\n";} else {print "not ok 6\n";}
if ($#ary == 4) {print "ok 7\n";} else {print "not ok 7\n";}
if (join('',@ary) eq '1234') {print "ok 8\n";} else {print "not ok 8\n";}

if ($ary[5] eq '') {print "ok 9\n";} else {print "not ok 9\n";}

$#ary += 1;	# see if we can recover element 5
if ($#ary == 5) {print "ok 10\n";} else {print "not ok 10\n";}
if ($ary[5] == 5) {print "ok 11\n";} else {print "not ok 11\n";}

$[ = 0;
@foo = ();
$r = join(',', $#foo, @foo);
if ($r eq "-1") {print "ok 12\n";} else {print "not ok 12 $r\n";}
$foo[0] = '0';
$r = join(',', $#foo, @foo);
if ($r eq "0,0") {print "ok 13\n";} else {print "not ok 13 $r\n";}
$foo[2] = '2';
$r = join(',', $#foo, @foo);
if ($r eq "2,0,,2") {print "ok 14\n";} else {print "not ok 14 $r\n";}
@bar = ();
$bar[0] = '0';
$bar[1] = '1';
$r = join(',', $#bar, @bar);
if ($r eq "1,0,1") {print "ok 15\n";} else {print "not ok 15 $r\n";}
@bar = ();
$r = join(',', $#bar, @bar);
if ($r eq "-1") {print "ok 16\n";} else {print "not ok 16 $r\n";}
$bar[0] = '0';
$r = join(',', $#bar, @bar);
if ($r eq "0,0") {print "ok 17\n";} else {print "not ok 17 $r\n";}
$bar[2] = '2';
$r = join(',', $#bar, @bar);
if ($r eq "2,0,,2") {print "ok 18\n";} else {print "not ok 18 $r\n";}
reset 'b';
@bar = ();
$bar[0] = '0';
$r = join(',', $#bar, @bar);
if ($r eq "0,0") {print "ok 19\n";} else {print "not ok 19 $r\n";}
$bar[2] = '2';
$r = join(',', $#bar, @bar);
if ($r eq "2,0,,2") {print "ok 20\n";} else {print "not ok 20 $r\n";}

$foo = 'now is the time';
if (($F1,$F2,$Etc) = ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/)) {
    if ($F1 eq 'now' && $F2 eq 'is' && $Etc eq 'the time') {
	print "ok 21\n";
    }
    else {
	print "not ok 21\n";
    }
}
else {
    print "not ok 21\n";
}

$foo = 'lskjdf';
if ($cnt = (($F1,$F2,$Etc) = ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/))) {
    print "not ok 22 $cnt $F1:$F2:$Etc\n";
}
else {
    print "ok 22\n";
}

%foo = ('blurfl','dyick','foo','bar','etc.','etc.');
%bar = %foo;
print $bar{'foo'} eq 'bar' ? "ok 23\n" : "not ok 23\n";
%bar = ();
print $bar{'foo'} eq '' ? "ok 24\n" : "not ok 24\n";
(%bar,$a,$b) = (%foo,'how','now');
print $bar{'foo'} eq 'bar' ? "ok 25\n" : "not ok 25\n";
print $bar{'how'} eq 'now' ? "ok 26\n" : "not ok 26\n";
@bar{keys %foo} = values %foo;
print $bar{'foo'} eq 'bar' ? "ok 27\n" : "not ok 27\n";
print $bar{'how'} eq 'now' ? "ok 28\n" : "not ok 28\n";

@foo = grep(/e/,split(' ','now is the time for all good men to come to'));
print join(' ',@foo) eq 'the time men come' ? "ok 29\n" : "not ok 29\n";

@foo = grep(!/e/,split(' ','now is the time for all good men to come to'));
print join(' ',@foo) eq 'now is for all good to to' ? "ok 30\n" : "not ok 30\n";

$foo = join('',('a','b','c','d','e','f')[0..5]);
print $foo eq 'abcdef' ? "ok 31\n" : "not ok 31\n";

$foo = join('',('a','b','c','d','e','f')[0..1]);
print $foo eq 'ab' ? "ok 32\n" : "not ok 32\n";

$foo = join('',('a','b','c','d','e','f')[6]);
print $foo eq '' ? "ok 33\n" : "not ok 33\n";

@foo = ('a','b','c','d','e','f')[0,2,4];
@bar = ('a','b','c','d','e','f')[1,3,5];
$foo = join('',(@foo,@bar)[0..5]);
print $foo eq 'acebdf' ? "ok 34\n" : "not ok 34\n";

$foo = ('a','b','c','d','e','f')[0,2,4];
print $foo eq 'e' ? "ok 35\n" : "not ok 35\n";

$foo = ('a','b','c','d','e','f')[1];
print $foo eq 'b' ? "ok 36\n" : "not ok 36\n";
#!./perl

# $Header: auto.t,v 4.0 91/03/20 01:51:35 lwall Locked $

print "1..34\n";

$x = 10000;
if (0 + ++$x - 1 == 10000) { print "ok 1\n";} else {print "not ok 1\n";}
if (0 + $x-- - 1 == 10000) { print "ok 2\n";} else {print "not ok 2\n";}
if (1 * $x == 10000) { print "ok 3\n";} else {print "not ok 3\n";}
if (0 + $x-- - 0 == 10000) { print "ok 4\n";} else {print "not ok 4\n";}
if (1 + $x == 10000) { print "ok 5\n";} else {print "not ok 5\n";}
if (1 + $x++ == 10000) { print "ok 6\n";} else {print "not ok 6\n";}
if (0 + $x == 10000) { print "ok 7\n";} else {print "not ok 7\n";}
if (0 + --$x + 1 == 10000) { print "ok 8\n";} else {print "not ok 8\n";}
if (0 + ++$x + 0 == 10000) { print "ok 9\n";} else {print "not ok 9\n";}
if ($x == 10000) { print "ok 10\n";} else {print "not ok 10\n";}

$x[0] = 10000;
if (0 + ++$x[0] - 1 == 10000) { print "ok 11\n";} else {print "not ok 11\n";}
if (0 + $x[0]-- - 1 == 10000) { print "ok 12\n";} else {print "not ok 12\n";}
if (1 * $x[0] == 10000) { print "ok 13\n";} else {print "not ok 13\n";}
if (0 + $x[0]-- - 0 == 10000) { print "ok 14\n";} else {print "not ok 14\n";}
if (1 + $x[0] == 10000) { print "ok 15\n";} else {print "not ok 15\n";}
if (1 + $x[0]++ == 10000) { print "ok 16\n";} else {print "not ok 16\n";}
if (0 + $x[0] == 10000) { print "ok 17\n";} else {print "not ok 17\n";}
if (0 + --$x[0] + 1 == 10000) { print "ok 18\n";} else {print "not ok 18\n";}
if (0 + ++$x[0] + 0 == 10000) { print "ok 19\n";} else {print "not ok 19\n";}
if ($x[0] == 10000) { print "ok 20\n";} else {print "not ok 20\n";}

$x{0} = 10000;
if (0 + ++$x{0} - 1 == 10000) { print "ok 21\n";} else {print "not ok 21\n";}
if (0 + $x{0}-- - 1 == 10000) { print "ok 22\n";} else {print "not ok 22\n";}
if (1 * $x{0} == 10000) { print "ok 23\n";} else {print "not ok 23\n";}
if (0 + $x{0}-- - 0 == 10000) { print "ok 24\n";} else {print "not ok 24\n";}
if (1 + $x{0} == 10000) { print "ok 25\n";} else {print "not ok 25\n";}
if (1 + $x{0}++ == 10000) { print "ok 26\n";} else {print "not ok 26\n";}
if (0 + $x{0} == 10000) { print "ok 27\n";} else {print "not ok 27\n";}
if (0 + --$x{0} + 1 == 10000) { print "ok 28\n";} else {print "not ok 28\n";}
if (0 + ++$x{0} + 0 == 10000) { print "ok 29\n";} else {print "not ok 29\n";}
if ($x{0} == 10000) { print "ok 30\n";} else {print "not ok 30\n";}

# test magical autoincrement

if (++($foo = '99') eq '100') {print "ok 31\n";} else {print "not ok 31\n";}
if (++($foo = 'a0') eq 'a1') {print "ok 32\n";} else {print "not ok 32\n";}
if (++($foo = 'Az') eq 'Ba') {print "ok 33\n";} else {print "not ok 33\n";}
if (++($foo = 'zz') eq 'aaa') {print "ok 34\n";} else {print "not ok 34\n";}
#!./perl

# $Header: chop.t,v 4.0 91/03/20 01:51:42 lwall Locked $

print "1..4\n";

# optimized

$_ = 'abc';
$c = do foo();
if ($c . $_ eq 'cab') {print "ok 1\n";} else {print "not ok 1 $c$_\n";}

# unoptimized

$_ = 'abc';
$c = chop($_);
if ($c . $_ eq 'cab') {print "ok 2\n";} else {print "not ok 2\n";}

sub foo {
    chop;
}

@foo = ("hi \n","there\n","!\n");
@bar = @foo;
chop(@bar);
print join('',@bar) eq 'hi there!' ? "ok 3\n" : "not ok 3\n";

$foo = "\n";
chop($foo,@foo);
print join('',$foo,@foo) eq 'hi there!' ? "ok 4\n" : "not ok 4\n";
#!./perl

# $Header: cond.t,v 4.0 91/03/20 01:51:47 lwall Locked $

print "1..4\n";

print 1 ? "ok 1\n" : "not ok 1\n";	# compile time
print 0 ? "not ok 2\n" : "ok 2\n";

$x = 1;
print $x ? "ok 3\n" : "not ok 3\n";	# run time
print !$x ? "not ok 4\n" : "ok 4\n";
#!./perl

# $Header: delete.t,v 4.0 91/03/20 01:51:56 lwall Locked $

print "1..6\n";

$foo{1} = 'a';
$foo{2} = 'b';
$foo{3} = 'c';

$foo = delete $foo{2};

if ($foo eq 'b') {print "ok 1\n";} else {print "not ok 1 $foo\n";}
if ($foo{2} eq '') {print "ok 2\n";} else {print "not ok 2 $foo{2}\n";}
if ($foo{1} eq 'a') {print "ok 3\n";} else {print "not ok 3\n";}
if ($foo{3} eq 'c') {print "ok 4\n";} else {print "not ok 4\n";}

$foo = join('',values(foo));
if ($foo eq 'ac' || $foo eq 'ca') {print "ok 5\n";} else {print "not ok 5\n";}

foreach $key (keys foo) {
    delete $foo{$key};
}

$foo{'foo'} = 'x';
$foo{'bar'} = 'y';

$foo = join('',values(foo));
if ($foo eq 'xy' || $foo eq 'yx') {print "ok 6\n";} else {print "not ok 6\n";}
#!./perl

# $Header: do.t,v 4.0 91/03/20 01:52:08 lwall Locked $

sub foo1
{
    print $_[0];
    'value';
}

sub foo2
{
    shift(_);
    print $_[0];
    $x = 'value';
    $x;
}

print "1..15\n";

$_[0] = "not ok 1\n";
$result = do foo1("ok 1\n");
print "#2\t:$result: eq :value:\n";
if ($result EQ 'value') { print "ok 2\n"; } else { print "not ok 2\n"; }
if ($_[0] EQ "not ok 1\n") { print "ok 3\n"; } else { print "not ok 3\n"; }

$_[0] = "not ok 4\n";
$result = do foo2("not ok 4\n","ok 4\n","not ok 4\n");
print "#5\t:$result: eq :value:\n";
if ($result EQ 'value') { print "ok 5\n"; } else { print "not ok 5\n"; }
if ($_[0] EQ "not ok 4\n") { print "ok 6\n"; } else { print "not ok 6\n"; }

$result = do{print "ok 7\n"; 'value';};
print "#8\t:$result: eq :value:\n";
if ($result EQ 'value') { print "ok 8\n"; } else { print "not ok 8\n"; }

sub blather {
    print @_;
}

do blather("ok 9\n","ok 10\n");
@x = ("ok 11\n", "ok 12\n");
@y = ("ok 14\n", "ok 15\n");
do blather(@x,"ok 13\n",@y);
#!./perl

# $Header: each.t,v 4.0 91/03/20 01:52:14 lwall Locked $

print "1..3\n";

$h{'abc'} = 'ABC';
$h{'def'} = 'DEF';
$h{'jkl','mno'} = "JKL\034MNO";
$h{'a',2,3,4,5} = join("\034",'A',2,3,4,5);
$h{'a'} = 'A';
$h{'b'} = 'B';
$h{'c'} = 'C';
$h{'d'} = 'D';
$h{'e'} = 'E';
$h{'f'} = 'F';
$h{'g'} = 'G';
$h{'h'} = 'H';
$h{'i'} = 'I';
$h{'j'} = 'J';
$h{'k'} = 'K';
$h{'l'} = 'L';
$h{'m'} = 'M';
$h{'n'} = 'N';
$h{'o'} = 'O';
$h{'p'} = 'P';
$h{'q'} = 'Q';
$h{'r'} = 'R';
$h{'s'} = 'S';
$h{'t'} = 'T';
$h{'u'} = 'U';
$h{'v'} = 'V';
$h{'w'} = 'W';
$h{'x'} = 'X';
$h{'y'} = 'Y';
$h{'z'} = 'Z';

@keys = keys %h;
@values = values %h;

if ($#keys == 29 && $#values == 29) {print "ok 1\n";} else {print "not ok 1\n";}

while (($key,$value) = each(h)) {
    if ($key eq $keys[$i] && $value eq $values[$i] && $key gt $value) {
	$key =~ y/a-z/A-Z/;
	$i++ if $key eq $value;
    }
}

if ($i == 30) {print "ok 2\n";} else {print "not ok 2\n";}

@keys = ('blurfl', keys(%h), 'dyick');
if ($#keys == 31) {print "ok 3\n";} else {print "not ok 3\n";}
#!./perl

# $RCSfile: eval.t,v $$Revision: 4.0.1.1 $$Date: 91/11/05 18:43:19 $

print "1..16\n";

eval 'print "ok 1\n";';

if ($@ eq '') {print "ok 2\n";} else {print "not ok 2\n";}

eval "\$foo\n    = # this is a comment\n'ok 3';";
print $foo,"\n";

eval "\$foo\n    = # this is a comment\n'ok 4\n';";
print $foo;

print eval '
$foo =';		# this tests for a call through yyerror()
if ($@ =~ /line 2/) {print "ok 5\n";} else {print "not ok 5\n";}

print eval '$foo = /';	# this tests for a call through fatal()
if ($@ =~ /Search/) {print "ok 6\n";} else {print "not ok 6\n";}

print eval '"ok 7\n";';

# calculate a factorial with recursive evals

$foo = 5;
$fact = 'if ($foo <= 1) {1;} else {push(@x,$foo--); (eval $fact) * pop(@x);}';
$ans = eval $fact;
if ($ans == 120) {print "ok 8\n";} else {print "not ok 8\n";}

$foo = 5;
$fact = 'local($foo)=$foo; $foo <= 1 ? 1 : $foo-- * (eval $fact);';
$ans = eval $fact;
if ($ans == 120) {print "ok 9\n";} else {print "not ok 9 $ans\n";}

open(try,'>Op.eval');
print try 'print "ok 10\n"; unlink "Op.eval";',"\n";
close try;

do 'Op.eval'; print $@;

# Test the singlequoted eval optimizer

$i = 11;
for (1..3) {
    eval 'print "ok ", $i++, "\n"';
}

eval {
    print "ok 14\n";
    die "ok 16\n";
    1;
} || print "ok 15\n$@";


#!./perl

# $Header: exp.t,v 4.0 91/03/20 01:52:31 lwall Locked $

print "1..6\n";

# compile time evaluation

$s = sqrt(2);
if (substr($s,0,5) eq '1.414') {print "ok 1\n";} else {print "not ok 1\n";}

$s = exp(1);
if (substr($s,0,7) eq '2.71828') {print "ok 2\n";} else {print "not ok 2\n";}

if (exp(log(1)) == 1) {print "ok 3\n";} else {print "not ok 3\n";}

# run time evaluation

$x1 = 1;
$x2 = 2;
$s = sqrt($x2);
if (substr($s,0,5) eq '1.414') {print "ok 4\n";} else {print "not ok 4\n";}

$s = exp($x1);
if (substr($s,0,7) eq '2.71828') {print "ok 5\n";} else {print "not ok 5\n";}

if (exp(log($x1)) == 1) {print "ok 6\n";} else {print "not ok 6\n";}
#!./perl

# $Header: flip.t,v 4.0 91/03/20 01:52:36 lwall Locked $

print "1..8\n";

@a = (1,2,3,4,5,6,7,8,9,10,11,12);

while ($_ = shift(a)) {
    if ($x = /4/../8/) { $z = $x; print "ok ", $x + 0, "\n"; }
    $y .= /1/../2/;
}

if ($z eq '5E0') {print "ok 6\n";} else {print "not ok 6\n";}

if ($y eq '12E0123E0') {print "ok 7\n";} else {print "not ok 7\n";}

@a = ('a','b','c','d','e','f','g');

open(of,'perl-tests.pl') || open(of,'tests/perl-tests.pl') || die "Can't open tests.pl";
while (<of>) {
    (3 .. 5) && $foo .= $_;
}
$x = ($foo =~ y/\n/\n/);

if ($x eq 3) {print "ok 8\n";} else {print "not ok 8 $x:$foo:\n";}
#!./perl

# $RCSfile: goto.t,v $$Revision: 4.0.1.1 $$Date: 92/06/08 15:43:25 $

print "1..3\n";

while (0) {
    $foo = 1;
  label1:
    $foo = 2;
    goto label2;
} continue {
    $foo = 0;
    goto label4;
  label3:
    $foo = 4;
    goto label4;
}
goto label1;

$foo = 3;

label2:
print "#1\t:$foo: == 2\n";
if ($foo == 2) {print "ok 1\n";} else {print "not ok 1\n";}
goto label3;

label4:
print "#2\t:$foo: == 4\n";
if ($foo == 4) {print "ok 2\n";} else {print "not ok 2\n";}

#$x = `./perl -e 'goto foo;' 2>&1`;
#if ($x =~ /label/) {print "ok 3\n";} else {print "not ok 3\n";}
#!./perl

# $Header: index.t,v 4.0 91/03/20 01:53:05 lwall Locked $

print "1..20\n";


$foo = 'Now is the time for all good men to come to the aid of their country.';

$first = substr($foo,0,index($foo,'the'));
print ($first eq "Now is " ? "ok 1\n" : "not ok 1\n");

$last = substr($foo,rindex($foo,'the'),100);
print ($last eq "their country." ? "ok 2\n" : "not ok 2\n");

$last = substr($foo,index($foo,'Now'),2);
print ($last eq "No" ? "ok 3\n" : "not ok 3\n");

$last = substr($foo,rindex($foo,'Now'),2);
print ($last eq "No" ? "ok 4\n" : "not ok 4\n");

$last = substr($foo,index($foo,'.'),100);
print ($last eq "." ? "ok 5\n" : "not ok 5\n");

$last = substr($foo,rindex($foo,'.'),100);
print ($last eq "." ? "ok 6\n" : "not ok 6\n");

print index("ababa","a",-1) == 0 ? "ok 7\n" : "not ok 7\n";
print index("ababa","a",0) == 0 ? "ok 8\n" : "not ok 8\n";
print index("ababa","a",1) == 2 ? "ok 9\n" : "not ok 9\n";
print index("ababa","a",2) == 2 ? "ok 10\n" : "not ok 10\n";
print index("ababa","a",3) == 4 ? "ok 11\n" : "not ok 11\n";
print index("ababa","a",4) == 4 ? "ok 12\n" : "not ok 12\n";
print index("ababa","a",5) == -1 ? "ok 13\n" : "not ok 13\n";

print rindex("ababa","a",-1) == -1 ? "ok 14\n" : "not ok 14\n";
print rindex("ababa","a",0) == 0 ? "ok 15\n" : "not ok 15\n";
print rindex("ababa","a",1) == 0 ? "ok 16\n" : "not ok 16\n";
print rindex("ababa","a",2) == 2 ? "ok 17\n" : "not ok 17\n";
print rindex("ababa","a",3) == 2 ? "ok 18\n" : "not ok 18\n";
print rindex("ababa","a",4) == 4 ? "ok 19\n" : "not ok 19\n";
print rindex("ababa","a",5) == 4 ? "ok 20\n" : "not ok 20\n";
#!./perl

# $Header: int.t,v 4.0 91/03/20 01:53:08 lwall Locked $

print "1..4\n";

# compile time evaluation

if (int(1.234) == 1) {print "ok 1\n";} else {print "not ok 1\n";}

if (int(-1.234) == -1) {print "ok 2\n";} else {print "not ok 2\n";}

# run time evaluation

$x = 1.234;
if (int($x) == 1) {print "ok 3\n";} else {print "not ok 3\n";}
if (int(-$x) == -1) {print "ok 4\n";} else {print "not ok 4\n";}
#!./perl

# $Header: join.t,v 4.0 91/03/20 01:53:17 lwall Locked $

print "1..3\n";

@x = (1, 2, 3);
if (join(':',@x) eq '1:2:3') {print "ok 1\n";} else {print "not ok 1\n";}

if (join('',1,2,3) eq '123') {print "ok 2\n";} else {print "not ok 2\n";}

if (join(':',split(/ /,"1 2 3")) eq '1:2:3') {print "ok 3\n";} else {print "not ok 3\n";}
#!./perl

# $Header: list.t,v 4.0 91/03/20 01:53:24 lwall Locked $

print "1..27\n";

@foo = (1, 2, 3, 4);
if ($foo[0] == 1 && $foo[3] == 4) {print "ok 1\n";} else {print "not ok 1\n";}

$_ = join(':',@foo);
if ($_ eq '1:2:3:4') {print "ok 2\n";} else {print "not ok 2\n";}

($a,$b,$c,$d) = (1,2,3,4);
if ("$a;$b;$c;$d" eq '1;2;3;4') {print "ok 3\n";} else {print "not ok 3\n";}

($c,$b,$a) = split(/ /,"111 222 333");
if ("$a;$b;$c" eq '333;222;111') {print "ok 4\n";} else {print "not ok 4\n";}

($a,$b,$c) = ($c,$b,$a);
if ("$a;$b;$c" eq '111;222;333') {print "ok 5\n";} else {print "not ok 5 $a;$b;$c\n";}

($a, $b) = ($b, $a);
if ("$a;$b;$c" eq '222;111;333') {print "ok 6\n";} else {print "not ok 6\n";}

($a, $b[1], $c{2}, $d) = (1, 2, 3, 4);
if ($a eq 1) {print "ok 7\n";} else {print "not ok 7\n";}
if ($b[1] eq 2) {print "ok 8\n";} else {print "not ok 8\n";}
if ($c{2} eq 3) {print "ok 9\n";} else {print "not ok 9\n";}
if ($d eq 4) {print "ok 10\n";} else {print "not ok 10\n";}

@foo = (1,2,3,4,5,6,7,8);
($a, $b, $c, $d) = @foo;
print "#11	$a;$b;$c;$d eq 1;2;3;4\n";
if ("$a;$b;$c;$d" eq '1;2;3;4') {print "ok 11\n";} else {print "not ok 11\n";}

@foo = @bar = (1);
if (join(':',@foo,@bar) eq '1:1') {print "ok 12\n";} else {print "not ok 12\n";}

@foo = ();
@foo = 1+2+3;
if (join(':',@foo) eq '6') {print "ok 13\n";} else {print "not ok 13\n";}

for ($x = 0; $x < 3; $x++) {
    ($a, $b, $c) = 
	    $x == 0?
		    ('ok ', 14, "\n"):
	    $x == 1?
		    ('ok ', 15, "\n"):
	    # default
		    ('ok ', 16, "\n");

    print $a,$b,$c;
}

@a = ($x == 12345 || (1,2,3));
if (join('',@a) eq '123') {print "ok 17\n";} else {print "not ok 17\n";}

@a = ($x == $x || (4,5,6));
if (join('',@a) eq '1') {print "ok 18\n";} else {print "not ok 18\n";}

if (join('',1,2,(3,4,5)) eq '12345'){print "ok 19\n";}else{print "not ok 19\n";}
if (join('',(1,2,3,4,5)) eq '12345'){print "ok 20\n";}else{print "not ok 20\n";}
if (join('',(1,2,3,4),5) eq '12345'){print "ok 21\n";}else{print "not ok 21\n";}
if (join('',1,(2,3,4),5) eq '12345'){print "ok 22\n";}else{print "not ok 22\n";}
if (join('',1,2,(3,4),5) eq '12345'){print "ok 23\n";}else{print "not ok 23\n";}
if (join('',1,2,3,(4),5) eq '12345'){print "ok 24\n";}else{print "not ok 24\n";}

for ($x = 0; $x < 3; $x++) {
    ($a, $b, $c) = do {
	    if ($x == 0) {
		('ok ', 25, "\n");
	    }
	    elsif ($x == 1) {
		('ok ', 26, "\n");
	    }
	    else {
		('ok ', 27, "\n");
	    }
	};

    print $a,$b,$c;
}

#!./perl

# $Header: local.t,v 4.0 91/03/20 01:53:29 lwall Locked $

print "1..20\n";

sub foo {
    local($a, $b) = @_;
    local($c, $d);
    $c = "ok 3\n";
    $d = "ok 4\n";
    { local($a,$c) = ("ok 9\n", "ok 10\n"); ($x, $y) = ($a, $c); }
    print $a, $b;
    $c . $d;
}

$a = "ok 5\n";
$b = "ok 6\n";
$c = "ok 7\n";
$d = "ok 8\n";

print do foo("ok 1\n","ok 2\n");

print $a,$b,$c,$d,$x,$y;

# same thing, only with arrays and associative arrays

sub foo2 {
    local($a, @b) = @_;
    local(@c, %d);
    @c = "ok 13\n";
    $d{''} = "ok 14\n";
    { local($a,@c) = ("ok 19\n", "ok 20\n"); ($x, $y) = ($a, @c); }
    print $a, @b;
    $c[0] . $d{''};
}

$a = "ok 15\n";
@b = "ok 16\n";
@c = "ok 17\n";
$d{''} = "ok 18\n";

print do foo2("ok 11\n","ok 12\n");

print $a,@b,@c,%d,$x,$y;
#!./perl

# $Header: oct.t,v 4.0 91/03/20 01:53:43 lwall Locked $

print "1..3\n";

if (oct('01234') == 01234) {print "ok 1\n";} else {print "not ok 1\n";}
if (oct('0x1234') == 0x1234) {print "ok 2\n";} else {print "not ok 2\n";}
if (hex('01234') == 0x1234) {print "ok 3\n";} else {print "not ok 3\n";}
#!./perl

# $Header: ord.t,v 4.0 91/03/20 01:53:50 lwall Locked $

print "1..2\n";

# compile time evaluation

if (ord('A') == 65) {print "ok 1\n";} else {print "not ok 1\n";}

# run time evaluation

$x = 'ABC';
if (ord($x) == 65) {print "ok 2\n";} else {print "not ok 2\n";}
#!./perl

# $Header: pack.t,v 4.0 91/03/20 01:53:57 lwall Locked $

print "1..3\n";

$format = "c2x5CCxsdila6";
# Need the expression in here to force ary[5] to be numeric.  This avoids
# test2 failing because ary2 goes str->numeric->str and ary doesn't.
@ary = (1,-100,127,128,32767,987.654321098 / 100.0,12345,123456,"abcdef");
$foo = pack($format,@ary);
@ary2 = unpack($format,$foo);

print ($#ary == $#ary2 ? "ok 1\n" : "not ok 1\n");

$out1=join(':',@ary);
$out2=join(':',@ary2);
print ($out1 eq $out2 ? "ok 2\n" : "not ok 2\n");

print ($foo =~ /def/ ? "ok 3\n" : "not ok 3\n");
#!./perl

# $RCSfile: pat.t,v $$Revision: 4.0.1.2 $$Date: 91/06/10 01:29:34 $

print "1..51\n";

$x = "abc\ndef\n";

if ($x =~ /^abc/) {print "ok 1\n";} else {print "not ok 1\n";}
if ($x !~ /^def/) {print "ok 2\n";} else {print "not ok 2\n";}

$* = 1;
if ($x =~ /^def/) {print "ok 3\n";} else {print "not ok 3\n";}
$* = 0;

$_ = '123';
if (/^([0-9][0-9]*)/) {print "ok 4\n";} else {print "not ok 4\n";}

if ($x =~ /^xxx/) {print "not ok 5\n";} else {print "ok 5\n";}
if ($x !~ /^abc/) {print "not ok 6\n";} else {print "ok 6\n";}

if ($x =~ /def/) {print "ok 7\n";} else {print "not ok 7\n";}
if ($x !~ /def/) {print "not ok 8\n";} else {print "ok 8\n";}

if ($x !~ /.def/) {print "ok 9\n";} else {print "not ok 9\n";}
if ($x =~ /.def/) {print "not ok 10\n";} else {print "ok 10\n";}

if ($x =~ /\ndef/) {print "ok 11\n";} else {print "not ok 11\n";}
if ($x !~ /\ndef/) {print "not ok 12\n";} else {print "ok 12\n";}

$_ = 'aaabbbccc';
if (/(a*b*)(c*)/ && $1 eq 'aaabbb' && $2 eq 'ccc') {
	print "ok 13\n";
} else {
	print "not ok 13\n";
}
if (/(a+b+c+)/ && $1 eq 'aaabbbccc') {
	print "ok 14\n";
} else {
	print "not ok 14\n";
}

if (/a+b?c+/) {print "not ok 15\n";} else {print "ok 15\n";}

$_ = 'aaabccc';
if (/a+b?c+/) {print "ok 16\n";} else {print "not ok 16\n";}
if (/a*b+c*/) {print "ok 17\n";} else {print "not ok 17\n";}

$_ = 'aaaccc';
if (/a*b?c*/) {print "ok 18\n";} else {print "not ok 18\n";}
if (/a*b+c*/) {print "not ok 19\n";} else {print "ok 19\n";}

$_ = 'abcdef';
if (/bcd|xyz/) {print "ok 20\n";} else {print "not ok 20\n";}
if (/xyz|bcd/) {print "ok 21\n";} else {print "not ok 21\n";}

if (m|bc/*d|) {print "ok 22\n";} else {print "not ok 22\n";}

if (/^$_$/) {print "ok 23\n";} else {print "not ok 23\n";}

$* = 1;		# test 3 only tested the optimized version--this one is for real
if ("ab\ncd\n" =~ /^cd/) {print "ok 24\n";} else {print "not ok 24\n";}
$* = 0;

$XXX{123} = 123;
$XXX{234} = 234;
$XXX{345} = 345;

@XXX = ('ok 25','not ok 25', 'ok 26','not ok 26','not ok 27');
while ($_ = shift(XXX)) {
    ?(.*)? && (print $1,"\n");
    /not/ && reset;
    /not ok 26/ && reset 'X';
}

while (($key,$val) = each(XXX)) {
    print "not ok 27\n";
    exit;
}

print "ok 27\n";

'cde' =~ /[^ab]*/;
'xyz' =~ //;
if ($& eq 'xyz') {print "ok 28\n";} else {print "not ok 28\n";}

$foo = '[^ab]*';
'cde' =~ /$foo/;
'xyz' =~ //;
if ($& eq 'xyz') {print "ok 29\n";} else {print "not ok 29\n";}

$foo = '[^ab]*';
'cde' =~ /$foo/;
'xyz' =~ /$null/;
if ($& eq 'xyz') {print "ok 30\n";} else {print "not ok 30\n";}

$_ = 'abcdefghi';
/def/;		# optimized up to cmd
if ("$`:$&:$'" eq 'abc:def:ghi') {print "ok 31\n";} else {print "not ok 31\n";}

/cde/ + 0;	# optimized only to spat
if ("$`:$&:$'" eq 'ab:cde:fghi') {print "ok 32\n";} else {print "not ok 32\n";}

/[d][e][f]/;	# not optimized
if ("$`:$&:$'" eq 'abc:def:ghi') {print "ok 33\n";} else {print "not ok 33\n";}

$_ = 'now is the {time for all} good men to come to.';
/ {([^}]*)}/;
if ($1 eq 'time for all') {print "ok 34\n";} else {print "not ok 34 $1\n";}

$_ = 'xxx {3,4}  yyy   zzz';
print /( {3,4})/ ? "ok 35\n" : "not ok 35\n";
print $1 eq '   ' ? "ok 36\n" : "not ok 36\n";
print /( {4,})/ ? "not ok 37\n" : "ok 37\n";
print /( {2,3}.)/ ? "ok 38\n" : "not ok 38\n";
print $1 eq '  y' ? "ok 39\n" : "not ok 39\n";
print /(y{2,3}.)/ ? "ok 40\n" : "not ok 40\n";
print $1 eq 'yyy ' ? "ok 41\n" : "not ok 41\n";
print /x {3,4}/ ? "not ok 42\n" : "ok 42\n";
print /^xxx {3,4}/ ? "not ok 43\n" : "ok 43\n";

$_ = "now is the time for all good men to come to.";
@words = /(\w+)/g;
print join(':',@words) eq "now:is:the:time:for:all:good:men:to:come:to"
    ? "ok 44\n"
    : "not ok 44\n";

@words = ();
while (/\w+/g) {
    push(@words, $&);
}
print join(':',@words) eq "now:is:the:time:for:all:good:men:to:come:to"
    ? "ok 45\n"
    : "not ok 45\n";

@words = ();
while (/to/g) {
    push(@words, $&);
}
print join(':',@words) eq "to:to"
    ? "ok 46\n"
    : "not ok 46 @words\n";

@words = /to/g;
print join(':',@words) eq "to:to"
    ? "ok 47\n"
    : "not ok 47 @words\n";

$_ = "abcdefghi";

$pat1 = 'def';
$pat2 = '^def';
$pat3 = '.def.';
$pat4 = 'abc';
$pat5 = '^abc';
$pat6 = 'abc$';
$pat7 = 'ghi';
$pat8 = '\w*ghi';
$pat9 = 'ghi$';

$t1=$t2=$t3=$t4=$t5=$t6=$t7=$t8=$t9=0;

for $iter (1..5) {
    $t1++ if /$pat1/o;
    $t2++ if /$pat2/o;
    $t3++ if /$pat3/o;
    $t4++ if /$pat4/o;
    $t5++ if /$pat5/o;
    $t6++ if /$pat6/o;
    $t7++ if /$pat7/o;
    $t8++ if /$pat8/o;
    $t9++ if /$pat9/o;
}

$x = "$t1$t2$t3$t4$t5$t6$t7$t8$t9";
print $x eq '505550555' ? "ok 48\n" : "not ok 48 $x\n";

$xyz = 'xyz';
print "abc" =~ /^abc$|$xyz/ ? "ok 49\n" : "not ok 49\n";

# perl 4.009 says "unmatched ()"
eval '"abc" =~ /a(bc$)|$xyz/; $result = "$&:$1"';
print $@ eq "" ? "ok 50\n" : "not ok 50\n";
print $result eq "abc:bc" ? "ok 51\n" : "not ok 51\n";
#!./perl

# $Header: push.t,v 4.0 91/03/20 01:54:07 lwall Locked $

@tests = split(/\n/, <<EOF);
0 3,			0 1 2,		3 4 5 6 7
0 0 a b c,		,		a b c 0 1 2 3 4 5 6 7
8 0 a b c,		,		0 1 2 3 4 5 6 7 a b c
7 0 6.5,		,		0 1 2 3 4 5 6 6.5 7
1 0 a b c d e f g h i j,,		0 a b c d e f g h i j 1 2 3 4 5 6 7
0 1 a,			0,		a 1 2 3 4 5 6 7
1 6 x y z,		1 2 3 4 5 6,	0 x y z 7
0 7 x y z,		0 1 2 3 4 5 6,	x y z 7
1 7 x y z,		1 2 3 4 5 6 7,	0 x y z
4,			4 5 6 7,	0 1 2 3
-4,			4 5 6 7,	0 1 2 3
EOF

print "1..", 2 + @tests, "\n";
die "blech" unless @tests;

@x = (1,2,3);
push(@x,@x);
if (join(':',@x) eq '1:2:3:1:2:3') {print "ok 1\n";} else {print "not ok 1\n";}
push(x,4);
if (join(':',@x) eq '1:2:3:1:2:3:4') {print "ok 2\n";} else {print "not ok 2\n";}

$test = 3;
foreach $line (@tests) {
    ($list,$get,$leave) = split(/,\t*/,$line);
    @list = split(' ',$list);
    @get = split(' ',$get);
    @leave = split(' ',$leave);
    @x = (0,1,2,3,4,5,6,7);
    @got = splice(@x,@list);
    if (join(':',@got) eq join(':',@get) &&
	join(':',@x) eq join(':',@leave)) {
	print "ok ",$test++,"\n";
    }
    else {
	print "not ok ",$test++," got: @got == @get left: @x == @leave\n";
    }
}

#!./perl

# $Header: range.t,v 4.0 91/03/20 01:54:11 lwall Locked $

print "1..8\n";

print join(':',1..5) eq '1:2:3:4:5' ? "ok 1\n" : "not ok 1\n";

@foo = (1,2,3,4,5,6,7,8,9);
@foo[2..4] = ('c','d','e');

print join(':',@foo[$foo[0]..5]) eq '2:c:d:e:6' ? "ok 2\n" : "not ok 2\n";

@bar[2..4] = ('c','d','e');
print join(':',@bar[1..5]) eq ':c:d:e:' ? "ok 3\n" : "not ok 3\n";

($a,@bcd[0..2],$e) = ('a','b','c','d','e');
print join(':',$a,@bcd[0..2],$e) eq 'a:b:c:d:e' ? "ok 4\n" : "not ok 4\n";

$x = 0;
for (1..100) {
    $x += $_;
}
print $x == 5050 ? "ok 5\n" : "not ok 5 $x\n";

$x = 0;
for ((100,2..99,1)) {
    $x += $_;
}
print $x == 5050 ? "ok 6\n" : "not ok 6 $x\n";

$x = join('','a'..'z');
print $x eq 'abcdefghijklmnopqrstuvwxyz' ? "ok 7\n" : "not ok 7 $x\n";

@x = 'A'..'ZZ';
print @x == 27 * 26 ? "ok 8\n" : "not ok 8\n";
#!./perl

# $Header: read.t,v 4.0 91/03/20 01:54:16 lwall Locked $

print "1..4\n";


open(FOO,'read.t') || open(FOO,'op/read.t') || open(FOO,'../op/read.t') || open(FOO,'tests/op/read.t') || die "Can't open op.read";
seek(FOO,4,0);
$got = read(FOO,$buf,4);

print ($got == 4 ? "ok 1\n" : "not ok 1\n");
print ($buf eq "perl" ? "ok 2\n" : "not ok 2 :$buf:\n");

seek(FOO,20000,0);
$got = read(FOO,$buf,4);

print ($got == 0 ? "ok 3\n" : "not ok 3\n");
print ($buf eq "" ? "ok 4\n" : "not ok 4\n");
#!./perl

# $RCSfile: regexp.t,v $$Revision: 4.0.1.1 $$Date: 91/06/10 01:30:29 $

open(TESTS,'re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
while (<TESTS>) { }
$numtests = $.;
close(TESTS);

print "1..$numtests\n";
open(TESTS,'re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
$| = 1;
while (<TESTS>) {
    ($pat, $subject, $result, $repl, $expect) = split(/[\t\n]/,$_);
    $input = join(':',$pat,$subject,$result,$repl,$expect);
    $pat = "'$pat'" unless $pat =~ /^'/;
    eval "\$match = (\$subject =~ m$pat); \$got = \"$repl\";";
    if ($result eq 'c') {
	if ($@ ne '') {print "ok $.\n";} else {print "not ok $.\n";}
    }
    elsif ($result eq 'n') {
	if (!$match) {print "ok $.\n";} else {print "not ok $. $input => $got\n";}
    }
    else {
	if ($match && $got eq $expect) {
	    print "ok $.\n";
	}
	else {
	    print "not ok $. $input => $got\n";
	}
    }
}
close(TESTS);
#!./perl

# $Header: repeat.t,v 4.0 91/03/20 01:54:26 lwall Locked $

print "1..19\n";

# compile time

if ('-' x 5 eq '-----') {print "ok 1\n";} else {print "not ok 1\n";}
if ('-' x 1 eq '-') {print "ok 2\n";} else {print "not ok 2\n";}
if ('-' x 0 eq '') {print "ok 3\n";} else {print "not ok 3\n";}

if ('ab' x 3 eq 'ababab') {print "ok 4\n";} else {print "not ok 4\n";}

# run time

$a = '-';
if ($a x 5 eq '-----') {print "ok 5\n";} else {print "not ok 5\n";}
if ($a x 1 eq '-') {print "ok 6\n";} else {print "not ok 6\n";}
if ($a x 0 eq '') {print "ok 7\n";} else {print "not ok 7\n";}

$a = 'ab';
if ($a x 3 eq 'ababab') {print "ok 8\n";} else {print "not ok 8\n";}

$a = 'xyz';
$a x= 2;
if ($a eq 'xyzxyz') {print "ok 9\n";} else {print "not ok 9\n";}
$a x= 1;
if ($a eq 'xyzxyz') {print "ok 10\n";} else {print "not ok 10\n";}
$a x= 0;
if ($a eq '') {print "ok 11\n";} else {print "not ok 11\n";}

@x = (1,2,3);

print join('', @x x 4) eq '3333' ? "ok 12\n" : "not ok 12\n";
print join('', (@x) x 4) eq '123123123123' ? "ok 13\n" : "not ok 13\n";
print join('', (@x,()) x 4) eq '123123123123' ? "ok 14\n" : "not ok 14\n";
print join('', (@x,1) x 4) eq '1231123112311231' ? "ok 15\n" : "not ok 15\n";
print join(':', () x 4) eq '' ? "ok 16\n" : "not ok 16\n";
print join(':', (9) x 4) eq '9:9:9:9' ? "ok 17\n" : "not ok 17\n";
print join(':', (9,9) x 4) eq '9:9:9:9:9:9:9:9' ? "ok 18\n" : "not ok 18\n";
print join('', (split(//,"123")) x 2) eq '123123' ? "ok 19\n" : "not ok 19\n";
#!./perl

# $Header: s.t,v 4.0 91/03/20 01:54:30 lwall Locked $

print "1..51\n";

$x = 'foo';
$_ = "x";
s/x/\$x/;
print "#1\t:$_: eq :\$x:\n";
if ($_ eq '$x') {print "ok 1\n";} else {print "not ok 1\n";}

$_ = "x";
s/x/$x/;
print "#2\t:$_: eq :foo:\n";
if ($_ eq 'foo') {print "ok 2\n";} else {print "not ok 2\n";}

$_ = "x";
s/x/\$x $x/;
print "#3\t:$_: eq :\$x foo:\n";
if ($_ eq '$x foo') {print "ok 3\n";} else {print "not ok 3\n";}

$b = 'cd';
($a = 'abcdef') =~ s'(b${b}e)'\n$1';
print "#4\t:$1: eq :bcde:\n";
print "#4\t:$a: eq :a\\n\$1f:\n";
if ($1 eq 'bcde' && $a eq 'a\n$1f') {print "ok 4\n";} else {print "not ok 4\n";}

$a = 'abacada';
if (($a =~ s/a/x/g) == 4 && $a eq 'xbxcxdx')
    {print "ok 5\n";} else {print "not ok 5\n";}

if (($a =~ s/a/y/g) == 0 && $a eq 'xbxcxdx')
    {print "ok 6\n";} else {print "not ok 6 $a\n";}

if (($a =~ s/b/y/g) == 1 && $a eq 'xyxcxdx')
    {print "ok 7\n";} else {print "not ok 7 $a\n";}

$_ = 'ABACADA';
if (/a/i && s///gi && $_ eq 'BCD') {print "ok 8\n";} else {print "not ok 8 $_\n";}

$_ = '\\' x 4;
if (length($_) == 4) {print "ok 9\n";} else {print "not ok 9\n";}
s/\\/\\\\/g;
if ($_ eq '\\' x 8) {print "ok 10\n";} else {print "not ok 10 $_\n";}

$_ = '\/' x 4;
if (length($_) == 8) {print "ok 11\n";} else {print "not ok 11\n";}
s/\//\/\//g;
if ($_ eq '\\//' x 4) {print "ok 12\n";} else {print "not ok 12\n";}
if (length($_) == 12) {print "ok 13\n";} else {print "not ok 13\n";}

$_ = 'aaaXXXXbbb';
s/^a//;
print $_ eq 'aaXXXXbbb' ? "ok 14\n" : "not ok 14\n";

$_ = 'aaaXXXXbbb';
s/a//;
print $_ eq 'aaXXXXbbb' ? "ok 15\n" : "not ok 15\n";

$_ = 'aaaXXXXbbb';
s/^a/b/;
print $_ eq 'baaXXXXbbb' ? "ok 16\n" : "not ok 16\n";

$_ = 'aaaXXXXbbb';
s/a/b/;
print $_ eq 'baaXXXXbbb' ? "ok 17\n" : "not ok 17\n";

$_ = 'aaaXXXXbbb';
s/aa//;
print $_ eq 'aXXXXbbb' ? "ok 18\n" : "not ok 18\n";

$_ = 'aaaXXXXbbb';
s/aa/b/;
print $_ eq 'baXXXXbbb' ? "ok 19\n" : "not ok 19\n";

$_ = 'aaaXXXXbbb';
s/b$//;
print $_ eq 'aaaXXXXbb' ? "ok 20\n" : "not ok 20\n";

$_ = 'aaaXXXXbbb';
s/b//;
print $_ eq 'aaaXXXXbb' ? "ok 21\n" : "not ok 21\n";

$_ = 'aaaXXXXbbb';
s/bb//;
print $_ eq 'aaaXXXXb' ? "ok 22\n" : "not ok 22\n";

$_ = 'aaaXXXXbbb';
s/aX/y/;
print $_ eq 'aayXXXbbb' ? "ok 23\n" : "not ok 23\n";

$_ = 'aaaXXXXbbb';
s/Xb/z/;
print $_ eq 'aaaXXXzbb' ? "ok 24\n" : "not ok 24\n";

$_ = 'aaaXXXXbbb';
s/aaX.*Xbb//;
print $_ eq 'ab' ? "ok 25\n" : "not ok 25\n";

$_ = 'aaaXXXXbbb';
s/bb/x/;
print $_ eq 'aaaXXXXxb' ? "ok 26\n" : "not ok 26\n";

# now for some unoptimized versions of the same.

$_ = 'aaaXXXXbbb';
$x ne $x || s/^a//;
print $_ eq 'aaXXXXbbb' ? "ok 27\n" : "not ok 27\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/a//;
print $_ eq 'aaXXXXbbb' ? "ok 28\n" : "not ok 28\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/^a/b/;
print $_ eq 'baaXXXXbbb' ? "ok 29\n" : "not ok 29\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/a/b/;
print $_ eq 'baaXXXXbbb' ? "ok 30\n" : "not ok 30\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/aa//;
print $_ eq 'aXXXXbbb' ? "ok 31\n" : "not ok 31\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/aa/b/;
print $_ eq 'baXXXXbbb' ? "ok 32\n" : "not ok 32\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/b$//;
print $_ eq 'aaaXXXXbb' ? "ok 33\n" : "not ok 33\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/b//;
print $_ eq 'aaaXXXXbb' ? "ok 34\n" : "not ok 34\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/bb//;
print $_ eq 'aaaXXXXb' ? "ok 35\n" : "not ok 35\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/aX/y/;
print $_ eq 'aayXXXbbb' ? "ok 36\n" : "not ok 36\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/Xb/z/;
print $_ eq 'aaaXXXzbb' ? "ok 37\n" : "not ok 37\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/aaX.*Xbb//;
print $_ eq 'ab' ? "ok 38\n" : "not ok 38\n";

$_ = 'aaaXXXXbbb';
$x ne $x || s/bb/x/;
print $_ eq 'aaaXXXXxb' ? "ok 39\n" : "not ok 39\n";

$_ = 'abc123xyz';
s/\d+/$&*2/e;              # yields 'abc246xyz'
print $_ eq 'abc246xyz' ? "ok 40\n" : "not ok 40\n";
s/\d+/sprintf("%5d",$&)/e; # yields 'abc  246xyz'
print $_ eq 'abc  246xyz' ? "ok 41\n" : "not ok 41\n";
s/\w/$& x 2/eg;            # yields 'aabbcc  224466xxyyzz'
print $_ eq 'aabbcc  224466xxyyzz' ? "ok 42\n" : "not ok 42\n";

$_ = "aaaaa";
print y/a/b/ == 5 ? "ok 43\n" : "not ok 43\n";
print y/a/b/ == 0 ? "ok 44\n" : "not ok 44\n";
print y/b// == 5 ? "ok 45\n" : "not ok 45\n";
print y/b/c/s == 5 ? "ok 46\n" : "not ok 46\n";
print y/c// == 1 ? "ok 47\n" : "not ok 47\n";
print y/c//d == 1 ? "ok 48\n" : "not ok 48\n";
print $_ eq "" ? "ok 49\n" : "not ok 49\n";

$_ = "Now is the %#*! time for all good men...";
print (($x=(y/a-zA-Z //cd)) == 7 ? "ok 50\n" : "not ok 50\n");
print y/ / /s == 8 ? "ok 51\n" : "not ok 51\n";

#!./perl

# $RCSfile: sort.t,v $$Revision: 4.0.1.2 $$Date: 91/11/11 16:43:47 $

print "1..10\n";

sub reverse { $a lt $b ? 1 : $a gt $b ? -1 : 0; }

@harry = ('dog','cat','x','Cain','Abel');
@george = ('gone','chased','yz','Punished','Axed');

$x = join('', sort @harry);
print ($x eq 'AbelCaincatdogx' ? "ok 1\n" : "not ok 1\n");

$x = join('', sort reverse @harry);
print ($x eq 'xdogcatCainAbel' ? "ok 2\n" : "not ok 2\n");

$x = join('', sort @george, 'to', @harry);
print ($x eq 'AbelAxedCainPunishedcatchaseddoggonetoxyz'?"ok 3\n":"not ok 3\n");

@a = ();
@b = reverse @a;
print ("@b" eq "" ? "ok 4\n" : "not ok 4 (@b)\n");

@a = (1);
@b = reverse @a;
print ("@b" eq "1" ? "ok 5\n" : "not ok 5 (@b)\n");

@a = (1,2);
@b = reverse @a;
print ("@b" eq "2 1" ? "ok 6\n" : "not ok 6 (@b)\n");

@a = (1,2,3);
@b = reverse @a;
print ("@b" eq "3 2 1" ? "ok 7\n" : "not ok 7 (@b)\n");

@a = (1,2,3,4);
@b = reverse @a;
print ("@b" eq "4 3 2 1" ? "ok 8\n" : "not ok 8 (@b)\n");

@a = (10,2,3,4);
@b = sort {$a <=> $b;} @a;
print ("@b" eq "2 3 4 10" ? "ok 9\n" : "not ok 9 (@b)\n");

$sub = 'reverse';
$x = join('', sort $sub @harry);
print ($x eq 'xdogcatCainAbel' ? "ok 10\n" : "not ok 10\n");

#!./perl

# $Header: split.t,v 4.0 91/03/20 01:54:42 lwall Locked $

print "1..12\n";

$FS = ':';

$_ = 'a:b:c';

($a,$b,$c) = split($FS,$_);

if (join(';',$a,$b,$c) eq 'a;b;c') {print "ok 1\n";} else {print "not ok 1\n";}

@ary = split(/:b:/);
if (join("$_",@ary) eq 'aa:b:cc') {print "ok 2\n";} else {print "not ok 2\n";}

$_ = "abc\n";
@xyz = (@ary = split(//));
if (join(".",@ary) eq "a.b.c.\n") {print "ok 3\n";} else {print "not ok 3\n";}

$_ = "a:b:c::::";
@ary = split(/:/);
if (join(".",@ary) eq "a.b.c") {print "ok 4\n";} else {print "not ok 4\n";}

$_ = join(':',split(' ',"    a b\tc \t d "));
if ($_ eq 'a:b:c:d') {print "ok 5\n";} else {print "not ok 5 #$_#\n";}

$_ = join(':',split(/ */,"foo  bar bie\tdoll"));
if ($_ eq "f:o:o:b:a:r:b:i:e:\t:d:o:l:l")
	{print "ok 6\n";} else {print "not ok 6\n";}

$_ = join(':', 'foo', split(/ /,'a b  c'), 'bar');
if ($_ eq "foo:a:b::c:bar") {print "ok 7\n";} else {print "not ok 7 $_\n";}

# Can we say how many fields to split to?
$_ = join(':', split(' ','1 2 3 4 5 6', 3));
print $_ eq '1:2:3 4 5 6' ? "ok 8\n" : "not ok 8 $_\n";

# Can we do it as a variable?
$x = 4;
$_ = join(':', split(' ','1 2 3 4 5 6', $x));
print $_ eq '1:2:3:4 5 6' ? "ok 9\n" : "not ok 9 $_\n";

# Does the 999 suppress null field chopping?
$_ = join(':', split(/:/,'1:2:3:4:5:6:::', 999));
print $_ eq '1:2:3:4:5:6:::' ? "ok 10\n" : "not ok 10 $_\n";

# Does assignment to a list imply split to one more field than that?
#$foo = `./perl -D1024 -e '(\$a,\$b) = split;' 2>&1`;
#print $foo =~ /DEBUGGING/ || $foo =~ /num\(3\)/ ? "ok 11\n" : "not ok 11\n";

# Can we say how many fields to split to when assigning to a list?
($a,$b) = split(' ','1 2 3 4 5 6', 2);
$_ = join(':',$a,$b);
print $_ eq '1:2 3 4 5 6' ? "ok 12\n" : "not ok 12 $_\n";

#!./perl

# $Header: sprintf.t,v 4.0 91/03/20 01:54:46 lwall Locked $

print "1..1\n";

$x = sprintf("%3s %-4s%%foo %5d%c%3.1f","hi",123,456,65,3.0999);
if ($x eq ' hi 123 %foo   456A3.1') {print "ok 1\n";} else {print "not ok 1 '$x'\n";}
#!./perl

# $Header: study.t,v 4.0 91/03/20 01:54:59 lwall Locked $

print "1..24\n";

$x = "abc\ndef\n";
study($x);

if ($x =~ /^abc/) {print "ok 1\n";} else {print "not ok 1\n";}
if ($x !~ /^def/) {print "ok 2\n";} else {print "not ok 2\n";}

$* = 1;
if ($x =~ /^def/) {print "ok 3\n";} else {print "not ok 3\n";}
$* = 0;

$_ = '123';
study;
if (/^([0-9][0-9]*)/) {print "ok 4\n";} else {print "not ok 4\n";}

if ($x =~ /^xxx/) {print "not ok 5\n";} else {print "ok 5\n";}
if ($x !~ /^abc/) {print "not ok 6\n";} else {print "ok 6\n";}

if ($x =~ /def/) {print "ok 7\n";} else {print "not ok 7\n";}
if ($x !~ /def/) {print "not ok 8\n";} else {print "ok 8\n";}

study($x);
if ($x !~ /.def/) {print "ok 9\n";} else {print "not ok 9\n";}
if ($x =~ /.def/) {print "not ok 10\n";} else {print "ok 10\n";}

if ($x =~ /\ndef/) {print "ok 11\n";} else {print "not ok 11\n";}
if ($x !~ /\ndef/) {print "not ok 12\n";} else {print "ok 12\n";}

$_ = 'aaabbbccc';
study;
if (/(a*b*)(c*)/ && $1 eq 'aaabbb' && $2 eq 'ccc') {
	print "ok 13\n";
} else {
	print "not ok 13\n";
}
if (/(a+b+c+)/ && $1 eq 'aaabbbccc') {
	print "ok 14\n";
} else {
	print "not ok 14\n";
}

if (/a+b?c+/) {print "not ok 15\n";} else {print "ok 15\n";}

$_ = 'aaabccc';
study;
if (/a+b?c+/) {print "ok 16\n";} else {print "not ok 16\n";}
if (/a*b+c*/) {print "ok 17\n";} else {print "not ok 17\n";}

$_ = 'aaaccc';
study;
if (/a*b?c*/) {print "ok 18\n";} else {print "not ok 18\n";}
if (/a*b+c*/) {print "not ok 19\n";} else {print "ok 19\n";}

$_ = 'abcdef';
study;
if (/bcd|xyz/) {print "ok 20\n";} else {print "not ok 20\n";}
if (/xyz|bcd/) {print "ok 21\n";} else {print "not ok 21\n";}

if (m|bc/*d|) {print "ok 22\n";} else {print "not ok 22\n";}

if (/^$_$/) {print "ok 23\n";} else {print "not ok 23\n";}

$* = 1;		# test 3 only tested the optimized version--this one is for real
if ("ab\ncd\n" =~ /^cd/) {print "ok 24\n";} else {print "not ok 24\n";}
#!./perl

# $Header: substr.t,v 4.0 91/03/20 01:55:05 lwall Locked $

print "1..22\n";

$a = 'abcdefxyz';

print (substr($a,0,3) eq 'abc' ? "ok 1\n" : "not ok 1\n");
print (substr($a,3,3) eq 'def' ? "ok 2\n" : "not ok 2\n");
print (substr($a,6,999) eq 'xyz' ? "ok 3\n" : "not ok 3\n");
print (substr($a,999,999) eq '' ? "ok 4\n" : "not ok 4\n");
print (substr($a,6,-1) eq '' ? "ok 5\n" : "not ok 5\n");
print (substr($a,-3,1) eq 'x' ? "ok 6\n" : "not ok 6\n");

$[ = 1;

print (substr($a,1,3) eq 'abc' ? "ok 7\n" : "not ok 7\n");
print (substr($a,4,3) eq 'def' ? "ok 8\n" : "not ok 8\n");
print (substr($a,7,999) eq 'xyz' ? "ok 9\n" : "not ok 9\n");
print (substr($a,999,999) eq '' ? "ok 10\n" : "not ok 10\n");
print (substr($a,7,-1) eq '' ? "ok 11\n" : "not ok 11\n");
print (substr($a,-3,1) eq 'x' ? "ok 12\n" : "not ok 12\n");

$[ = 0;

substr($a,3,3) = 'XYZ';
print $a eq 'abcXYZxyz' ? "ok 13\n" : "not ok 13\n";
substr($a,0,2) = '';
print $a eq 'cXYZxyz' ? "ok 14\n" : "not ok 14\n";
y/a/a/;
substr($a,0,0) = 'ab';
print $a eq 'abcXYZxyz' ? "ok 15\n" : "not ok 15 $a\n";
substr($a,0,0) = '12345678';
print $a eq '12345678abcXYZxyz' ? "ok 16\n" : "not ok 16\n";
substr($a,-3,3) = 'def';
print $a eq '12345678abcXYZdef' ? "ok 17\n" : "not ok 17\n";
substr($a,-3,3) = '<';
print $a eq '12345678abcXYZ<' ? "ok 18\n" : "not ok 18\n";
substr($a,-1,1) = '12345678';
print $a eq '12345678abcXYZ12345678' ? "ok 19\n" : "not ok 19\n";

$a = 'abcdefxyz';

print (substr($a,6) eq 'xyz' ? "ok 20\n" : "not ok 20\n");
print (substr($a,-3) eq 'xyz' ? "ok 21\n" : "not ok 21\n");
print (substr($a,999) eq '' ? "ok 22\n" : "not ok 22\n");
#!./perl

# $Header: time.t,v 4.0 91/03/20 01:55:09 lwall Locked $

print "1..5\n";

($beguser,$begsys) = times;

$beg = time;

while (($now = time) == $beg) {}

if ($now > $beg && $now - $beg < 10){print "ok 1\n";} else {print "not ok 1\n";}

for ($i = 0; $i < 100000; $i++) {
    ($nowuser, $nowsys) = times;
    $i = 200000 if $nowuser > $beguser && $nowsys > $begsys;
    last if time - $beg > 20;
}

if ($i >= 200000) {print "ok 2\n";} else {print "not ok 2\n";}

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($beg);
($xsec,$foo) = localtime($now);
$localyday = $yday;

if ($sec != $xsec && $mday && $year)
    {print "ok 3\n";}
else
    {print "not ok 3\n";}

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = gmtime($beg);
($xsec,$foo) = localtime($now);

if ($sec != $xsec && $mday && $year)
    {print "ok 4\n";}
else
    {print "not ok 4\n";}

if (index(" :0:1:-1:365:366:-365:-366:",':' . ($localyday - $yday) . ':') > 0)
    {print "ok 5\n";}
else
    {print "not ok 5\n";}
#!./perl

# $Header: undef.t,v 4.0 91/03/20 01:55:16 lwall Locked $

print "1..21\n";

print defined($a) ? "not ok 1\n" : "ok 1\n";

$a = 1+1;
print defined($a) ? "ok 2\n" : "not ok 2\n";

undef $a;
print defined($a) ? "not ok 3\n" : "ok 3\n";

$a = "hi";
print defined($a) ? "ok 4\n" : "not ok 4\n";

$a = $b;
print defined($a) ? "not ok 5\n" : "ok 5\n";

@ary = ("1arg");
$a = pop(@ary);
print defined($a) ? "ok 6\n" : "not ok 6\n";
$a = pop(@ary);
print defined($a) ? "not ok 7\n" : "ok 7\n";

@ary = ("1arg");
$a = shift(@ary);
print defined($a) ? "ok 8\n" : "not ok 8\n";
$a = shift(@ary);
print defined($a) ? "not ok 9\n" : "ok 9\n";

$ary{'foo'} = 'hi';
print defined($ary{'foo'}) ? "ok 10\n" : "not ok 10\n";
print defined($ary{'bar'}) ? "not ok 11\n" : "ok 11\n";
undef $ary{'foo'};
print defined($ary{'foo'}) ? "not ok 12\n" : "ok 12\n";

print defined(@ary) ? "ok 13\n" : "not ok 13\n";
print defined(%ary) ? "ok 14\n" : "not ok 14\n";
undef @ary;
print defined(@ary) ? "not ok 15\n" : "ok 15\n";
undef %ary;
print defined(%ary) ? "not ok 16\n" : "ok 16\n";
@ary = (1);
print defined @ary ? "ok 17\n" : "not ok 17\n";
%ary = (1,1);
print defined %ary ? "ok 18\n" : "not ok 18\n";

sub foo { print "ok 19\n"; }

&foo || print "not ok 19\n";

print defined &foo ? "ok 20\n" : "not ok 20\n";
undef &foo;
print defined(&foo) ? "not ok 21\n" : "ok 21\n";
#!./perl

# $Header: unshift.t,v 4.0 91/03/20 01:55:21 lwall Locked $

print "1..2\n";

@a = (1,2,3);
$cnt1 = unshift(a,0);

if (join(' ',@a) eq '0 1 2 3') {print "ok 1\n";} else {print "not ok 1\n";}
$cnt2 = unshift(a,3,2,1);
if (join(' ',@a) eq '3 2 1 0 1 2 3') {print "ok 2\n";} else {print "not ok 2\n";}


#!./perl

# $Header: vec.t,v 4.0 91/03/20 01:55:28 lwall Locked $

print "1..13\n";

#print vec($foo,0,1) == 0 ? "ok 1\n" : "not ok 1\n";
print length($foo) == 0 ? "ok 2\n" : "not ok 2\n";
vec($foo,0,1) = 1;
#print length($foo) == 1 ? "ok 3\n" : "not ok 3\n";
print ord($foo) == 1 ? "ok 4\n" : "not ok 4\n";
print vec($foo,0,1) == 1 ? "ok 5\n" : "not ok 5\n";

print vec($foo,20,1) == 0 ? "ok 6\n" : "not ok 6\n";
vec($foo,20,1) = 1;
print vec($foo,20,1) == 1 ? "ok 7\n" : "not ok 7\n";
print length($foo) == 3 ? "ok 8\n" : "not ok 8\n";
#print vec($foo,1,8) == 0 ? "ok 9\n" : "not ok 9\n";
vec($foo,1,8) = 0xf1;
print vec($foo,1,8) == 0xf1 ? "ok 10\n" : "not ok 10\n";
print ((ord(substr($foo,1,1)) & 255) == 0xf1 ? "ok 11\n" : "not ok 11\n");
print vec($foo,2,4) == 1 ? "ok 12\n" : "not ok 12\n";
print vec($foo,3,4) == 15 ? "ok 13\n" : "not ok 13\n";

#!./perl

# $Header: write.t,v 4.0 91/03/20 01:55:34 lwall Locked $

print "1..3\n";

format OUT =
the quick brown @<<
$fox
jumped
@*
$multiline
^<<<<<<<<<
$foo
^<<<<<<<<<
$foo
^<<<<<<...
$foo
now @<<the@>>>> for all@|||||men to come @<<<<
'i' . 's', "time\n", $good, 'to'
.

open(OUT, '>Op.write.tmp') || die "Can't create Op.write.tmp";

$fox = 'foxiness';
$good = 'good';
$multiline = "forescore\nand\nseven years\n";
$foo = 'when in the course of human events it becomes necessary';
write(OUT);
close OUT;

$right =
"the quick brown fox
jumped
forescore
and
seven years
when in
the course
of huma...
now is the time for all good men to come to\n";

#if (`cat Op.write.tmp` eq $right)
#    { print "ok 1\n"; unlink 'Op.write.tmp'; }
#else
#    { print "not ok 1\n"; }

format OUT2 =
the quick brown @<<
$fox
jumped
@*
$multiline
^<<<<<<<<< ~~
$foo
now @<<the@>>>> for all@|||||men to come @<<<<
'i' . 's', "time\n", $good, 'to'
.

open(OUT2, '>Op.write.tmp') || die "Can't create Op.write.tmp";

$fox = 'foxiness';
$good = 'good';
$multiline = "forescore\nand\nseven years\n";
$foo = 'when in the course of human events it becomes necessary';
write(OUT2);
close OUT2;

$right =
"the quick brown fox
jumped
forescore
and
seven years
when in
the course
of human
events it
becomes
necessary
now is the time for all good men to come to\n";

#if (`cat Op.write.tmp` eq $right)
#    { print "ok 2\n"; unlink 'Op.write.tmp'; }
#else
#    { print "not ok 2\n"; }

eval <<'EOFORMAT';
format OUT2 =
the brown quick @<<
$fox
jumped
@*
$multiline
^<<<<<<<<< ~~
$foo
now @<<the@>>>> for all@|||||men to come @<<<<
'i' . 's', "time\n", $good, 'to'
.
EOFORMAT

open(OUT2, '>Op.write.tmp') || die "Can't create Op.write.tmp";

$fox = 'foxiness';
$good = 'good';
$multiline = "forescore\nand\nseven years\n";
$foo = 'when in the course of human events it becomes necessary';
write(OUT2);
close OUT2;

$right =
"the brown quick fox
jumped
forescore
and
seven years
when in
the course
of human
events it
becomes
necessary
now is the time for all good men to come to\n";

#if (`cat Op.write.tmp` eq $right)
#    { print "ok 3\n"; unlink 'Op.write.tmp'; }
#else
#    { print "not ok 3\n"; }

#
#
#

#!./perl

# $Header: elsif.t,v 4.0 91/03/20 01:49:21 lwall Locked $

sub main'foobar {
    if ($_[0] == 1) {
	1;
    }
    elsif ($_[0] == 2) {
	2;
    }
    elsif ($_[0] == 3) {
	3;
    }
    else {
	4;
    }
}

print "1..4\n";

if (($x = do foobar(1)) == 1) {print "ok 1\n";} else {print "not ok 1 '$x'\n";}
if (($x = do foobar(2)) == 2) {print "ok 2\n";} else {print "not ok 2 '$x'\n";}
if (($x = do foobar(3)) == 3) {print "ok 3\n";} else {print "not ok 3 '$x'\n";}
if (($x = do foobar(4)) == 4) {print "ok 4\n";} else {print "not ok 4 '$x'\n";}
#!./perl

# $Header: for.t,v 4.0 91/03/20 01:49:26 lwall Locked $

print "1..7\n";

for ($i = 0; $i <= 10; $i++) {
    $x[$i] = $i;
}
$y = $x[10];
print "#1	:$y: eq :10:\n";
$y = join(' ', @x);
print "#1	:$y: eq :0 1 2 3 4 5 6 7 8 9 10:\n";
if (join(' ', @x) eq '0 1 2 3 4 5 6 7 8 9 10') {
	print "ok 1\n";
} else {
	print "not ok 1\n";
}

$i = $c = 0;
for (;;) {
	$c++;
	last if $i++ > 10;
}
if ($c == 12) {print "ok 2\n";} else {print "not ok 2\n";}

$foo = 3210;
@ary = (1,2,3,4,5);
foreach $foo (@ary) {
	$foo *= 2;
}
if (join('',@ary) eq '246810') {print "ok 3\n";} else {print "not ok 3\n";}

for (@ary) {
    s/(.*)/ok $1\n/;
}

print $ary[1];

# test for internal scratch array generation
# this also tests that $foo was restored to 3210 after test 3
for (split(' ','a b c d e')) {
	$foo .= $_;
}
if ($foo eq '3210abcde') {print "ok 5\n";} else {print "not ok 5 $foo\n";}

foreach $foo (("ok 6\n","ok 7\n")) {
	print $foo;
}
#!./perl

# $Header: mod.t,v 4.0 91/03/20 01:49:33 lwall Locked $

print "1..7\n";

print "ok 1\n" if 1;
print "not ok 1\n" unless 1;

print "ok 2\n" unless 0;
print "not ok 2\n" if 0;

1 && (print "not ok 3\n") if 0;
1 && (print "ok 3\n") if 1;
0 || (print "not ok 4\n") if 0;
0 || (print "ok 4\n") if 1;

$x = 0;
do {$x[$x] = $x;} while ($x++) < 10;
if (join(' ',@x) eq '0 1 2 3 4 5 6 7 8 9 10') {
	print "ok 5\n";
} else {
	print "not ok 5\n";
}

$x = 15;
$x = 10 while $x < 10;
if ($x == 15) {print "ok 6\n";} else {print "not ok 6\n";}

open(foo,'perl-tests.pl') || open(foo,'t/perl-tests.pl') || open(foo,'tests/perl-tests.pl') || die "Can't open re_tests";
$x = 0;
$x++ while <foo>;
print $x > 50 && $x < 1000 ? "ok 7\n" : "not ok 7\n";
#!./perl

# $RCSfile: subval.t,v $$Revision: 4.0.1.1 $$Date: 91/11/05 18:42:31 $

sub foo1 {
    'true1';
    if ($_[0]) { 'true2'; }
}

sub foo2 {
    'true1';
    if ($_[0]) { return 'true2'; } else { return 'true3'; }
    'true0';
}

sub foo3 {
    'true1';
    unless ($_[0]) { 'true2'; }
}

sub foo4 {
    'true1';
    unless ($_[0]) { 'true2'; } else { 'true3'; }
}

sub foo5 {
    'true1';
    'true2' if $_[0];
}

sub foo6 {
    'true1';
    'true2' unless $_[0];
}

print "1..34\n";

if (do foo1(0) eq '0') {print "ok 1\n";} else {print "not ok 1 $foo\n";}
if (do foo1(1) eq 'true2') {print "ok 2\n";} else {print "not ok 2\n";}
if (do foo2(0) eq 'true3') {print "ok 3\n";} else {print "not ok 3\n";}
if (do foo2(1) eq 'true2') {print "ok 4\n";} else {print "not ok 4\n";}

if (do foo3(0) eq 'true2') {print "ok 5\n";} else {print "not ok 5\n";}
if (do foo3(1) eq '1') {print "ok 6\n";} else {print "not ok 6\n";}
if (do foo4(0) eq 'true2') {print "ok 7\n";} else {print "not ok 7\n";}
if (do foo4(1) eq 'true3') {print "ok 8\n";} else {print "not ok 8\n";}

if (do foo5(0) eq '0') {print "ok 9\n";} else {print "not ok 9\n";}
if (do foo5(1) eq 'true2') {print "ok 10\n";} else {print "not ok 10\n";}
if (do foo6(0) eq 'true2') {print "ok 11\n";} else {print "not ok 11\n";}
if (do foo6(1) eq '1') {print "ok 12\n";} else {print "not ok 12 $x\n";}

# Now test to see that recursion works using a Fibonacci number generator

sub fib {
    local($arg) = @_;
    local($foo);
    $level++;
    if ($arg <= 2) {
	$foo = 1;
    }
    else {
	$foo = do fib($arg-1) + do fib($arg-2);
    }
    $level--;
    $foo;
}

@good = (0,1,1,2,3,5,8,13,21,34,55,89);

for ($i = 1; $i <= 10; $i++) {
    $foo = $i + 12;
    if (do fib($i) == $good[$i]) {
	print "ok $foo\n";
    }
    else {
	print "not ok $foo\n";
    }
}

sub ary1 {
    (1,2,3);
}

print &ary1 eq 3 ? "ok 23\n" : "not ok 23\n";

print join(':',&ary1) eq '1:2:3' ? "ok 24\n" : "not ok 24\n";

sub ary2 {
    do {
	return (1,2,3);
	(3,2,1);
    };
    0;
}

print &ary2 eq 3 ? "ok 25\n" : "not ok 25\n";

$x = join(':',&ary2);
print $x eq '1:2:3' ? "ok 26\n" : "not ok 26 $x\n";

sub somesub {
    local($num,$P,$F,$L) = @_;
    ($p,$f,$l) = caller;
    print "$p:$f:$l" eq "$P:$F:$L" ? "ok $num\n" : "not ok $num $p:$f:$l ne $P:$F:$L\n";
}

&somesub(27, 'main', __FILE__, __LINE__);

#package foo;
&main'somesub(28, 'foo', __FILE__, __LINE__);

#package main;
$i = 28;
open(FOO,">Cmd_subval.tmp");
print FOO "blah blah\n";
close FOO;

&file_main(*F);
close F;
&info_main;

&file_package(*F);
close F;
&info_package;

#unlink 'Cmd_subval.tmp';

sub file_main {
        local(*F) = @_;

        open(F, 'Cmd_subval.tmp') || die "can't open\n";
	$i++;
        eof F ? print "not ok $i\n" : print "ok $i\n";
}

sub info_main {
        local(*F);

        open(F, 'Cmd_subval.tmp') || die "test: can't open\n";
	$i++;
        eof F ? print "not ok $i\n" : print "ok $i\n";
        &iseof(*F);
	close F;
}

sub iseof {
        local(*UNIQ) = @_;

	$i++;
        eof UNIQ ? print "(not ok $i)\n" : print "ok $i\n";
}

{#package foo;

 sub main'file_package {
        local(*F) = @_;

        open(F, 'Cmd_subval.tmp') || die "can't open\n";
	$main'i++;
        eof F ? print "not ok $main'i\n" : print "ok $main'i\n";
 }

 sub main'info_package {
        local(*F);

        open(F, 'Cmd_subval.tmp') || die "can't open\n";
	$main'i++;
        eof F ? print "not ok $main'i\n" : print "ok $main'i\n";
        &iseof(*F);
 }

 sub iseof {
        local(*UNIQ) = @_;

	$main'i++;
        eof UNIQ ? print "not ok $main'i\n" : print "ok $main'i\n";
 }
}
#!./perl

# $Header: switch.t,v 4.0 91/03/20 01:49:44 lwall Locked $

print "1..18\n";

sub foo1 {
    $_ = shift(@_);
    $a = 0;
    until ($a++) {
	next if $_ eq 1;
	next if $_ eq 2;
	next if $_ eq 3;
	next if $_ eq 4;
	return 20;
    }
    continue {
	return $_;
    }
}

print do foo1(0) == 20 ? "ok 1\n" : "not ok 1\n";
print do foo1(1) == 1 ? "ok 2\n" : "not ok 2\n";
print do foo1(2) == 2 ? "ok 3\n" : "not ok 3\n";
print do foo1(3) == 3 ? "ok 4\n" : "not ok 4\n";
print do foo1(4) == 4 ? "ok 5\n" : "not ok 5\n";
print do foo1(5) == 20 ? "ok 6\n" : "not ok 6\n";

sub foo2 {
    $_ = shift(@_);
    {
	last if $_ == 1;
	last if $_ == 2;
	last if $_ == 3;
	last if $_ == 4;
    }
    continue {
	return 20;
    }
    return $_;
}

print do foo2(0) == 20 ? "ok 7\n" : "not ok 1\n";
print do foo2(1) == 1 ? "ok 8\n" : "not ok 8\n";
print do foo2(2) == 2 ? "ok 9\n" : "not ok 9\n";
print do foo2(3) == 3 ? "ok 10\n" : "not ok 10\n";
print do foo2(4) == 4 ? "ok 11\n" : "not ok 11\n";
print do foo2(5) == 20 ? "ok 12\n" : "not ok 12\n";

sub foo3 {
    $_ = shift(@_);
    if (/^1/) {
	return 1;
    }
    elsif (/^2/) {
	return 2;
    }
    elsif (/^3/) {
	return 3;
    }
    elsif (/^4/) {
	return 4;
    }
    else {
	return 20;
    }
    return 40;
}

print do foo3(0) == 20 ? "ok 13\n" : "not ok 13\n";
print do foo3(1) == 1 ? "ok 14\n" : "not ok 14\n";
print do foo3(2) == 2 ? "ok 15\n" : "not ok 15\n";
print do foo3(3) == 3 ? "ok 16\n" : "not ok 16\n";
print do foo3(4) == 4 ? "ok 17\n" : "not ok 17\n";
print do foo3(5) == 20 ? "ok 18\n" : "not ok 18\n";
#!./perl

# $Header: while.t,v 4.0 91/03/20 01:49:51 lwall Locked $

print "1..10\n";

open (tmp,'>Cmd.while.tmp') || die "Can't create Cmd.while.tmp.";
print tmp "tvi925\n";
print tmp "tvi920\n";
print tmp "vt100\n";
print tmp "Amiga\n";
print tmp "paper\n";
close tmp;

# test "last" command

open(fh,'Cmd.while.tmp') || die "Can't open Cmd.while.tmp.";
while (<fh>) {
    last if /vt100/;
}
if (!eof && /vt100/) {print "ok 1\n";} else {print "not ok 1 $_\n";}

# test "next" command

$bad = '';
open(fh,'Cmd.while.tmp') || die "Can't open Cmd.while.tmp.";
while (<fh>) {
    next if /vt100/;
    $bad = 1 if /vt100/;
}
if (!eof || /vt100/ || $bad) {print "not ok 2\n";} else {print "ok 2\n";}

# test "redo" command

$bad = '';
open(fh,'Cmd.while.tmp') || die "Can't open Cmd.while.tmp.";
while (<fh>) {
    if (s/vt100/VT100/g) {
	s/VT100/Vt100/g;
	redo;
    }
    $bad = 1 if /vt100/;
    $bad = 1 if /VT100/;
}
if (!eof || $bad) {print "not ok 3\n";} else {print "ok 3\n";}

# now do the same with a label and a continue block

# test "last" command

$badcont = '';
open(fh,'Cmd.while.tmp') || die "Can't open Cmd.while.tmp.";
line: while (<fh>) {
    if (/vt100/) {last line;}
} continue {
    $badcont = 1 if /vt100/;
}
if (!eof && /vt100/) {print "ok 4\n";} else {print "not ok 4\n";}
if (!$badcont) {print "ok 5\n";} else {print "not ok 5\n";}

# test "next" command

$bad = '';
$badcont = 1;
open(fh,'Cmd.while.tmp') || die "Can't open Cmd.while.tmp.";
entry: while (<fh>) {
    next entry if /vt100/;
    $bad = 1 if /vt100/;
} continue {
    $badcont = '' if /vt100/;
}
if (!eof || /vt100/ || $bad) {print "not ok 6\n";} else {print "ok 6\n";}
if (!$badcont) {print "ok 7\n";} else {print "not ok 7\n";}

# test "redo" command

$bad = '';
$badcont = '';
open(fh,'Cmd.while.tmp') || die "Can't open Cmd.while.tmp.";
loop: while (<fh>) {
    if (s/vt100/VT100/g) {
	s/VT100/Vt100/g;
	redo loop;
    }
    $bad = 1 if /vt100/;
    $bad = 1 if /VT100/;
} continue {
    $badcont = 1 if /vt100/;
}
if (!eof || $bad) {print "not ok 8\n";} else {print "ok 8\n";}
if (!$badcont) {print "ok 9\n";} else {print "not ok 9\n";}

#`/bin/rm -f Cmd.while.tmp`;

#$x = 0;
#while (1) {
#    if ($x > 1) {last;}
#    next;
#} continue {
#    if ($x++ > 10) {last;}
#    next;
#}
#
#if ($x < 10) {print "ok 10\n";} else {print "not ok 10\n";}

$i = 9;
{
    $i++;
}
print "ok $i\n";
#!./perl

# $Header: cond.t,v 4.0 91/03/20 01:48:54 lwall Locked $

# make sure conditional operators work

print "1..4\n";

$x = '0';

$x eq $x && (print "ok 1\n");
$x ne $x && (print "not ok 1\n");
$x eq $x || (print "not ok 2\n");
$x ne $x || (print "ok 2\n");

$x == $x && (print "ok 3\n");
$x != $x && (print "not ok 3\n");
$x == $x || (print "not ok 4\n");
$x != $x || (print "ok 4\n");
#!./perl

# $Header: if.t,v 4.0 91/03/20 01:49:03 lwall Locked $

print "1..2\n";

# first test to see if we can run the tests.

$x = 'test';
if ($x eq $x) { print "ok 1\n"; } else { print "not ok 1\n";}
if ($x ne $x) { print "not ok 2\n"; } else { print "ok 2\n";}
#!./perl

# $Header: lex.t,v 4.0 91/03/20 01:49:08 lwall Locked $

print "1..18\n";

$ # this is the register <space>
= 'x';

print "#1	:$ : eq :x:\n";
if ($  eq 'x') {print "ok 1\n";} else {print "not ok 1\n";}

$x = $#;	# this is the register $#

if ($x eq '') {print "ok 2\n";} else {print "not ok 2\n";}

$x = $#x;

if ($x eq '-1') {print "ok 3\n";} else {print "not ok 3\n";}

$x = '\\'; # ';

if (length($x) == 1) {print "ok 4\n";} else {print "not ok 4\n";}

eval 'while (0) {
    print "foo\n";
}
/^/ && (print "ok 5\n");
';

eval '$foo{1} / 1;';
if (!$@) {print "ok 6\n";} else {print "not ok 6\n";}

eval '$foo = 123+123.4+123e4+123.4E5+123.4e+5+.12;';

$foo = int($foo * 100 + .5);
if ($foo eq 2591024652) {print "ok 7\n";} else {print "not ok 7 :$foo:\n";}

print <<'EOF';
ok 8
EOF

$foo = 'ok 9';
print <<EOF;
$foo
EOF

eval <<\EOE, print $@;
print <<'EOF';
ok 10
EOF

$foo = 'ok 11';
print <<EOF;
$foo
EOF
EOE

print "skipped 12\n";
#print <<`EOS` . <<\EOF;
#echo ok 12
#EOS
#ok 13
#EOF

print qq/ok 14\n/;
print qq(ok 15\n);

print qq
ok 16\n
;

print q<ok 17
>;

print <<;   # Yow!
ok 18

# previous line intentionally left blank.
#!./perl

# $Header: pat.t,v 4.0 91/03/20 01:49:12 lwall Locked $

print "1..2\n";

# first test to see if we can run the tests.

$_ = 'test';
if (/^test/) { print "ok 1\n"; } else { print "not ok 1\n";}
if (/^foo/) { print "not ok 2\n"; } else { print "ok 2\n";}
#!./perl

# $Header: term.t,v 4.0 91/03/20 01:49:17 lwall Locked $

print "1..6\n";

# check "" interpretation

$x = "\n";
if ($x lt ' ') {print "ok 1\n";} else {print "not ok 1\n";}

# check `` processing

print "skipped 2\n";
#$x = `echo hi there`;
#if ($x eq "hi there\n") {print "ok 2\n";} else {print "not ok 2\n";}

# check $#array

$x[0] = 'foo';
$x[1] = 'foo';
$tmp = $#x;
print "#3\t:$tmp: == :1:\n";
if ($#x == '1') {print "ok 3\n";} else {print "not ok 3\n";}

# check numeric literal

$x = 1;
if ($x == '1') {print "ok 4\n";} else {print "not ok 4\n";}

# check <> pseudoliteral

open(try, "/dev/null") || (die "Can't open /dev/null.");
if (<try> eq '') {
    print "ok 5\n";
}
else {
    print "not ok 5\n";
    die "/dev/null IS NOT A CHARACTER SPECIAL FILE!!!!\n" unless -c '/dev/null';
}

open(try, "perl-tests.pl") || open(try, "tests/perl-tests.pl") || (die "Can't open perl-tests.pl.");
if (<try> ne '') {print "ok 6\n";} else {print "not ok 6\n";}
#
#
#

#!./perl

# $Header: array.t,v 4.0 91/03/20 01:51:31 lwall Locked $

print "1..36\n";

@ary = (1,2,3,4,5);
if (join('',@ary) eq '12345') {print "ok 1\n";} else {print "not ok 1\n";}

$tmp = $ary[$#ary]; --$#ary;
if ($tmp == 5) {print "ok 2\n";} else {print "not ok 2\n";}
if ($#ary == 3) {print "ok 3\n";} else {print "not ok 3\n";}
if (join('',@ary) eq '1234') {print "ok 4\n";} else {print "not ok 4\n";}

$[ = 1;
@ary = (1,2,3,4,5);
if (join('',@ary) eq '12345') {print "ok 5\n";} else {print "not ok 5\n";}

$tmp = $ary[$#ary]; --$#ary;
if ($tmp == 5) {print "ok 6\n";} else {print "not ok 6\n";}
if ($#ary == 4) {print "ok 7\n";} else {print "not ok 7\n";}
if (join('',@ary) eq '1234') {print "ok 8\n";} else {print "not ok 8\n";}

if ($ary[5] eq '') {print "ok 9\n";} else {print "not ok 9\n";}

$#ary += 1;	# see if we can recover element 5
if ($#ary == 5) {print "ok 10\n";} else {print "not ok 10\n";}
if ($ary[5] == 5) {print "ok 11\n";} else {print "not ok 11\n";}

$[ = 0;
@foo = ();
$r = join(',', $#foo, @foo);
if ($r eq "-1") {print "ok 12\n";} else {print "not ok 12 $r\n";}
$foo[0] = '0';
$r = join(',', $#foo, @foo);
if ($r eq "0,0") {print "ok 13\n";} else {print "not ok 13 $r\n";}
$foo[2] = '2';
$r = join(',', $#foo, @foo);
if ($r eq "2,0,,2") {print "ok 14\n";} else {print "not ok 14 $r\n";}
@bar = ();
$bar[0] = '0';
$bar[1] = '1';
$r = join(',', $#bar, @bar);
if ($r eq "1,0,1") {print "ok 15\n";} else {print "not ok 15 $r\n";}
@bar = ();
$r = join(',', $#bar, @bar);
if ($r eq "-1") {print "ok 16\n";} else {print "not ok 16 $r\n";}
$bar[0] = '0';
$r = join(',', $#bar, @bar);
if ($r eq "0,0") {print "ok 17\n";} else {print "not ok 17 $r\n";}
$bar[2] = '2';
$r = join(',', $#bar, @bar);
if ($r eq "2,0,,2") {print "ok 18\n";} else {print "not ok 18 $r\n";}
reset 'b';
@bar = ();
$bar[0] = '0';
$r = join(',', $#bar, @bar);
if ($r eq "0,0") {print "ok 19\n";} else {print "not ok 19 $r\n";}
$bar[2] = '2';
$r = join(',', $#bar, @bar);
if ($r eq "2,0,,2") {print "ok 20\n";} else {print "not ok 20 $r\n";}

$foo = 'now is the time';
if (($F1,$F2,$Etc) = ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/)) {
    if ($F1 eq 'now' && $F2 eq 'is' && $Etc eq 'the time') {
	print "ok 21\n";
    }
    else {
	print "not ok 21\n";
    }
}
else {
    print "not ok 21\n";
}

$foo = 'lskjdf';
if ($cnt = (($F1,$F2,$Etc) = ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/))) {
    print "not ok 22 $cnt $F1:$F2:$Etc\n";
}
else {
    print "ok 22\n";
}

%foo = ('blurfl','dyick','foo','bar','etc.','etc.');
%bar = %foo;
print $bar{'foo'} eq 'bar' ? "ok 23\n" : "not ok 23\n";
%bar = ();
print $bar{'foo'} eq '' ? "ok 24\n" : "not ok 24\n";
(%bar,$a,$b) = (%foo,'how','now');
print $bar{'foo'} eq 'bar' ? "ok 25\n" : "not ok 25\n";
print $bar{'how'} eq 'now' ? "ok 26\n" : "not ok 26\n";
@bar{keys %foo} = values %foo;
print $bar{'foo'} eq 'bar' ? "ok 27\n" : "not ok 27\n";
print $bar{'how'} eq 'now' ? "ok 28\n" : "not ok 28\n";

@foo = grep(/e/,split(' ','now is the time for all good men to come to'));
print join(' ',@foo) eq 'the time men come' ? "ok 29\n" : "not ok 29\n";

@foo = grep(!/e/,split(' ','now is the time for all good men to come to'));
print join(' ',@foo) eq 'now is for all good to to' ? "ok 30\n" : "not ok 30\n";

$foo = join('',('a','b','c','d','e','f')[0..5]);
print $foo eq 'abcdef' ? "ok 31\n" : "not ok 31\n";

$foo = join('',('a','b','c','d','e','f')[0..1]);
print $foo eq 'ab' ? "ok 32\n" : "not ok 32\n";

$foo = join('',('a','b','c','d','e','f')[6]);
print $foo eq '' ? "ok 33\n" : "not ok 33\n";

@foo = ('a','b','c','d','e','f')[0,2,4];
@bar = ('a','b','c','d','e','f')[1,3,5];
$foo = join('',(@foo,@bar)[0..5]);
print $foo eq 'acebdf' ? "ok 34\n" : "not ok 34\n";

$foo = ('a','b','c','d','e','f')[0,2,4];
print $foo eq 'e' ? "ok 35\n" : "not ok 35\n";

$foo = ('a','b','c','d','e','f')[1];
print $foo eq 'b' ? "ok 36\n" : "not ok 36\n";
#!./perl

# $Header: array.t,v 4.0 91/03/20 01:51:31 lwall Locked $

print "1..36\n";

@ary = (1,2,3,4,5);
if (join('',@ary) eq '12345') {print "ok 1\n";} else {print "not ok 1\n";}

$tmp = $ary[$#ary]; --$#ary;
if ($tmp == 5) {print "ok 2\n";} else {print "not ok 2\n";}
if ($#ary == 3) {print "ok 3\n";} else {print "not ok 3\n";}
if (join('',@ary) eq '1234') {print "ok 4\n";} else {print "not ok 4\n";}

$[ = 1;
@ary = (1,2,3,4,5);
if (join('',@ary) eq '12345') {print "ok 5\n";} else {print "not ok 5\n";}

$tmp = $ary[$#ary]; --$#ary;
if ($tmp == 5) {print "ok 6\n";} else {print "not ok 6\n";}
if ($#ary == 4) {print "ok 7\n";} else {print "not ok 7\n";}
if (join('',@ary) eq '1234') {print "ok 8\n";} else {print "not ok 8\n";}

if ($ary[5] eq '') {print "ok 9\n";} else {print "not ok 9\n";}

$#ary += 1;	# see if we can recover element 5
if ($#ary == 5) {print "ok 10\n";} else {print "not ok 10\n";}
if ($ary[5] == 5) {print "ok 11\n";} else {print "not ok 11\n";}

$[ = 0;
@foo = ();
$r = join(',', $#foo, @foo);
if ($r eq "-1") {print "ok 12\n";} else {print "not ok 12 $r\n";}
$foo[0] = '0';
$r = join(',', $#foo, @foo);
if ($r eq "0,0") {print "ok 13\n";} else {print "not ok 13 $r\n";}
$foo[2] = '2';
$r = join(',', $#foo, @foo);
if ($r eq "2,0,,2") {print "ok 14\n";} else {print "not ok 14 $r\n";}
@bar = ();
$bar[0] = '0';
$bar[1] = '1';
$r = join(',', $#bar, @bar);
if ($r eq "1,0,1") {print "ok 15\n";} else {print "not ok 15 $r\n";}
@bar = ();
$r = join(',', $#bar, @bar);
if ($r eq "-1") {print "ok 16\n";} else {print "not ok 16 $r\n";}
$bar[0] = '0';
$r = join(',', $#bar, @bar);
if ($r eq "0,0") {print "ok 17\n";} else {print "not ok 17 $r\n";}
$bar[2] = '2';
$r = join(',', $#bar, @bar);
if ($r eq "2,0,,2") {print "ok 18\n";} else {print "not ok 18 $r\n";}
reset 'b';
@bar = ();
$bar[0] = '0';
$r = join(',', $#bar, @bar);
if ($r eq "0,0") {print "ok 19\n";} else {print "not ok 19 $r\n";}
$bar[2] = '2';
$r = join(',', $#bar, @bar);
if ($r eq "2,0,,2") {print "ok 20\n";} else {print "not ok 20 $r\n";}

$foo = 'now is the time';
if (($F1,$F2,$Etc) = ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/)) {
    if ($F1 eq 'now' && $F2 eq 'is' && $Etc eq 'the time') {
	print "ok 21\n";
    }
    else {
	print "not ok 21\n";
    }
}
else {
    print "not ok 21\n";
}

$foo = 'lskjdf';
if ($cnt = (($F1,$F2,$Etc) = ($foo =~ /^(\S+)\s+(\S+)\s*(.*)/))) {
    print "not ok 22 $cnt $F1:$F2:$Etc\n";
}
else {
    print "ok 22\n";
}

%foo = ('blurfl','dyick','foo','bar','etc.','etc.');
%bar = %foo;
print $bar{'foo'} eq 'bar' ? "ok 23\n" : "not ok 23\n";
%bar = ();
print $bar{'foo'} eq '' ? "ok 24\n" : "not ok 24\n";
(%bar,$a,$b) = (%foo,'how','now');
print $bar{'foo'} eq 'bar' ? "ok 25\n" : "not ok 25\n";
print $bar{'how'} eq 'now' ? "ok 26\n" : "not ok 26\n";
@bar{keys %foo} = values %foo;
print $bar{'foo'} eq 'bar' ? "ok 27\n" : "not ok 27\n";
print $bar{'how'} eq 'now' ? "ok 28\n" : "not ok 28\n";

@foo = grep(/e/,split(' ','now is the time for all good men to come to'));
print join(' ',@foo) eq 'the time men come' ? "ok 29\n" : "not ok 29\n";

@foo = grep(!/e/,split(' ','now is the time for all good men to come to'));
print join(' ',@foo) eq 'now is for all good to to' ? "ok 30\n" : "not ok 30\n";

$foo = join('',('a','b','c','d','e','f')[0..5]);
print $foo eq 'abcdef' ? "ok 31\n" : "not ok 31\n";

$foo = join('',('a','b','c','d','e','f')[0..1]);
print $foo eq 'ab' ? "ok 32\n" : "not ok 32\n";

$foo = join('',('a','b','c','d','e','f')[6]);
print $foo eq '' ? "ok 33\n" : "not ok 33\n";

@foo = ('a','b','c','d','e','f')[0,2,4];
@bar = ('a','b','c','d','e','f')[1,3,5];
$foo = join('',(@foo,@bar)[0..5]);
print $foo eq 'acebdf' ? "ok 34\n" : "not ok 34\n";

$foo = ('a','b','c','d','e','f')[0,2,4];
print $foo eq 'e' ? "ok 35\n" : "not ok 35\n";

$foo = ('a','b','c','d','e','f')[1];
print $foo eq 'b' ? "ok 36\n" : "not ok 36\n";
#!./perl

# $RCSfile: regexp.t,v $$Revision: 4.0.1.1 $$Date: 91/06/10 01:30:29 $

open(TESTS,'re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
while (<TESTS>) { }
$numtests = $.;
close(TESTS);

print "1..$numtests\n";
open(TESTS,'re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
$| = 1;
while (<TESTS>) {
    ($pat, $subject, $result, $repl, $expect) = split(/[\t\n]/,$_);
    $input = join(':',$pat,$subject,$result,$repl,$expect);
    $pat = "'$pat'" unless $pat =~ /^'/;
    eval "\$match = (\$subject =~ m$pat); \$got = \"$repl\";";
    if ($result eq 'c') {
	if ($@ ne '') {print "ok $.\n";} else {print "not ok $.\n";}
    }
    elsif ($result eq 'n') {
	if (!$match) {print "ok $.\n";} else {print "not ok $. $input => $got\n";}
    }
    else {
	if ($match && $got eq $expect) {
	    print "ok $.\n";
	}
	else {
	    print "not ok $. $input => $got\n";
	}
    }
}
close(TESTS);
#!./perl

# $RCSfile: regexp.t,v $$Revision: 4.0.1.1 $$Date: 91/06/10 01:30:29 $

open(TESTS,'re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
while (<TESTS>) { }
$numtests = $.;
close(TESTS);

print "1..$numtests\n";
open(TESTS,'re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
$| = 1;
while (<TESTS>) {
    ($pat, $subject, $result, $repl, $expect) = split(/[\t\n]/,$_);
    $input = join(':',$pat,$subject,$result,$repl,$expect);
    $pat = "'$pat'" unless $pat =~ /^'/;
    eval "\$match = (\$subject =~ m$pat); \$got = \"$repl\";";
    if ($result eq 'c') {
	if ($@ ne '') {print "ok $.\n";} else {print "not ok $.\n";}
    }
    elsif ($result eq 'n') {
	if (!$match) {print "ok $.\n";} else {print "not ok $. $input => $got\n";}
    }
    else {
	if ($match && $got eq $expect) {
	    print "ok $.\n";
	}
	else {
	    print "not ok $. $input => $got\n";
	}
    }
}
close(TESTS);
#!./perl

# $RCSfile: regexp.t,v $$Revision: 4.0.1.1 $$Date: 91/06/10 01:30:29 $

open(TESTS,'re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
while (<TESTS>) { }
$numtests = $.;
close(TESTS);

print "1..$numtests\n";
open(TESTS,'re_tests') || open(TESTS,'../op/re_tests') || open(TESTS,'op/re_tests') || open(TESTS,'tests/op/re_tests') || die "Can't open re_tests";
$| = 1;
while (<TESTS>) {
    ($pat, $subject, $result, $repl, $expect) = split(/[\t\n]/,$_);
    $input = join(':',$pat,$subject,$result,$repl,$expect);
    $pat = "'$pat'" unless $pat =~ /^'/;
    eval "\$match = (\$subject =~ m$pat); \$got = \"$repl\";";
    if ($result eq 'c') {
	if ($@ ne '') {print "ok $.\n";} else {print "not ok $.\n";}
    }
    elsif ($result eq 'n') {
	if (!$match) {print "ok $.\n";} else {print "not ok $. $input => $got\n";}
    }
    else {
	if ($match && $got eq $expect) {
	    print "ok $.\n";
	}
	else {
	    print "not ok $. $input => $got\n";
	}
    }
}
close(TESTS);
#!./perl

# $RCSfile: pat.t,v $$Revision: 4.0.1.2 $$Date: 91/06/10 01:29:34 $

print "1..51\n";

$x = "abc\ndef\n";

if ($x =~ /^abc/) {print "ok 1\n";} else {print "not ok 1\n";}
if ($x !~ /^def/) {print "ok 2\n";} else {print "not ok 2\n";}

$* = 1;
if ($x =~ /^def/) {print "ok 3\n";} else {print "not ok 3\n";}
$* = 0;

$_ = '123';
if (/^([0-9][0-9]*)/) {print "ok 4\n";} else {print "not ok 4\n";}

if ($x =~ /^xxx/) {print "not ok 5\n";} else {print "ok 5\n";}
if ($x !~ /^abc/) {print "not ok 6\n";} else {print "ok 6\n";}

if ($x =~ /def/) {print "ok 7\n";} else {print "not ok 7\n";}
if ($x !~ /def/) {print "not ok 8\n";} else {print "ok 8\n";}

if ($x !~ /.def/) {print "ok 9\n";} else {print "not ok 9\n";}
if ($x =~ /.def/) {print "not ok 10\n";} else {print "ok 10\n";}

if ($x =~ /\ndef/) {print "ok 11\n";} else {print "not ok 11\n";}
if ($x !~ /\ndef/) {print "not ok 12\n";} else {print "ok 12\n";}

$_ = 'aaabbbccc';
if (/(a*b*)(c*)/ && $1 eq 'aaabbb' && $2 eq 'ccc') {
	print "ok 13\n";
} else {
	print "not ok 13\n";
}
if (/(a+b+c+)/ && $1 eq 'aaabbbccc') {
	print "ok 14\n";
} else {
	print "not ok 14\n";
}

if (/a+b?c+/) {print "not ok 15\n";} else {print "ok 15\n";}

$_ = 'aaabccc';
if (/a+b?c+/) {print "ok 16\n";} else {print "not ok 16\n";}
if (/a*b+c*/) {print "ok 17\n";} else {print "not ok 17\n";}

$_ = 'aaaccc';
if (/a*b?c*/) {print "ok 18\n";} else {print "not ok 18\n";}
if (/a*b+c*/) {print "not ok 19\n";} else {print "ok 19\n";}

$_ = 'abcdef';
if (/bcd|xyz/) {print "ok 20\n";} else {print "not ok 20\n";}
if (/xyz|bcd/) {print "ok 21\n";} else {print "not ok 21\n";}

if (m|bc/*d|) {print "ok 22\n";} else {print "not ok 22\n";}

if (/^$_$/) {print "ok 23\n";} else {print "not ok 23\n";}

$* = 1;		# test 3 only tested the optimized version--this one is for real
if ("ab\ncd\n" =~ /^cd/) {print "ok 24\n";} else {print "not ok 24\n";}
$* = 0;

$XXX{123} = 123;
$XXX{234} = 234;
$XXX{345} = 345;

@XXX = ('ok 25','not ok 25', 'ok 26','not ok 26','not ok 27');
while ($_ = shift(XXX)) {
    ?(.*)? && (print $1,"\n");
    /not/ && reset;
    /not ok 26/ && reset 'X';
}

while (($key,$val) = each(XXX)) {
    print "not ok 27\n";
    exit;
}

print "ok 27\n";

'cde' =~ /[^ab]*/;
'xyz' =~ //;
if ($& eq 'xyz') {print "ok 28\n";} else {print "not ok 28\n";}

$foo = '[^ab]*';
'cde' =~ /$foo/;
'xyz' =~ //;
if ($& eq 'xyz') {print "ok 29\n";} else {print "not ok 29\n";}

$foo = '[^ab]*';
'cde' =~ /$foo/;
'xyz' =~ /$null/;
if ($& eq 'xyz') {print "ok 30\n";} else {print "not ok 30\n";}

$_ = 'abcdefghi';
/def/;		# optimized up to cmd
if ("$`:$&:$'" eq 'abc:def:ghi') {print "ok 31\n";} else {print "not ok 31\n";}

/cde/ + 0;	# optimized only to spat
if ("$`:$&:$'" eq 'ab:cde:fghi') {print "ok 32\n";} else {print "not ok 32\n";}

/[d][e][f]/;	# not optimized
if ("$`:$&:$'" eq 'abc:def:ghi') {print "ok 33\n";} else {print "not ok 33\n";}

$_ = 'now is the {time for all} good men to come to.';
/ {([^}]*)}/;
if ($1 eq 'time for all') {print "ok 34\n";} else {print "not ok 34 $1\n";}

$_ = 'xxx {3,4}  yyy   zzz';
print /( {3,4})/ ? "ok 35\n" : "not ok 35\n";
print $1 eq '   ' ? "ok 36\n" : "not ok 36\n";
print /( {4,})/ ? "not ok 37\n" : "ok 37\n";
print /( {2,3}.)/ ? "ok 38\n" : "not ok 38\n";
print $1 eq '  y' ? "ok 39\n" : "not ok 39\n";
print /(y{2,3}.)/ ? "ok 40\n" : "not ok 40\n";
print $1 eq 'yyy ' ? "ok 41\n" : "not ok 41\n";
print /x {3,4}/ ? "not ok 42\n" : "ok 42\n";
print /^xxx {3,4}/ ? "not ok 43\n" : "ok 43\n";

$_ = "now is the time for all good men to come to.";
@words = /(\w+)/g;
print join(':',@words) eq "now:is:the:time:for:all:good:men:to:come:to"
    ? "ok 44\n"
    : "not ok 44\n";

@words = ();
while (/\w+/g) {
    push(@words, $&);
}
print join(':',@words) eq "now:is:the:time:for:all:good:men:to:come:to"
    ? "ok 45\n"
    : "not ok 45\n";

@words = ();
while (/to/g) {
    push(@words, $&);
}
print join(':',@words) eq "to:to"
    ? "ok 46\n"
    : "not ok 46 @words\n";

@words = /to/g;
print join(':',@words) eq "to:to"
    ? "ok 47\n"
    : "not ok 47 @words\n";

$_ = "abcdefghi";

$pat1 = 'def';
$pat2 = '^def';
$pat3 = '.def.';
$pat4 = 'abc';
$pat5 = '^abc';
$pat6 = 'abc$';
$pat7 = 'ghi';
$pat8 = '\w*ghi';
$pat9 = 'ghi$';

$t1=$t2=$t3=$t4=$t5=$t6=$t7=$t8=$t9=0;

for $iter (1..5) {
    $t1++ if /$pat1/o;
    $t2++ if /$pat2/o;
    $t3++ if /$pat3/o;
    $t4++ if /$pat4/o;
    $t5++ if /$pat5/o;
    $t6++ if /$pat6/o;
    $t7++ if /$pat7/o;
    $t8++ if /$pat8/o;
    $t9++ if /$pat9/o;
}

$x = "$t1$t2$t3$t4$t5$t6$t7$t8$t9";
print $x eq '505550555' ? "ok 48\n" : "not ok 48 $x\n";

$xyz = 'xyz';
print "abc" =~ /^abc$|$xyz/ ? "ok 49\n" : "not ok 49\n";

# perl 4.009 says "unmatched ()"
eval '"abc" =~ /a(bc$)|$xyz/; $result = "$&:$1"';
print $@ eq "" ? "ok 50\n" : "not ok 50\n";
print $result eq "abc:bc" ? "ok 51\n" : "not ok 51\n";
#!./perl
require "bigint.pl";

$test = 0;
$| = 1;
print "1..246\n";
while (<DATA>) {
	chop;
	if (/^&/) {
		$f = $_;
	} else {
		++$test;
		@args = split(/:/,$_,99);
		$ans = pop(@args);
		$try = "$f('" . join("','", @args) . "');";
		if (($ans1 = eval($try)) eq $ans) {
			print "ok $test\n";
		} else {
			print "not ok $test\n";
			print "# '$try' expected: '$ans' got: '$ans1'\n";
		}
	}
} 
exit;
__END__
&bnorm
abc:NaN
   1 a:NaN
1bcd2:NaN
11111b:NaN
+1z:NaN
-1z:NaN
0:+0
+0:+0
+00:+0
+0 0 0:+0
000000  0000000   00000:+0
-0:+0
-0000:+0
+1:+1
+01:+1
+001:+1
+00000100000:+100000
123456789:+123456789
-1:-1
-01:-1
-001:-1
-123456789:-123456789
-00000100000:-100000
&bneg
abd:NaN
+0:+0
+1:-1
-1:+1
+123456789:-123456789
-123456789:+123456789
&babs
abc:NaN
+0:+0
+1:+1
-1:+1
+123456789:+123456789
-123456789:+123456789
&bcmp
abc:abc:
abc:+0:
+0:abc:
+0:+0:0
-1:+0:-1
+0:-1:1
+1:+0:1
+0:+1:-1
-1:+1:-1
+1:-1:1
-1:-1:0
+1:+1:0
+123:+123:0
+123:+12:1
+12:+123:-1
-123:-123:0
-123:-12:-1
-12:-123:1
+123:+124:-1
+124:+123:1
-123:-124:1
-124:-123:-1
&badd
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:+1
+1:+1:+2
-1:+0:-1
+0:-1:-1
-1:-1:-2
-1:+1:+0
+1:-1:+0
+9:+1:+10
+99:+1:+100
+999:+1:+1000
+9999:+1:+10000
+99999:+1:+100000
+999999:+1:+1000000
+9999999:+1:+10000000
+99999999:+1:+100000000
+999999999:+1:+1000000000
+9999999999:+1:+10000000000
+99999999999:+1:+100000000000
+10:-1:+9
+100:-1:+99
+1000:-1:+999
+10000:-1:+9999
+100000:-1:+99999
+1000000:-1:+999999
+10000000:-1:+9999999
+100000000:-1:+99999999
+1000000000:-1:+999999999
+10000000000:-1:+9999999999
+123456789:+987654321:+1111111110
-123456789:+987654321:+864197532
-123456789:-987654321:-1111111110
+123456789:-987654321:-864197532
&bsub
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:-1
+1:+1:+0
-1:+0:-1
+0:-1:+1
-1:-1:+0
-1:+1:-2
+1:-1:+2
+9:+1:+8
+99:+1:+98
+999:+1:+998
+9999:+1:+9998
+99999:+1:+99998
+999999:+1:+999998
+9999999:+1:+9999998
+99999999:+1:+99999998
+999999999:+1:+999999998
+9999999999:+1:+9999999998
+99999999999:+1:+99999999998
+10:-1:+11
+100:-1:+101
+1000:-1:+1001
+10000:-1:+10001
+100000:-1:+100001
+1000000:-1:+1000001
+10000000:-1:+10000001
+100000000:-1:+100000001
+1000000000:-1:+1000000001
+10000000000:-1:+10000000001
+123456789:+987654321:-864197532
-123456789:+987654321:-1111111110
-123456789:-987654321:+864197532
+123456789:-987654321:+1111111110
&bmul
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+0:+1:+0
+1:+0:+0
+0:-1:+0
-1:+0:+0
+123456789123456789:+0:+0
+0:+123456789123456789:+0
-1:-1:+1
-1:+1:-1
+1:-1:-1
+1:+1:+1
+2:+3:+6
-2:+3:-6
+2:-3:-6
-2:-3:+6
+111:+111:+12321
+10101:+10101:+102030201
+1001001:+1001001:+1002003002001
+100010001:+100010001:+10002000300020001
+10000100001:+10000100001:+100002000030000200001
+11111111111:+9:+99999999999
+22222222222:+9:+199999999998
+33333333333:+9:+299999999997
+44444444444:+9:+399999999996
+55555555555:+9:+499999999995
+66666666666:+9:+599999999994
+77777777777:+9:+699999999993
+88888888888:+9:+799999999992
+99999999999:+9:+899999999991
&bdiv
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+1
-1:-1:+1
+1:-1:-1
-1:+1:-1
+1:+2:+0
+2:+1:+2
+1000000000:+9:+111111111
+2000000000:+9:+222222222
+3000000000:+9:+333333333
+4000000000:+9:+444444444
+5000000000:+9:+555555555
+6000000000:+9:+666666666
+7000000000:+9:+777777777
+8000000000:+9:+888888888
+9000000000:+9:+1000000000
+35500000:+113:+314159
+71000000:+226:+314159
+106500000:+339:+314159
+1000000000:+3:+333333333
+10:+5:+2
+100:+4:+25
+1000:+8:+125
+10000:+16:+625
+999999999999:+9:+111111111111
+999999999999:+99:+10101010101
+999999999999:+999:+1001001001
+999999999999:+9999:+100010001
+999999999999999:+99999:+10000100001
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
+8000000000:+9:+8
+9000000000:+9:+0
+35500000:+113:+33
+71000000:+226:+66
+106500000:+339:+99
+1000000000:+3:+1
+10:+5:+0
+100:+4:+0
+1000:+8:+0
+10000:+16:+0
+999999999999:+9:+0
+999999999999:+99:+0
+999999999999:+999:+0
+999999999999:+9999:+0
+999999999999999:+99999:+0
#&bgcd
#abc:abc:NaN
#abc:+0:NaN
#+0:abc:NaN
#+0:+0:+0
#+0:+1:+1
#+1:+0:+1
#+1:+1:+1
#+2:+3:+1
#+3:+2:+1
#+100:+625:+25
#+4096:+81:+1
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
&bnorm
abc:NaN
   1 a:NaN
1bcd2:NaN
11111b:NaN
+1z:NaN
-1z:NaN
0:+0
+0:+0
+00:+0
+0 0 0:+0
000000  0000000   00000:+0
-0:+0
-0000:+0
+1:+1
+01:+1
+001:+1
+00000100000:+100000
123456789:+123456789
-1:-1
-01:-1
-001:-1
-123456789:-123456789
-00000100000:-100000
&bneg
abd:NaN
+0:+0
+1:-1
-1:+1
+123456789:-123456789
-123456789:+123456789
&babs
abc:NaN
+0:+0
+1:+1
-1:+1
+123456789:+123456789
-123456789:+123456789
&bcmp
abc:abc:
abc:+0:
+0:abc:
+0:+0:0
-1:+0:-1
+0:-1:1
+1:+0:1
+0:+1:-1
-1:+1:-1
+1:-1:1
-1:-1:0
+1:+1:0
+123:+123:0
+123:+12:1
+12:+123:-1
-123:-123:0
-123:-12:-1
-12:-123:1
+123:+124:-1
+124:+123:1
-123:-124:1
-124:-123:-1
&badd
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:+1
+1:+1:+2
-1:+0:-1
+0:-1:-1
-1:-1:-2
-1:+1:+0
+1:-1:+0
+9:+1:+10
+99:+1:+100
+999:+1:+1000
+9999:+1:+10000
+99999:+1:+100000
+999999:+1:+1000000
+9999999:+1:+10000000
+99999999:+1:+100000000
+999999999:+1:+1000000000
+9999999999:+1:+10000000000
+99999999999:+1:+100000000000
+10:-1:+9
+100:-1:+99
+1000:-1:+999
+10000:-1:+9999
+100000:-1:+99999
+1000000:-1:+999999
+10000000:-1:+9999999
+100000000:-1:+99999999
+1000000000:-1:+999999999
+10000000000:-1:+9999999999
+123456789:+987654321:+1111111110
-123456789:+987654321:+864197532
-123456789:-987654321:-1111111110
+123456789:-987654321:-864197532
&bsub
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:-1
+1:+1:+0
-1:+0:-1
+0:-1:+1
-1:-1:+0
-1:+1:-2
+1:-1:+2
+9:+1:+8
+99:+1:+98
+999:+1:+998
+9999:+1:+9998
+99999:+1:+99998
+999999:+1:+999998
+9999999:+1:+9999998
+99999999:+1:+99999998
+999999999:+1:+999999998
+9999999999:+1:+9999999998
+99999999999:+1:+99999999998
+10:-1:+11
+100:-1:+101
+1000:-1:+1001
+10000:-1:+10001
+100000:-1:+100001
+1000000:-1:+1000001
+10000000:-1:+10000001
+100000000:-1:+100000001
+1000000000:-1:+1000000001
+10000000000:-1:+10000000001
+123456789:+987654321:-864197532
-123456789:+987654321:-1111111110
-123456789:-987654321:+864197532
+123456789:-987654321:+1111111110
&bmul
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+0:+1:+0
+1:+0:+0
+0:-1:+0
-1:+0:+0
+123456789123456789:+0:+0
+0:+123456789123456789:+0
-1:-1:+1
-1:+1:-1
+1:-1:-1
+1:+1:+1
+2:+3:+6
-2:+3:-6
+2:-3:-6
-2:-3:+6
+111:+111:+12321
+10101:+10101:+102030201
+1001001:+1001001:+1002003002001
+100010001:+100010001:+10002000300020001
+10000100001:+10000100001:+100002000030000200001
+11111111111:+9:+99999999999
+22222222222:+9:+199999999998
+33333333333:+9:+299999999997
+44444444444:+9:+399999999996
+55555555555:+9:+499999999995
+66666666666:+9:+599999999994
+77777777777:+9:+699999999993
+88888888888:+9:+799999999992
+99999999999:+9:+899999999991
&bdiv
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+1
-1:-1:+1
+1:-1:-1
-1:+1:-1
+1:+2:+0
+2:+1:+2
+1000000000:+9:+111111111
+2000000000:+9:+222222222
+3000000000:+9:+333333333
+4000000000:+9:+444444444
+5000000000:+9:+555555555
+6000000000:+9:+666666666
+7000000000:+9:+777777777
+8000000000:+9:+888888888
+9000000000:+9:+1000000000
+35500000:+113:+314159
+71000000:+226:+314159
+106500000:+339:+314159
+1000000000:+3:+333333333
+10:+5:+2
+100:+4:+25
+1000:+8:+125
+10000:+16:+625
+999999999999:+9:+111111111111
+999999999999:+99:+10101010101
+999999999999:+999:+1001001001
+999999999999:+9999:+100010001
+999999999999999:+99999:+10000100001
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
+8000000000:+9:+8
+9000000000:+9:+0
+35500000:+113:+33
+71000000:+226:+66
+106500000:+339:+99
+1000000000:+3:+1
+10:+5:+0
+100:+4:+0
+1000:+8:+0
+10000:+16:+0
+999999999999:+9:+0
+999999999999:+99:+0
+999999999999:+999:+0
+999999999999:+9999:+0
+999999999999999:+99999:+0
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
+8000000000:+9:+8
+9000000000:+9:+0
+35500000:+113:+33
+71000000:+226:+66
+106500000:+339:+99
+1000000000:+3:+1
+10:+5:+0
+100:+4:+0
+1000:+8:+0
+10000:+16:+0
+999999999999:+9:+0
+999999999999:+99:+0
+999999999999:+999:+0
+999999999999:+9999:+0
+999999999999999:+99999:+0
#&bgcd
#abc:abc:NaN
#abc:+0:NaN
#+0:abc:NaN
#+0:+0:+0
#+0:+1:+1
#+1:+0:+1
#+1:+1:+1
#+2:+3:+1
#+3:+2:+1
#+100:+625:+25
#+4096:+81:+1
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
&bnorm
abc:NaN
   1 a:NaN
1bcd2:NaN
11111b:NaN
+1z:NaN
-1z:NaN
0:+0
+0:+0
+00:+0
+0 0 0:+0
000000  0000000   00000:+0
-0:+0
-0000:+0
+1:+1
+01:+1
+001:+1
+00000100000:+100000
123456789:+123456789
-1:-1
-01:-1
-001:-1
-123456789:-123456789
-00000100000:-100000
&bneg
abd:NaN
+0:+0
+1:-1
-1:+1
+123456789:-123456789
-123456789:+123456789
&babs
abc:NaN
+0:+0
+1:+1
-1:+1
+123456789:+123456789
-123456789:+123456789
&bcmp
abc:abc:
abc:+0:
+0:abc:
+0:+0:0
-1:+0:-1
+0:-1:1
+1:+0:1
+0:+1:-1
-1:+1:-1
+1:-1:1
-1:-1:0
+1:+1:0
+123:+123:0
+123:+12:1
+12:+123:-1
-123:-123:0
-123:-12:-1
-12:-123:1
+123:+124:-1
+124:+123:1
-123:-124:1
-124:-123:-1
&badd
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:+1
+1:+1:+2
-1:+0:-1
+0:-1:-1
-1:-1:-2
-1:+1:+0
+1:-1:+0
+9:+1:+10
+99:+1:+100
+999:+1:+1000
+9999:+1:+10000
+99999:+1:+100000
+999999:+1:+1000000
+9999999:+1:+10000000
+99999999:+1:+100000000
+999999999:+1:+1000000000
+9999999999:+1:+10000000000
+99999999999:+1:+100000000000
+10:-1:+9
+100:-1:+99
+1000:-1:+999
+10000:-1:+9999
+100000:-1:+99999
+1000000:-1:+999999
+10000000:-1:+9999999
+100000000:-1:+99999999
+1000000000:-1:+999999999
+10000000000:-1:+9999999999
+123456789:+987654321:+1111111110
-123456789:+987654321:+864197532
-123456789:-987654321:-1111111110
+123456789:-987654321:-864197532
&bsub
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:-1
+1:+1:+0
-1:+0:-1
+0:-1:+1
-1:-1:+0
-1:+1:-2
+1:-1:+2
+9:+1:+8
+99:+1:+98
+999:+1:+998
+9999:+1:+9998
+99999:+1:+99998
+999999:+1:+999998
+9999999:+1:+9999998
+99999999:+1:+99999998
+999999999:+1:+999999998
+9999999999:+1:+9999999998
+99999999999:+1:+99999999998
+10:-1:+11
+100:-1:+101
+1000:-1:+1001
+10000:-1:+10001
+100000:-1:+100001
+1000000:-1:+1000001
+10000000:-1:+10000001
+100000000:-1:+100000001
+1000000000:-1:+1000000001
+10000000000:-1:+10000000001
+123456789:+987654321:-864197532
-123456789:+987654321:-1111111110
-123456789:-987654321:+864197532
+123456789:-987654321:+1111111110
&bmul
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+0:+1:+0
+1:+0:+0
+0:-1:+0
-1:+0:+0
+123456789123456789:+0:+0
+0:+123456789123456789:+0
-1:-1:+1
-1:+1:-1
+1:-1:-1
+1:+1:+1
+2:+3:+6
-2:+3:-6
+2:-3:-6
-2:-3:+6
+111:+111:+12321
+10101:+10101:+102030201
+1001001:+1001001:+1002003002001
+100010001:+100010001:+10002000300020001
+10000100001:+10000100001:+100002000030000200001
+11111111111:+9:+99999999999
+22222222222:+9:+199999999998
+33333333333:+9:+299999999997
+44444444444:+9:+399999999996
+55555555555:+9:+499999999995
+66666666666:+9:+599999999994
+77777777777:+9:+699999999993
+88888888888:+9:+799999999992
+99999999999:+9:+899999999991
&bdiv
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+1
-1:-1:+1
+1:-1:-1
-1:+1:-1
+1:+2:+0
+2:+1:+2
+1000000000:+9:+111111111
+2000000000:+9:+222222222
+3000000000:+9:+333333333
+4000000000:+9:+444444444
+5000000000:+9:+555555555
+6000000000:+9:+666666666
+7000000000:+9:+777777777
+8000000000:+9:+888888888
+9000000000:+9:+1000000000
+35500000:+113:+314159
+71000000:+226:+314159
+106500000:+339:+314159
+1000000000:+3:+333333333
+10:+5:+2
+100:+4:+25
+1000:+8:+125
+10000:+16:+625
+999999999999:+9:+111111111111
+999999999999:+99:+10101010101
+999999999999:+999:+1001001001
+999999999999:+9999:+100010001
+999999999999999:+99999:+10000100001
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
+8000000000:+9:+8
+9000000000:+9:+0
+35500000:+113:+33
+71000000:+226:+66
+106500000:+339:+99
+1000000000:+3:+1
+10:+5:+0
+100:+4:+0
+1000:+8:+0
+10000:+16:+0
+999999999999:+9:+0
+999999999999:+99:+0
+999999999999:+999:+0
+999999999999:+9999:+0
+999999999999999:+99999:+0
#&bgcd
#abc:abc:NaN
#abc:+0:NaN
#+0:abc:NaN
#+0:+0:+0
#+0:+1:+1
#+1:+0:+1
#+1:+1:+1
#+2:+3:+1
#+3:+2:+1
#+100:+625:+25
#+4096:+81:+1
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
&bnorm
abc:NaN
   1 a:NaN
1bcd2:NaN
11111b:NaN
+1z:NaN
-1z:NaN
0:+0
+0:+0
+00:+0
+0 0 0:+0
000000  0000000   00000:+0
-0:+0
-0000:+0
+1:+1
+01:+1
+001:+1
+00000100000:+100000
123456789:+123456789
-1:-1
-01:-1
-001:-1
-123456789:-123456789
-00000100000:-100000
&bneg
abd:NaN
+0:+0
+1:-1
-1:+1
+123456789:-123456789
-123456789:+123456789
&babs
abc:NaN
+0:+0
+1:+1
-1:+1
+123456789:+123456789
-123456789:+123456789
&bcmp
abc:abc:
abc:+0:
+0:abc:
+0:+0:0
-1:+0:-1
+0:-1:1
+1:+0:1
+0:+1:-1
-1:+1:-1
+1:-1:1
-1:-1:0
+1:+1:0
+123:+123:0
+123:+12:1
+12:+123:-1
-123:-123:0
-123:-12:-1
-12:-123:1
+123:+124:-1
+124:+123:1
-123:-124:1
-124:-123:-1
&badd
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:+1
+1:+1:+2
-1:+0:-1
+0:-1:-1
-1:-1:-2
-1:+1:+0
+1:-1:+0
+9:+1:+10
+99:+1:+100
+999:+1:+1000
+9999:+1:+10000
+99999:+1:+100000
+999999:+1:+1000000
+9999999:+1:+10000000
+99999999:+1:+100000000
+999999999:+1:+1000000000
+9999999999:+1:+10000000000
+99999999999:+1:+100000000000
+10:-1:+9
+100:-1:+99
+1000:-1:+999
+10000:-1:+9999
+100000:-1:+99999
+1000000:-1:+999999
+10000000:-1:+9999999
+100000000:-1:+99999999
+1000000000:-1:+999999999
+10000000000:-1:+9999999999
+123456789:+987654321:+1111111110
-123456789:+987654321:+864197532
-123456789:-987654321:-1111111110
+123456789:-987654321:-864197532
&bsub
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+1:+0:+1
+0:+1:-1
+1:+1:+0
-1:+0:-1
+0:-1:+1
-1:-1:+0
-1:+1:-2
+1:-1:+2
+9:+1:+8
+99:+1:+98
+999:+1:+998
+9999:+1:+9998
+99999:+1:+99998
+999999:+1:+999998
+9999999:+1:+9999998
+99999999:+1:+99999998
+999999999:+1:+999999998
+9999999999:+1:+9999999998
+99999999999:+1:+99999999998
+10:-1:+11
+100:-1:+101
+1000:-1:+1001
+10000:-1:+10001
+100000:-1:+100001
+1000000:-1:+1000001
+10000000:-1:+10000001
+100000000:-1:+100000001
+1000000000:-1:+1000000001
+10000000000:-1:+10000000001
+123456789:+987654321:-864197532
-123456789:+987654321:-1111111110
-123456789:-987654321:+864197532
+123456789:-987654321:+1111111110
&bmul
abc:abc:NaN
abc:+0:NaN
+0:abc:NaN
+0:+0:+0
+0:+1:+0
+1:+0:+0
+0:-1:+0
-1:+0:+0
+123456789123456789:+0:+0
+0:+123456789123456789:+0
-1:-1:+1
-1:+1:-1
+1:-1:-1
+1:+1:+1
+2:+3:+6
-2:+3:-6
+2:-3:-6
-2:-3:+6
+111:+111:+12321
+10101:+10101:+102030201
+1001001:+1001001:+1002003002001
+100010001:+100010001:+10002000300020001
+10000100001:+10000100001:+100002000030000200001
+11111111111:+9:+99999999999
+22222222222:+9:+199999999998
+33333333333:+9:+299999999997
+44444444444:+9:+399999999996
+55555555555:+9:+499999999995
+66666666666:+9:+599999999994
+77777777777:+9:+699999999993
+88888888888:+9:+799999999992
+99999999999:+9:+899999999991
&bdiv
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+1
-1:-1:+1
+1:-1:-1
-1:+1:-1
+1:+2:+0
+2:+1:+2
+1000000000:+9:+111111111
+2000000000:+9:+222222222
+3000000000:+9:+333333333
+4000000000:+9:+444444444
+5000000000:+9:+555555555
+6000000000:+9:+666666666
+7000000000:+9:+777777777
+8000000000:+9:+888888888
+9000000000:+9:+1000000000
+35500000:+113:+314159
+71000000:+226:+314159
+106500000:+339:+314159
+1000000000:+3:+333333333
+10:+5:+2
+100:+4:+25
+1000:+8:+125
+10000:+16:+625
+999999999999:+9:+111111111111
+999999999999:+99:+10101010101
+999999999999:+999:+1001001001
+999999999999:+9999:+100010001
+999999999999999:+99999:+10000100001
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
+8000000000:+9:+8
+9000000000:+9:+0
+35500000:+113:+33
+71000000:+226:+66
+106500000:+339:+99
+1000000000:+3:+1
+10:+5:+0
+100:+4:+0
+1000:+8:+0
+10000:+16:+0
+999999999999:+9:+0
+999999999999:+99:+0
+999999999999:+999:+0
+999999999999:+9999:+0
+999999999999999:+99999:+0
#&bgcd
#abc:abc:NaN
#abc:+0:NaN
#+0:abc:NaN
#+0:+0:+0
#+0:+1:+1
#+1:+0:+1
#+1:+1:+1
#+2:+3:+1
#+3:+2:+1
#+100:+625:+25
#+4096:+81:+1
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
+8000000000:+9:+8
+9000000000:+9:+0
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
&bmod
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
abc:abc:NaN
abc:+1:abc:NaN
+1:abc:NaN
+0:+0:NaN
+0:+1:+0
+1:+0:NaN
+0:-1:+0
-1:+0:NaN
+1:+1:+0
-1:-1:+0
+1:-1:+0
-1:+1:+0
+1:+2:+1
+2:+1:+0
+1000000000:+9:+1
+2000000000:+9:+2
+3000000000:+9:+3
+4000000000:+9:+4
+5000000000:+9:+5
+6000000000:+9:+6
+7000000000:+9:+7
