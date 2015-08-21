(* f (A /\ (B \/ C)) -> f(A /\ B) \/ f(A /\ C) *)
(* Here's the representation of a «generalized» formula *)
type formula =  | X of int
		| Not of formula
		| Or of formula * formula
		| And of formula * formula
		| Imp of formula * formula
		| Eq of formula * formula
		| Xor of formula * formula
		| Nor of formula * formula
		| Nand of formula * formula

(* Transform a generalized formula into a And-Or-Not formula *)
let rec simpl = function
	| Not(a)	-> Not(simpl a)
	| Or(a,b)	-> Or(simpl a, simpl b)
	| And(a,b)	-> And(simpl a, simpl b)
	| Imp(a,b)	-> simpl @@ Or(Not(a),b)
	| Eq(a,b)	-> simpl @@ And(Imp(a,b),Imp(b,a))
	| Xor(a,b)	-> simpl @@ And(Or(a,b),Or(Not(a),Not(b)))
	| Nor(a,b)	-> simpl @@ Not(Or(a,b))
	| Nand(a,b)	-> simpl @@ Not(And(a,b))
	| x		-> x

(* Descends «Not»s *)
let rec erase = function
	| Not(Not(x))	-> simpl x
	| Not(Or(a,b))	-> And(erase @@ Not(a), erase @@ Not(b))
	| Not(And(a,b))	-> Or(erase @@ Not(a), erase @@ Not(b))
	| Or(a,b)	-> Or(erase a, erase b)
	| And(a,b)	-> And(erase a, erase b)
	| x		-> x

(* Puts it into DNF *)
let rec satSolve = function
	| Or(a,b)		-> Or(satSolve a, satSolve b)
	| And(a,Or(b,c))	-> Or( @@ And(a,b),f @@ And(b,c))
	| And(Or(b,c),a)	-> Or(f @@ And(a,b),f @@ And(b,c))
	| And(a,And(b,c))	->
