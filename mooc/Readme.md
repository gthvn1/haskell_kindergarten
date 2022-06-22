# Follow the MOOC at https://haskell.mooc.fi/

## Lecture 1

- Expressions and types are the bread and butter of Haskell.
- Expressions /= Statement
  - Expressions always return a value
  - It is a combination of values and operators
- To know a type `:t` in the repl
- Recursion
  - Fibonnacci: 1 + 1 + 2 + 3 + 5 + 8 ...
    - f 1 = 1
	- f 2 = 1
    - f n = f (n - 1) + f (n - 2)
  - How f 5 is evaluated?
    - f 5
	  - ==> f 4 + f 3
	  - ==> (f 3 + f 2) + f 3
	  - ==> ((f 2 + f 1) + f 2) + f 3
	  - ==> ((1 + 1) + f 2) + f 3
	  - ==> ((1 + 1) + 1) + (f 2 + f 1)
	  - ==> ((1 + 1) + 1) + (1 + 1)
	  - ==> 5
	- We can see it as a tree:
```
                f 5

                 +
                / \
             f 4   f 3

                 +
                / \
               +  f 3
              / \
            f 3 f 2

                 +
                / \
               +  f 3
              / \
             + f 2
            / \
          f 2 f 1

                 +
                / \
               +  f 3
              / \
             + f 2
            / \
           1   1

                 +
                / \
               +  f 3
              / \
             +   1
            / \
           1   1

                 +
                / \
               +    +
              / \  / \
             +   1 f2 f1
            / \
           1   1

                 +
                / \
               +    +      => ((1 + 1) + 1) + (1 + 1)
              / \  / \
             +   1 1  1
            / \
           1   1
```
