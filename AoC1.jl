
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

    minmaxx = [0, 0, 0]
    t = 0
    c = 1
    for ln in eachline(f) 
        if ln == ""
            if c ≤ max_counter
                minmaxx[c] = t
                c += 1
            elseif t > minimum(minmaxx)
                sort!(minmaxx)
                minmaxx[1] =  t
            end
            t = 0
        else
            t += parse(Int, ln)
        end
    end

    print(sum(minmaxx))

end

minmax_cal(3)