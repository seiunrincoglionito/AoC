
function max_cal()
    f = open("input.txt")

    maxx = -1
    t = 0

    for ln in eachline(f)
        if ln == ""
            if t >  maxx
                maxx =  t
            end
            t = 0
        else
            t += parse(Int, ln)
        end
    end

print(maxx)

end

max_cal()


function minmax_cal(max_counter::Int)
    f = open("input.txt")

    minmaxx = [-1, -1, -1]
    t = 0
    c = 1
    for ln in eachline(f) 
        if ln == ""
            if c ≤ max_counter
                minmaxx[c] = t
                sort!(minmaxx)
            elseif t > min(minmaxx)
                minmax[1] =  t
                sort!(minmaxx)
            end
            t = 0
        else
            t += parse(Int, ln)
        end
    end

print(sum(minmaxx))

end

minmax_cal(3)