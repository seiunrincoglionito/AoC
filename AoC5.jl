function prob1(filename::String)
    f = open(filename)
    stopstack = false
    horiz = []
    
    vert = Array[]
    
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
            readline(f)
            continue # to skip the rest of the loop
         end         
        if !stopstack
           push!(horiz, [ln[2+4*i] for i in 0:(length(ln) ÷ 4)])
       else
            howmany, xtoy = split(ln[6:end], " from ")
            from, to = parse.(Int, split(xtoy, " to "))
            for h in 1:parse(Int, howmany)
                pushfirst!(vert[to], vert[from][1])
                popfirst!(vert[from])
            end
        end
    end
    return(join([v[1] for v in vert]))
end


prob1("input_5.txt")

function prob2(filename::String)
    f = open(filename)
    stopstack = false
    horiz = []
    
    vert = Array[]
    
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
            readline(f)
            continue # to skip the rest of the loop
         end         
        if !stopstack
           push!(horiz, [ln[2+4*i] for i in 0:(length(ln) ÷ 4)])
       else
            howmany, xtoy = split(ln[6:end], " from ")
            from, to = parse.(Int, split(xtoy, " to "))
            hmint = parse(Int, howmany)
            for h in 1:hmint
                pushfirst!(vert[to], vert[from][hmint+1-h])
                deleteat!(vert[from], hmint+1-h)
            end
        end
    end
    return(join([v[1] for v in vert]))
end

prob2("input_5.txt")