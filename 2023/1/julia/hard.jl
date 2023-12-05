data = readlines(joinpath(@__DIR__, "../input.txt"))

numbers = Dict(
    "one"   => 1,
    "two"   => 2,
    "three" => 3,
    "four"  => 4,
    "five"  => 5,
    "six"   => 6,
    "seven" => 7,
    "eight" => 8,
    "nine"  => 9,
);

result = 0
for line in data
    number_line = zeros(Int, length(line))

    digits = eachmatch(r"(\d)", line)
    if !isnothing(digits)
        for digit in digits
            number_line[digit.offset] = parse(Int, digit.match)
        end
    end

    for (k, v) in numbers
        digits = eachmatch(Regex("($(k))"), line)
        if isnothing(digits)
            continue
        end

        for digit in digits
            o = digit.offset
            number_line[o:(o + length(k) - 1)] .= v
        end
    end
    
    filter!(x -> x != 0, number_line)

    global result += 10 * number_line[1] + number_line[end]
end

println(result)