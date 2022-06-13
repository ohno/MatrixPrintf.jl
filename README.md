# MatrixPrintf

[![Build Status](https://travis-ci.com/ohno/MatrixPrintf.jl.svg?branch=main)](https://travis-ci.com/ohno/MatrixPrintf.jl)
[![Coverage](https://codecov.io/gh/ohno/MatrixPrintf.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/ohno/MatrixPrintf.jl)
[![Coverage](https://coveralls.io/repos/github/ohno/MatrixPrintf.jl/badge.svg?branch=main)](https://coveralls.io/github/ohno/MatrixPrintf.jl?branch=main)

## Installation

To add this package, run the following code in your Jupyter Notebook:

```julia
using Pkg
Pkg.add(path="https://github.com/ohno/MatrixPrintf.jl.git")
```

or use `add` upon Pkg REPL:

```julia
]
add https://github.com/ohno/MatrixPrintf.jl.git
```

## Usage

To use this package, run the following code in your Jupyter Notebook or code:

```julia
using MatrixPrintf
```

### Examples

```julia
A = [1 2;
     3 4]

B = [1  0;
     0 -1]

C = [0.01   2;
     3.0 -400]
```

### `msprintf(M)`

```julia:input
msprintf(A)
msprintf(B)
msprintf(C)
```

```julia:output
[1.0 2.0;
 3.0 4.0]
[ 1.0  0.0;
  0.0 -1.0]
[   0.0    2.0;
    3.0 -400.0]
```

### `msprintf(M, symbol="M")`

```julia:input
msprintf(A, symbol="A")
msprintf(B, symbol="B")
msprintf(C, symbol="C")
```

```julia:output
A = [1.0 2.0;
     3.0 4.0]
B = [ 1.0  0.0;
      0.0 -1.0]
C = [   0.0    2.0;
        3.0 -400.0]
```

### `msprintf(M, symbol="M", digit=5)`

```julia:input
msprintf(A, symbol="A", digit=5)
msprintf(B, symbol="B", digit=5)
msprintf(C, symbol="C", digit=5)
```

```julia:output
A = [1.00000 2.00000;
     3.00000 4.00000]
B = [ 1.00000  0.00000;
      0.00000 -1.00000]
C = [   0.01000    2.00000;
        3.00000 -400.00000]
```

### `msprintf(M, symbol="M", digit=2)`

```julia:input
msprintf(A, symbol="A", digit=2)
msprintf(B, symbol="B", digit=2)
msprintf(C, symbol="C", digit=2)
```

```julia:output
A = [1.00 2.00;
     3.00 4.00]
B = [ 1.00  0.00;
      0.00 -1.00]
C = [   0.01    2.00;
        3.00 -400.00]
```

### `msprintf(M, symbol="M", digit=0)`

```julia:input
msprintf(A, symbol="A", digit=0)
msprintf(B, symbol="B", digit=0)
msprintf(C, symbol="C", digit=0)
```

```julia:output
A = [1 2;
     3 4]
B = [ 1  0;
      0 -1]
C = [   0    2;
        3 -400]
```

### `msprintf(M, symbol="M", format="%d")`

```julia:input
msprintf(A, symbol="A", format="%d")
msprintf(B, symbol="B", format="%d")
msprintf(C, symbol="C", format="%d")
```

```julia:output
A = [1 2;
     3 4]
B = [1 0;
     0 -1]
C = [0 2;
     3 -400]
```

### `msprintf(M, symbol="M", format="%8.1e")`

```julia:input
msprintf(A, symbol="A", format="%8.1e")
msprintf(B, symbol="B", format="%8.1e")
msprintf(C, symbol="C", format="%8.1e")
```

```julia:output
A = [ 1.0e+00  2.0e+00;
      3.0e+00  4.0e+00]
B = [ 1.0e+00  0.0e+00;
      0.0e+00 -1.0e+00]
C = [ 1.0e-02  2.0e+00;
      3.0e+00 -4.0e+02]
```

`mprintf(M)` is same as `println(msprintf(M))`. If you want to get the return value as a string, use `msprintf(M)`. `format=""` is the same as the first argument of `@sprintf` and `@printf`. For more information about `format=""`, see [my article](https://zenn.dev/ohno/articles/8b35354a8140f8) or [the official documentation](https://docs.julialang.org/en/v1/stdlib/Printf/).
