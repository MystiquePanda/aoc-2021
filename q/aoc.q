\e 1
\c 50 200

day_1:{[input]
  f:"I"$read0 hsym `$input;
  0N!"part 1: ", string count where 0<1_ deltas f;
  0N!"part 2: ", string count where 0<1_ deltas 2_ 3 msum f;
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
  0N!"part 1: ",string count where 1<count each group raze ((count each t) #' enlist each first flip cc) +' t;
  t:flip each {(1+max abs x)#/:(signum x) * til each 1+abs x}each (-). ' c;
  0N!"part 2: ",string count where 1<count each group raze ((count each t) #' enlist each last flip c) +' t;
 }

day_6:{[input]
  f:"J"$"," vs raze read0 hsym `$input;
  ff:f,\:80;
  fc:(count ff) + .5 * sum count each raze {if[x>=y;:()]; raze t where 0 < count each t:nf,.z.s (.)/: nf:(enlist (8;y-x+1)),(8,/:(y-x+1)-7 * 1+til (y-x+1) div 7)} ./: ff;
  0N!"part 1: ",string fc;
  0N!"part 2: ";
 }

day_7:{[input]
  f:"J"$"," vs raze read0 hsym `$input;
  0N!"part 1: ",string sum abs f - med f;
  0N!"part 2: ",string min {sum raze 1+/:til each x}each abs f -/: (floor 0.5+avg f;floor avg f);
 }

"** Day 1"
day_1["../input/day_1.txt"]

"** Day 2"
day_2["../input/day_2.txt"]

"** Day 3"
day_3["../input/day_3.txt"]

"** Day 4"
day_4["../input/day_4.txt"]

"** Day 5"
day_5["../input/day_5.txt"]

"** Day 6"
/day_6["../input/day_6.txt"]
day_6["test.txt"]

"** Day 7"
day_7["../input/day_7.txt"]
\\
