data = readlines(joinpath(@__DIR__, "../input.txt"))

number_of_cards = length(data)
cards_won = ones(Int, number_of_cards)
for card in data
    findings = match(r"Card\s+(\d+): (.+) \| (.+)", card)
    card_number = parse(Int, findings.captures[1])
    winning_numbers = map(x -> parse(Int, x), split(findings.captures[2]))
    my_numbers = map(x -> parse(Int, x), split(findings.captures[3]))
    winners = filter(x -> x in winning_numbers, my_numbers)
    
    # index = map(x -> x + card_number, 1:length(winners))
    index = (1:length(winners)) .+ card_number
    # println(index)
    global cards_won[index] .+= 1 * cards_won[card_number]
end


println(sum(cards_won))