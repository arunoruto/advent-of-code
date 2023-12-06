data = readlines(joinpath(@__DIR__, "../input.txt"))

power_sum = 0
for line in data
    game_id = split(line, ": ")
    game_data = game_id[2]
    game_id = parse(Int, game_id[1][6:end])

    mins = Dict(
        "red"   => 0,
        "green" => 0,
        "blue"  => 0,
    );
    
    for set in split(game_data, "; ")
        for balls in split(set, ", ")
            ball = split(balls, " ")
            color = ball[2]
            number = parse(Int, ball[1])
            
            mins[color] = max(mins[color], number)
        end
    end
    println(mins)

    global power_sum += mins["red"] * mins["green"] * mins["blue"]
end


println(power_sum)