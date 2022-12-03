using Pkg
Pkg.activate(".")
Pkg.instantiate()


function halfslice(a::String)
    [a[1:(end ÷ 2)], a[(end ÷ 2 + 1):end]]
end

function prob1Gio(filename::String)
    sum = 0
    f = open(filename)
    alphabet = 'a':'z'
    dict_l = Dict(alphabet[i] => i for i in 1:26)
    for ln in eachline(f)
        h = halfslice(ln)
        i = intersect(h[1], h[2])
        for el in i
            sum += (dict_l[only(lowercase(el))] + 26 * isuppercase(only(el)))

        end
    end
    return sum
end

print(prob1Gio("input_3.txt"))

function prob2Gio(filename::String)
    sum = 0
    alphabet = 'a':'z'
    dict_l = Dict(alphabet[i] => i for i in 1:26)

    f = open(filename)
    l = readlines(f)
    triplets = [l[i:(i+2)] for i in 1:3:length(l)]
    for el in triplets
        i = intersect(el[1], el[2], el[3])[1]
        sum += (dict_l[lowercase(i)] + 26 * isuppercase(i))
    end
    return sum
end

println(prob1Gio("input_3.txt"))

function split_comp(s::String)

    s1 = s[1:Int(length(s)/2)]
    s2 = s[Int(length(s)/2)+1 : Int(length(s))]
    return s1, s2

end

function match_char(s1::String, s2::String)

    for c in s1
        if contains(s2, c)
          return c
        end
    end

end

function priority(c::Char)

    if isuppercase(c)
        return (Int(c) - 38)
    else 
        return (Int(c) - 96)
    end

end

function tot_priorities(input::String)
    
    f = open(input)
    tot = 0

    for ln in eachline(f)
        s1, s2 = split_comp(ln)
        c = match_char(s1, s2)
        tot += priority(c)
    end

    return tot

end

println(tot_priorities("input_3.txt"))
println(priority('p'))
println(priority('L'))