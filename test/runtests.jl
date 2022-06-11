using MatrixPrintf
using Test

@testset "MatrixPrintf.jl" begin
  A = [1 2;
      3 4]
  B = [1  0;
      0 -1]
  C = [0.01   2;
      3.0 -400]

  @test MatrixPrintf.msprintf(A) == "[1.0 2.0;\n 3.0 4.0]"
  @test MatrixPrintf.msprintf(B) == "[ 1.0  0.0;\n  0.0 -1.0]"
  @test MatrixPrintf.msprintf(C) == "[   0.0    2.0;\n    3.0 -400.0]"

  @test MatrixPrintf.msprintf(A, symbol="A") == "A = [1.0 2.0;\n     3.0 4.0]"
  @test MatrixPrintf.msprintf(B, symbol="B") == "B = [ 1.0  0.0;\n      0.0 -1.0]"
  @test MatrixPrintf.msprintf(C, symbol="C") == "C = [   0.0    2.0;\n        3.0 -400.0]"

  @test MatrixPrintf.msprintf(A, symbol="A", digit=5) == "A = [1.00000 2.00000;\n     3.00000 4.00000]"
  @test MatrixPrintf.msprintf(B, symbol="B", digit=5) == "B = [ 1.00000  0.00000;\n      0.00000 -1.00000]"
  @test MatrixPrintf.msprintf(C, symbol="C", digit=5) == "C = [   0.01000    2.00000;\n        3.00000 -400.00000]"

  @test MatrixPrintf.msprintf(A, symbol="A", digit=2) == "A = [1.00 2.00;\n     3.00 4.00]"
  @test MatrixPrintf.msprintf(B, symbol="B", digit=2) == "B = [ 1.00  0.00;\n      0.00 -1.00]"
  @test MatrixPrintf.msprintf(C, symbol="C", digit=2) == "C = [   0.01    2.00;\n        3.00 -400.00]"

  @test MatrixPrintf.msprintf(A, symbol="A", digit=0) == "A = [1 2;\n     3 4]"
  @test MatrixPrintf.msprintf(B, symbol="B", digit=0) == "B = [ 1  0;\n      0 -1]"
  @test MatrixPrintf.msprintf(C, symbol="C", digit=0) == "C = [   0    2;\n        3 -400]"

  @test MatrixPrintf.msprintf(A, symbol="A", format="%d") == "A = [1 2;\n     3 4]"
  @test MatrixPrintf.msprintf(B, symbol="B", format="%d") == "B = [1 0;\n     0 -1]"
  @test MatrixPrintf.msprintf(C, symbol="C", format="%d") == "C = [0 2;\n     3 -400]"

  @test MatrixPrintf.msprintf(A, symbol="A", format="%8.1e") == "A = [ 1.0e+00  2.0e+00;\n      3.0e+00  4.0e+00]"
  @test MatrixPrintf.msprintf(B, symbol="B", format="%8.1e") == "B = [ 1.0e+00  0.0e+00;\n      0.0e+00 -1.0e+00]"
  @test MatrixPrintf.msprintf(C, symbol="C", format="%8.1e") == "C = [ 1.0e-02  2.0e+00;\n      3.0e+00 -4.0e+02]"
end
