using Pkg
Pkg.activate(".")
Pkg.instantiate()


function halfslice(a::Array)
    [a[1:(end ÷ 2)], a[(end ÷ 2):end]]
end

function prob1Gio(filename::String)
    sum = 0
    f = open(filename)
    alphabet = 'a':'z'
    dict_l = Dict(alphabet[i] => i for i in 1:26)
    for ln in eachline(f)
        h = halfslice(split(ln, ""))
        i = intersect(h[1], h[2])
        for el in i
            sum += dict_l[only(lowercase(el))] + 26 * isuppercase(only(el))
    
        end
    end
    return sum
end

print(prob1Gio("input_3.txt"))
