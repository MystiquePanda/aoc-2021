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
  f:`$"-" vs/:read0 hsym `$input;
  m:group (!). flip p where (`first <> last flip p) and `end<>first flip p:f, reverse each f;
  v:{$[z in y,`start;enlist z;raze z,/:/: .z.s[x;y,$[z=lower z;z;()];] each x[z] except y]}[m;();]each m[`end];
  0N!"part 1: ",string count raze v;
  v:{$[z in `start,sk:$[0 < count s:where 1<count each group y;y;()];enlist z;raze z,/:/: .z.s[x;y,$[z=lower z;z;()];] each x[z] except sk]}[m;();]each m[`end];
  0N!"part 2: ",string count where `start=last each raze v;
 }

day_13:{[input]
  f:(0;(1+f?"")) _ f:read0 hsym `$input;
  c:flip (`x`y)!flip "J"$"," vs/: -1_ first f;
  d:"="vs/: last each " " vs/: last f;
  fcf:{?[x;enlist parse "<" sv y;0b;()],![x;enlist parse ">" sv y;0b;(enlist `$first y)!enlist (-;2*"J"$last y;`$first y)]};
  0N!"part 1: ",string count select distinct x,y from c fcf/ 1#d;
  fc:c fcf/ d;
  0N!"part 2: ";
  0N!/: " *"[value {(til x) in\: y}[1+max fc[`x];] each exec x by y from update x:x-min x, y:y-min y from fc];
 }

day_14:{[input]
  f:(0;(1+f?"")) _ f:read0 hsym `$input;
  t:first f 0;
  r:(first flip r)!{x[0;0],x[1],x[0;1]}each r:" -> " vs/: f 1;
  cpf:{(first i) {x,1_ y}/ 1_ i:x p:reverse 1_ (,)prior reverse y}[r;];
  pc:count each group 10 cpf/ t;
  {(max pc) - min pc:count each group z y/ x}[t;cpf;]each til 15;

  0N!"part 1: ",string (max pc)-min pc;
  /pc:count each group 40 cpf/ t;
  /0N!"part 2: ",string (max pc)-min pc;
 }

day_15:{[input] / #hadtouseglobal
  f:flip read0 hsym `$input;
  d:count f;
  `m set k!"J"$/:f(.)/:k:raze s,\:/: s:til d;
  /p:{$[x~(0;0);0;(m x),/: raze .z.s each nc where not null m @/: nc:.sh.nw .\: x]}(-1+d;-1+d);
  /0N!"part 1: ",string min sum each p;
  0N!"part 2: ";
 }

day_16:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }

day_17:{[input]
  f:"J"$/:/:".." vs/: 2_/: ssr[;",";""]each 2_ " " vs first read0 hsym `$input;
  xmin:f[0;0];
  xmax:f[0;1];
  ymin:f[1;0];
  ymax:f[1;1];
  p:where 0<sum each not null px:(xmin+til 1+xmax-xmin) inter/: rscx:sums each cx:reverse each 1+/: til each til 1+xmax;


  (first each sx p)!(pfx p);
  /sums last flip 10 ({(0|x-1;y-1)}.)\(6;9)
  (first each cx p)!flip ((px p);((where each rscx in' px) p);(cx p);(sums each cx p ))

  0N!"part 1: ",string sum til abs ymin;
  0N!"part 2: ";
 }

\l day_18.q
day_18:{[input] / #hadtouseglobal
  f:parse each ssr[;"[]]";")"] each ssr[;"[[]";"("] each ssr[;",";" "] each read0 hsym `$input;

  0N!"part 1: ",string .day_18.calculate[f];

  c:c where not ((~).) each c:ef cross ef:enlist each f;
  0N!"part 2: ",string max .day_18.calculate each c;
 }

day_19:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }

day_20:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }

day_21:{[input]
  f:raze "J"$-1#/:" " vs/:read0 hsym `$input;
  sm:(til 10)!10,1+til 9;
  score:{[p;s;n;sm]
    $[sum 999<score:s+pos:sm (p+-3+9*(-1 0)+\:n*2) mod 10;(3*((0 -1)ll)+2*n)*min (score;s)ll:(>). score;.z.s[pos;score;n+1;sm]]
  }[;0 0;1;sm];
  0N!"part 1: ",string score f;
  0N!"part 2: ";
 }

day_22:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }

day_23:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }

day_24:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }

day_25:{[input]
  0N!"part 1: ";
  0N!"part 2: ";
 }


"*************************************************************"
"******************** advent of code 2021 ********************"
"*************************************************************"

TODAY:25;
SKIP:(16 17 19 20 22 23 24 25);
run:{
 0N!(x#"*")," Day ",sx:string x;
 $[x in SKIP;
   0N!"UNDER CONSTRUCTION!!";
   eval parse raze "0N!\"Day ",sx," time space (ms|bytes): \", \"|\" sv string system \"ts day_",sx,"[\\\"../input/day_",sx,".txt\\\"]\""];
 }

run each 1+til TODAY;
\\
