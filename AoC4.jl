function isincluded(s::String)
    return reduce(*, reduce(-, map(x -> parse.(Int, x), split.(split(s, ","), "-")))) <= 0
end

function prob1Gio(filename::String)
    open(filename) do f
        return sum(isincluded.(readlines(f)))
    end
end

prob1Gio("input_4.txt")