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

## Lecture 2

### Recursion
- Type of recursion where a function just directly calls itself with different arguments
  is called **tail recursion**.
- Tail recursion corresponds to loops.
- This is why tail recursion is often fast: the compiler can generate a loop in machine
  code when it sees tail recursion.

### Lists
- Lists are used to store multiple values of the same type
- operations like: *head, tail, init, take, drop, (++), (!!), reverse, null, length...*
  - Some operation comes from **Data.List**
    - `import Data.List`
- Range syntax: *[1..10]*
- In a type like *[Char]*, *Char* is a **type parameter**
- A type that needs a type parameter is called **parametrized type**

### Maybe, Either

- *Maybe* is a Type
- It has *constructors*:
  - `Nothing` and `Just`
- We can pattern match constructors
- Constructors that takes no arguments (`Nothing`, `Bool`, ...) are just constants
- Constructors with arguments (like `Just`) behave like functions.
- *Either* is a Type
- It has *constructors*:
  - `Left` and `Right`
