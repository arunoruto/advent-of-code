data = readlines(joinpath(@__DIR__, "../input.txt"))

limits = Dict(
    "red"   => 12,
    "green" => 13,
    "blue"  => 14,
);
game_sum = 0
for line in data
    game_id = split(line, ": ")
    game_data = game_id[2]
    game_id = parse(Int, game_id[1][6:end])
    
    valid = true
    for set in split(game_data, "; ")
        for balls in split(set, ", ")
            ball = split(balls, " ")
            color = ball[2]
            number = parse(Int, ball[1])
            
            if number > limits[color]
                valid = false
                break
            end
        end
    end

    if valid
        global game_sum += game_id
    end
end


println(game_sum)