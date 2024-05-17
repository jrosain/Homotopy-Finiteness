# Homotopy Finiteness

This repository is a formalisation of the homotopy finiteness proof in [Jonas Hoefer's
prototype](https://github.com/JonasHoefer/poset-type-theory/).

## Context

In Homotopy Type Theory, types are represented as topological spaces and the elements of a type as
points in the type's space. It allows the interpretation of equality (or *identification*) between
elements as continuous paths in this space. This system permits to formalise usual arguments used by
mathematicians -- namely, transport of properties for isomorphic structures -- using the *univalence
axiom*, that has been found to be modeled by Voevodsky.

In this interpretation, for any type $A$, there exists a type $\|A\|_0$ that is the set of connected
components of $A$, i.e., the set of elements that can be identified. For groups of fixed cardinal
$k$, it is known that such a set is finite *up to isomorphism*. Homotopy Type Theory allows us to
formalize this result thanks to the univalence axiom. This argument has been presented in Cubical
Agda and, the proof being constructive, we can theoretically evaluate the term for $k$ so that it
yields the number of connected components of the groupoid of groups of fixed cardinal $k$. However,
for an unknown reason, the computation is abnormally long.

The goal of this implementation is to better understand the computations done and, if possible,
derive and formalise a new proof that will be both more computationally (and humanly) efficient.

## Organisation of this repository

I've developed a little emacs mode that allows the use of `org-mode` when formalising things in
`postt`. It can be found in `emacs-mode/` and loaded with `M-x load-file RET
emacs-mode/ob-postt.el`. It then suffices to press `C-c C-c` (in a code block) to evaluate a file. A
minimal major mode for `postt` is also available at `emacs-mode/simple-postt-mode.el`.

This repository is otherwise organised in two folders: `lib/` and `src/`. The former contains
classical results that can be found in [1]. The latter contains the formalisation of the proof in
[3]. [2] has been a massive inspiration.

## References

1. Introduction to Homotopy Type Theory, Egbert Rijke (2022),
	[https://arxiv.org/abs/2212.11082](https://arxiv.org/abs/2212.11082)
2. Agda formalisation of Introduction to Homotopy Type Theory, Egbert Rijke (2021),
   [https://github.com/HoTT-Intro/Agda/](https://github.com/HoTT-Intro/Agda/)
3. Daily applications of the univalence axiom, Egbert Rijke (2022), Logic and Interactions in the
   Centre International de Rencontres Mathématiques (Marseille, France).  
   [slides](https://www.cirm-math.fr/RepOrga/2689/Slides/s_rijke_3.pdf),
   [talk](https://www.youtube.com/watch?v=C9Lr_D6FyWw)
