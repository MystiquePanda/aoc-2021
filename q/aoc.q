\e 1
\c 50 200
\l santas_helpers.q

day_1:{[input]
  f:"I"$read0 hsym `$input;
  0N!"part 1: ", string sum 0<1_ deltas f;
  0N!"part 2: ", string sum 0<1_ deltas 2_ 3 msum f;
 }

day_2:{[input]
  f:flip (`dir`dis)!("SJ";" ") 0: `$input;
  dh:exec sum dis from f where dir=`forward;
  0N!"part 1: ", string dh*exec sum dis * (-1 1) dir=`down from select from f where dir in `up`down;
  0N!"part 2: ", string dh*exec sum dis * 0^aim from aj[`row;`row xkey select row:i, dir, dis from f where dir=`forward;`row xkey select row:i, aim:sums dis*(-1 1) dir=`down from f where dir in `up`down];
 }

day_3:{[input]
  f:read0 hsym `$input;
  0N!"part 1: ", string (2 sv not g) * 2 sv g:((count f)%2) < d:sum each {"I"$/:x}each flip f;
  ox:{$[1=count x;x;.z.s[x where i = (0.5 * count x)<= sum i:(flip x)[y];y+1]]};
  co:{$[1=count x;x;.z.s[x where i = (0.5 * count x)> sum i:(flip x)[y];y+1]]};
  0N!"part 2: ", string (2 sv raze co[{"I"$/:x}each f;0]) * 2 sv raze ox[c:{"I"$/:x}each f;0];
 }

day_4:{[input]
  f:read0 hsym `$input;
  ns:(5_ til count n)#\:n:"J"$","vs f 0;
  b:raze bb:bt,'flip each bt:{x where not null x}each/: "J"$" " (vs)/:/:1_/: 6 cut 1_ f;
  bg:first r bn:first where 0<sum each not null r:{where raze 5=sum each x in\: y}[b;]each ns;
  w:raze b (10*bg div 10)+til 5;
  0N!"part 1: ", string (last nx)* sum w where not w in nx:ns bn;
  bn:first where (count bb) = count each distinct each r div\: 10;
  bg:first (distinct ((r bn) div 10 ) except (r bn-1) div 10);
  w:raze b (10*bg)+til 5;
  0N!"part 2: ", string (last nx)* sum w where not w in nx:ns bn;
 }

day_5:{[input]
  f:read0 hsym `$input;
  c:"J"$"," vs/:/: " -> "vs/: f;
  t:raze each (,\:/:)./: {(signum d) * til each 1+abs d:y-x}(.)/: cc:c where 0 in/: (-). ' c;
  0N!"part 1: ",string sum 1<count each group raze ((count each t) #' enlist each first flip cc) +' t;
  t:flip each {(1+max abs x)#/:(signum x) * til each 1+abs x}each (-). ' c;
  0N!"part 2: ",string sum 1<count each group raze ((count each t) #' enlist each last flip c) +' t;
 }

day_6:{[input]
  f:"J"$"," vs raze read0 hsym `$input;
  ff:f,\:80;
  fc:(count ff) + .5 * sum count each raze {if[x>=y;:()]; raze t where 0 < count each t:nf,.z.s (.)/: nf:(enlist (8;y-x+1)),(8,/:(y-x+1)-7 * 1+til (y-x+1) div 7)} ./: ff;
  0N!"part 1: ",string fc;
  /sum 9<>(3 4 3 1 2){0N!y;((((count x) - count t)#6),t:(x-1) except -1),(sum 0=x)#8}[;]/1+til 256;
  /(enlist 3){y;0N!((((count x) - count t)#2),t:(x-1) except -1),(sum 0=x)#3}[;]/1+til 10;
  0N!"part 2: ";
 }

day_7:{[input]
  f:"J"$"," vs raze read0 hsym `$input;
  0N!"part 1: ",string sum abs f - med f;
  0N!"part 2: ",string min {sum raze 1+/:til each x}each abs f -/: (floor 0.5+avg f;floor avg f);
 }

day_8:{[input]
  f:trim each flip "|" vs/: read0 hsym `$input;
  cf:flip ((asc each) each) each " " vs/:/: f;
  0N!"part 1: ",string sum (count each t:raze " " vs/: last f) in 2 3 4 7;
  cs:{
    c:`char $97+til 7;
    sd:(2 3 4 7)!(1 7 4 8);
    mt:flip (`pattern`psize)!(x 0;count each x 0);
    mt:update miss:c except/: pattern, msize:7-psize, number: sd psize from mt;
    mt:update number:2 from mt where 1=sum each miss in where 1=count each group exec raze miss from mt;
    mt:update number:9 from mt where miss like where 3=count each group exec raze miss from mt where null number;
    mt:update number:0 from mt where msize=1, (raze miss) in where 1=count each group exec raze miss from mt where null number;
    mt:update number:6 from mt where null number, msize=1;
    mt:update number:3 from mt where null number, 2=sum each (exec raze pattern from mt where number=1) in/: pattern;
    mt:update number:5 from mt where null number;
    :sum (((`$mt[`pattern])!mt[`number]) `$asc each x 1)*reverse 10 xexp til 4;
   } each cf;
  0N!"part 2: ",string sum cs;
 }

day_9:{[input] / #hadtouseglobal
 `m set "I"$/:/:read0 hsym `$input;
 h:count m;
 w:count first m;
 l:{[x;y;m] m[x;y] < min m ./: .sh.nsew .\: (x;y)}[;;m] ./: mc: raze (til h),/:\:til w;
 0N!"part 1: ",string sum (raze 1+m)*l;
 lp:mc where l;
 bs:{count distinct x} each { nc:c where 9 <> 9^m ./: c:.sh.nsew .\: (x;y);$[0=count nc;nc;[`m set m {x[y 0;y 1]:9;x}/nc;nc,raze .z.s ./: nc]]} ./:lp;
 0N!"part 2: ",string 1*/3# desc bs;
 }

day_10:{[input]
 m:`$/:/:read0 hsym `$input;
 om:(`$/:"[<{(")!`$/:"]>})";
 pm:(`$/:")]}>")!3 57 1197 25137;
 mm:(`$"(")^first each {()({if[(0h<>type x) and null first z first x;:x];$[y in key z;x,y;$[(z last x) <> y;y;-1_ x]]}[;;y])/ x}[;om] each m;
 0N!"part 1: ",string sum pm mm where not mm in key om;
 fpm:(`$/:")]}>")!1 2 3 4;
 pc:tp where 0<tp:asc -1^{0{y+5*x}/y z reverse x}[;fpm;om] each {()({if[(0h<>type x) and null first z first x;:x];$[y in key z;x,y;$[(z last x) <> y;y;-1_ x]]}[;;y])/ x}[;om] each m;
 0N!"part 2: ",string pc floor 0.5 * count pc;
 }

day_11:{[input] / #hadtouseglobal
 m:"I"$/:/:read0 hsym `$input;
 `mt set update l:m ./: flip (x;y) from flip (`x`y)!flip raze (til count m),/:\:til count first m;
 f:{update l+1 from `mt;{fi:`x`y xkey `long$flip (`x`y`l)!flip (key sr),' value sr:count each group raze .sh.nsewd .\:/: flash:exec flip (x;y) from mt where l>9;`mt set (mt pj (fi lj 2!select from mt where l=0)) lj 2!flip (`x`y`l)!flip flash,\:0;x+count flash}/[0]};
 0N!"part 1: ", string sum 100 f\0;
 /reset mt, because global
 `mt set update l:m ./: flip (x;y) from flip (`x`y)!flip raze (til count m),/:\:til count first m;
 s:enlist 0;
 while[(last s)<>count mt;s,:f[]];
 0N!"part 2: ",string -1+count s;
 }

day_12:{[input]
 0N!"part 1: ";
 0N!"part 2: ";
 }

"*************************************************************"
"******************** advent of code 2021 ********************"
"*************************************************************"
/
TODAY:12
run:{eval parse (0N!"day_",x),"[\"../input/day_",x,".txt\"]"}

run each string 1+til TODAY
\

0N!"** Day 1";
0N!"Day 1 time space (ms|bytes): ", "|" sv string system "ts day_1[\"../input/day_1.txt\"]";

"** Day 2"
0N!"Day 2 time space (ms|bytes): ", "|" sv string system "ts day_2[\"../input/day_2.txt\"]";

"** Day 3"
0N!"Day 3 time space (ms|bytes): ", "|" sv string system "ts day_3[\"../input/day_3.txt\"]";

"** Day 4"
0N!"Day 4 time space (ms|bytes): ", "|" sv string system "ts day_4[\"../input/day_4.txt\"]";

"** Day 5"
0N!"Day 5 time space (ms|bytes): ", "|" sv string system "ts day_5[\"../input/day_5.txt\"]";

"** Day 6"
0N!"Day 6 time space (ms|bytes): ", "|" sv string system "ts day_6[\"../input/day_6.txt\"]";
/0N!"Day 9 time space (ms|bytes): ", "|" sv string system "ts day_6[\"test.txt\"]";

"** Day 7"
0N!"Day 7 time space (ms|bytes): ", "|" sv string system "ts day_7[\"../input/day_7.txt\"]";

"** Day 8"
0N!"Day 8 time space (ms|bytes): ", "|" sv string system "ts day_8[\"../input/day_8.txt\"]";

"** Day 9"
0N!"Day 9 time space (ms|bytes): ", "|" sv string system "ts day_9[\"../input/day_9.txt\"]";

"** Day 10"
0N!"Day 10 time space (ms|bytes): ", "|" sv string system "ts day_10[\"../input/day_10.txt\"]";

"** Day 11"
0N!"Day 11 time space (ms|bytes): ", "|" sv string system "ts day_11[\"../input/day_11.txt\"]";

"** Day 12"
/0N!"Day 12 time space (ms|bytes): ", "|" sv string system "ts day_12[\"../input/day_12.txt\"]";
/0N!"Day 12 time space (ms|bytes): ", "|" sv string system "ts day_12[\"test.txt\"]";

\\
