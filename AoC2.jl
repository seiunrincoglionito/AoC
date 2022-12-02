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