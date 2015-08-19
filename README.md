Given:
E a set of m formulas f1, f2, ..., fm each of them depending on P, a set 
of n variables p_1, ..., p_n
A weight function w : E -> N U {+ oo}

Find an interpretation s of p1, ..., pn which maximises:
Sum{w(f_i) | f_i such s(f_i)}

Pre-treatment:

Suppose you are given m such formulas.
First, you put them in Conjonctive Normal Form
i.e. each f_i is now written c_i_1 /\ c_i_2 /\ ... /\ c_i_(m_i)
By the same principle used in the reduction of Sat to 3Sat we can supppose
that each c_i_j has at most 3 litterals
We add a new variable x_i to P, and replace f_i by 1 + m_i new formulas:
x_i \/ c_i_1
x_i \/ c_i_2
...
x_i \/ c_i_(m_i)
not x_i
The first m_i formulas are assigned the weight + oo while last one is assigned weight w(f_i).
It's clear that, ignoring the valuation of x_i, a maximal interpretation
for this transformed problem is a maximal interpretation of the initial
problem.

By applying this to each f_i, you can suppose that E is a set
of clauses, each consisting in at most 4 litterals.


