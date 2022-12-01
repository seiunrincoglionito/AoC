
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