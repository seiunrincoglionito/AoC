function isfullyincluded(s::String)
    return reduce(*, reduce(-, map(x -> parse.(Int, x), split.(split(s, ","), "-")))) <= 0
end

function prob1Gio(filename::String)
    open(filename) do f
        return sum(isfullyincluded.(readlines(f)))
    end
end

prob1Gio("input_4.txt")

function prob2Gio(filename::String)
    f = open(filename)
    count = 0
    for ln in eachline(f)
        m = map(x -> parse.(Int, x), split.(split(ln, ","), "-"))
        sort!(m)
        # I need to sort!(m) so that also the full inclusion is counted
        count += (reduce(*, m[1] .- m[2][1]) <= 0)
    end
    return count
end

prob2Gio("input_4.txt")