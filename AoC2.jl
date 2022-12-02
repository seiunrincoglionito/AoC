using Pkg
Pkg.activate(".")
using NamedArrays

function total_score()

    f = open("input_2.txt")
    score = 0

    for ln in eachline(f)

        adv_play = split(ln," ")[1]
        my_play = split(ln," ")[2]

        if my_play == "X" #rock
            score += 1
            if adv_play == "A" #rock -> draw
                score += 3   
            elseif adv_play == "C" #scissors -> win
                score += 6
            end

        elseif my_play == "Y" #paper
            score += 2
            if adv_play == "A" #rock -> win
                score +=6
            elseif adv_play == "B" #paper -> draw
                score += 3
            end

        elseif my_play == "Z" #scissors
            score += 3
            if adv_play == "B" #paper -> win
                score +=6
            elseif adv_play == "C" #scissors -> draw
                score += 3
            end
           
        end
        
    end
    print(score)
end

total_score()
print(" ")

function total_scoreGio(filename::String)
    f = open(filename)
    score = 0
    score_wl = NamedArray([3 6 0; 0 3 6; 6 0 3], (["A", "B", "C"], ["X", "Y", "Z"]))
    score_move = NamedArray([1 2 3; 1 2 3; 1 2 3], (["A", "B", "C"], ["X", "Y", "Z"]))
    score_tot = score_wl + score_move

    
    for ln in eachline(f)
        ln_split = split(ln, " ")
        score += score_tot[String(ln_split[1]), String(ln_split[2])]
    end
    return score
end

print(total_scoreGio("input_2.txt"))
print(" ")

function new_score()

    f = open("input_2.txt")
    score = 0

    for ln in eachline(f)

        adv_play = split(ln," ")[1]
        my_play = split(ln," ")[2]

        if my_play == "X" #lose
            if adv_play == "A" #rock -> scissors
                score += 3
            elseif adv_play == "B" #paper -> rock
                score += 1  
            elseif adv_play == "C" #scissors -> paper
                score += 2
            end

        elseif my_play == "Y" #draw
            score += 3
            if adv_play == "A" #rock -> rock
                score +=1
            elseif adv_play == "B" #paper -> paper
                score += 2
            elseif adv_play == "C" #scissors -> scissors
                score += 3
            end

        elseif my_play == "Z" #win
            score += 6
            if adv_play == "A" #rock -> paper
                score += 2
            elseif adv_play == "B" #paper -> scissors
                score += 3
            elseif adv_play == "C" #scissors -> rock
                score += 1
            end
           
        end
        
    end
    return score
end

print(new_score())