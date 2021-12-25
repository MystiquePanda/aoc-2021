.day_18.parent:{$[x mod 2;x-1;x]div 2}
.day_18.idx2k:{"j"$(2 xexp -1+count x) + 2 sv "b"$(("b"$(count x)#0)|x)}

.day_18.explode:{[tree;ep]
  tree:delete from tree where k in ep[`k];
  /-get new pair left
  il:(left:first ep)[`k];
  if[a<>"j"$a:xlog[2;il];tree:update v+first ep[`v] from tree where k={$[z in x[`k];z;y&(z+1) in x[`k];z+1;.z.s[x;0b;] .day_18.parent z]}[tree;1b;]il-1];
  /-get new pair right
  ir:(right:last ep)[`k];
  if[a<>"j"$a:xlog[2;ir+1];tree:update v+last ep[`v] from tree where k={$[y in x[`k];y;.z.s[x;] .day_18.parent y]}[tree;]ir+1];
 
  tree:tree,flip (cols tree)!(.day_18.idx2k pidx;enlist pidx:-1_ left[`idx];-1+count left[`idx];0);
  :`idx xasc tree
 }

.day_18.split:{[tree;sp]
  tree:delete from tree where k in sp[`k];
  tree:tree,flip (cols tree)!((sp[`k]*2;1+sp[`k]*2);(sp[`idx],/:0 1);2#1+sp[`d];(nv;sp[`v]-nv:floor 0.5*sp[`v]));
  :`idx xasc tree
 }

.day_18.calculate:{[sfns]
  `sft set ([]k:();idx:();d:();v:());

  {
    /-populate tree
    et:0<count sft;
    if[et;[update idx:0(,)/: idx, d:d+1 from `sft;update k:.day_18.idx2k each idx from `sft]];

    { $[0<=type y 0;.z.s[x,0;y 0];if[0<sum not null y 0;`sft insert (2*.day_18.idx2k x;x,0;1+count x;y 0)]];
      $[0<=type y 1;.z.s[x,1;y 1];if[0<sum not null y 1;`sft insert (1+2*.day_18.idx2k x;x,1;1+count x;y 1)]];
    }[$[et;0 1;enlist 0];x];
    `idx xasc `sft;

    `sft set {[tree]
      /-explode
      ec:select from tree where d in exec d from (select ep:count i by d from tree where 5<d) where ep > 1;
      if[0<count ec;:.day_18.explode[tree;] 2#ec];

      /-split
      sp:select from tree where v>=10;
      if[0<count sp;:.day_18.split[tree;] first sp];
      :tree
       }/[sft];

   }each sfns;

   /-magnitude
   m:{$[1=count x;x;.z.s 0!select sum v, first d by idx from update idx:-1_/:idx, v:v*{(2 3)0=last x}each idx, d:d-1 from x where d=max d]}/[sft];
   :first exec v from m;
 }