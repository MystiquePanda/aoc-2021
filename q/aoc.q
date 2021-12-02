\e 0
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


"** Day 1"
day_1["../input/day_1.txt"]

"** Day 2"
day_2["../input/day_2.txt"]

\\
