# The *Stable Marriage* Domain

### Overall usage

```bash
python gale_shapley.py -h
```

Options are

| Options       | Meaning                                                    |
| ------------- | ---------------------------------------------------------- |
| --index INDEX | instance index, the file will be at sm/<index>/instance.lp |
| --num NUM     | the number of men/women                                    |
| --seed SEED   | random seed                                                |

### How to generate an random instance

For example, first change your working directory to `Non-Inc-Domain/sm`

```bash
python gale_shapley.py --index 3 --num 100 --seed 0
```

where the random see is 0 by default.

The above command will generate an instance with 100 men and women. Each men will have a full preference over all women, i.e. 100 x 100 facts in total. The instance file will be placed at `Non-Inc-Domain/sm/3/instance.lp`.

The instance file will have factual predicates in the form of `manAssignsScore(m, w, s).`, meaning that man `m` is assignning score `s` to women `w`, the higher the score is the higher preference will be. Similarly for `womanAssignsScore(m, w, s).`

##### Solving w/ and w/o heuristics.

For the above example,

```bash
clingo solve.lp 3/instance.lp  # without heuristic
clingo solve_related.lp 3/instance.lp  # with heuristic 
```

The heuristic is encoded as

```
% relate a man with a women
% only if index_women - index_men < 3 or index_man - index_women < 3
range(3).
related(M, W)
	:- manAssignsScore(M,_,_), womanAssignsScore(W,_,_), M - W <= R, M - W >= 0, range(R).
related(M, W)
	:- manAssignsScore(M,_,_), womanAssignsScore(W,_,_), W - M <= R, W - M >= 0, range(R).
```

### [Optional] How are those artificial Instances constructed

The procedure is:

1. Randomly generate an instance, say $I$, where $M$ (resp. $W$) denotes the set of men (resp. women).
2. Run Gale-Shapley algorithm on $I$ to obtain a stable matching, i.e., a bipartite matching (denoted as $B$) from $M$ to $W$ .
3. Find a renaming mapping, such that when it is applied to each individuals in $W$, the bipartite matching will become one where the $i$-th men is coupled with the $i$-th women. Denote the new matching as $B'$.
4. Apply the renaming mapping to the random instance generated at Step 1, to obtain a different instance $I'$. Now it can be ensured that $B'$ must be a stable matching of $I'$.