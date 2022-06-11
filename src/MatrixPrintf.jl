module MatrixPrintf

  using Printf

  function integer_digit(x)
    return x<1 ? 1 : Int64(floor(log10(x))+1)
  end

  function auto_format(M, digit)
    if sum(M .< 0)==0 && digit==0
      margin = 0
    elseif sum(M .< 0)==0 && digit>0
      margin = 1
    elseif sum(M .< 0)!=0 && digit==0
      margin = 1
    else
      margin = 2
    end
    return "%$(maximum(integer_digit.(abs.(M))) + digit + margin).$(digit)f"
  end

  function msprintf(M; digit=1, format=:auto, symbol="")
    # Auto Format
    if format==:auto
      format = auto_format(M, digit)
    end
    # Convert each element of matrix M to formed string martix FSM
    eval_sprintf(x) = eval(Meta.parse("@sprintf(\"$(format)\", $x)"))
    FSM = eval_sprintf.(M)
    # Output FSM
    if symbol==""
      str = "$FSM"
      str = replace(str, "\""=>"")
      str = replace(str, ";"=>";\n")
    else
      str = "$symbol = $FSM"            
      str = replace(str, "\""=>"")
      str = replace(str, ";"=>";\n"*" "^(length(symbol)+3))
    end
    return str
  end

  function mprintf(M; args...)
    println(msprintf(M; args...))
  end

end
