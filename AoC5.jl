function prob1(filename::String)
    f = open(filename)
    stopstack = false
    horiz = []
    for ln in eachline(f)
       if ln[1:2] == " 1"
          stopstack = true
          lh = length(horiz[1])
          vert = [[] for i in 1:lh]
          for i in eachindex(horiz)
            for j in 1:lh
                horiz[i][j] != ' ' && push!(vert[j], horiz[i][j])
            end
          end
          readline()
       end
       
       if stopstack
        #moves
       end
       
       if !stopstack
           push!(horiz, [ln[2+4*i] for i in 0:(length(ln) ÷ 4)])
       end
    end
    return(vert)
end

print(prob1("input_5.txt"))