# Homotopy Finiteness

This repository is a formalisation of Rijke's proof that the number of groups of finite order is
finite [3] in [Jonas Hoefer's prototype](https://github.com/JonasHoefer/poset-type-theory/).

The goal of this implementation is to better understand the computations done and, if possible,
derive and formalise a new proof, "better" (for some definition of better) proof.

An HTML rendering of the formalization is available at [this
URL](https://jrosain.github.io/Homotopy-Finiteness/).

## Setup

Everything needed to execute this project is bundled into this repository. Beware that the cloning
must happen to download submodules. One way of doing it is as follows:
* in SSH: 
```console
git clone --recursive-submodules git@github.com:jrosain/Homotopy-Finiteness.git
```
* in HTTPs:
```console
git clone --recursive-submodules https://github.com/jrosain/Homotopy-Finiteness.git
```

If you have already cloned the repository, no worries. Use the following command:
```console
git submodule init && git submodule update
```

Once cloned, `cd poset-type-theory` and follow the installation instructions
[here](https://github.com/JonasHoefer/poset-type-theory/blob/e1ac6042a0ae3d55469e27ef9094e8cf5ec80eb3/README.md).  
Now, you should be able to run the command `postt repl`. Then, you should be able to load the main proof of this work:
```console
:load -s src/Playground.ctt
```
Afterwards, you can unfold to compute the number of groups of order, say, one up to isomorphism:
```console
:unfold number-of-Group-of-Order-one
```

## Emacs modes

A small emacs mode has been developed so that `org-mode` can be used to formalize things. It can be
found in the folder `emacs-mode/` and loaded with `M-x load-file RET emacs-mode/ob-ctt.el`. It then
suffices to press `C-c C-c` (in a code block) to evaluate a file. It also contains a copy of the
minimal major mode that can be found
[here](https://github.com/JonasHoefer/poset-type-theory/blob/main/ctt-mode.el), with some additional
tweaks to beautify the often-used symbols.

## Organisation of this repository

The goal of this repository is twofold:
* develop a library of standard results following [1, 2] ;
* formalize the homotopy finiteness proof of [3].

As such, it is organized as follows: the `src/Lib` folder contains the standard results, that should
be merged in the [standard
library](https://github.com/JonasHoefer/poset-type-theory/tree/main/library) of the language at some
point, and the other files of the `src/` folder contain the formalization of [3].

Some name and proofs of `src/Lib` have been adapted from [4].

## References

1. Introduction to Homotopy Type Theory, Egbert Rijke (2022),
	[https://arxiv.org/abs/2212.11082](https://arxiv.org/abs/2212.11082)
2. The HoTT Book, The Univalent Foundation Program (2013), [https://homotopytypetheory.org/book/](https://homotopytypetheory.org/book/)
3. Daily applications of the univalence axiom, Egbert Rijke (2022), Logic and Interactions in the
   Centre International de Rencontres Mathématiques (Marseille, France).  
   [slides](https://www.cirm-math.fr/RepOrga/2689/Slides/s_rijke_3.pdf),
   [talk](https://www.youtube.com/watch?v=C9Lr_D6FyWw)
4. Agda Unimath Library,
   [https://unimath.github.io/agda-unimath/HOME.html](https://unimath.github.io/agda-unimath/HOME.html)
