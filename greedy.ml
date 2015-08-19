(* 
1) A clausal value decreases with size
2) A litteral weight increases with its variable's weight
3) A litteral weight increases with the value of clauses it appears in
4) A litteral value follow its weight, but is negatively correlated with the opposed litteral's weight

Clause = Litteral List
Formula = Clause Array
Correspondance = Int List Array
ClaVal = Float Array
LitWei = Float Array
LitVal = Float Heap
*)

(*
A /\ (B \/ C) -> (A /\ B) \/ (A /\ C)
*)

let valuateClause clause =
	1. /. (float @@ List.length clause)


let solve formula initValue =
	let numbForm = Array.length formula
	and numbLit = Array.length initValue in
	let claVal = Array.init numbForm
	(fun i -> valuateClause (formula.(i))) in
	let litWei = Array.init numbLit
