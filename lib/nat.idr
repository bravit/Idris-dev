import builtins;

data Nat = O | S Nat;

plus : Nat -> Nat -> Nat;
plus O     y = y;
plus (S k) y = S (plus k y);

eqRespS : m = n -> S m = S n;
eqRespS refl = refl;

plusnO : (m : Nat) -> plus m O = m;
plusnO O     = refl;
plusnO (S k) = eqRespS (plusnO k);

plusn_Sm : (n : Nat) -> (m : Nat) -> plus n (S m) = S (plus n m);
plusn_Sm O     m = refl;
plusn_Sm (S j) m = eqRespS (plusn_Sm _ _);

plus_commutes : (n : Nat) -> (m : Nat) -> plus n m = plus m n;
plus_commutes O     m = sym (plusnO m);
plus_commutes (S k) m = let ih = plus_commutes k m in ?plus_commutes_Sk;

plus_commutes_Sk = proof {
    intro k,m,ih;
    refine sym;
    rewrite (sym ih);
    refine plusn_Sm;
};
