data = readlines(joinpath(@__DIR__, "../input.txt"))

points_sum = 0
for card in data
    findings = match(r"Card\s+(\d+): (.+) \| (.+)", card)
    println(findings)
    card_number = parse(Int, findings.captures[1])
    winning_numbers = map(x -> parse(Int, x), split(findings.captures[2]))
    my_numbers = map(x -> parse(Int, x), split(findings.captures[3]))
    winners = filter(x -> x in winning_numbers, my_numbers)
    points = isempty(winners) ? 0 : 2^(length(winners) - 1)
    global points_sum += points
    # println(card_number, " ", points)
end


println(points_sum)