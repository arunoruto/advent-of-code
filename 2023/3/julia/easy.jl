data = readlines(joinpath(@__DIR__, "../input.txt"))

# Main idea: instead of finding each part looking for the a number around it,
# we are looking for all numbers and searching for parts around them.
parts = []
for i in eachindex(data)
    # Find numbers in line using regex
    # We also get the starting position and we know how long the number is
    matches = eachmatch(r"(\d+)", data[i])
    for m in matches
        # Get the start and stop position of the number and adjust the bounds
        start = m.offset == 1 ? 1 : m.offset - 1
        stop  = m.offset + length(m.match) - 1
        stop  = stop == length(data[i]) ? stop : stop + 1
        # Get the characters around the number
        s = ""
        s *= i == 1 ? "" : data[i-1][start:stop] # Top
        s *= start == 1 ? "" : data[i][start] # Left
        s *= stop == length(data[i]) ? "" : data[i][stop] # Right
        s *= i == length(data) ? "" : data[i+1][start:stop] # Bottom
        # Remove all dots
        s = replace(s, "." => "")

        # If the array has remaining characters, we have found a part
        # So we add the number to our array
        isempty(s) || push!(parts, parse(Int, m.match))

    end
end

# println(parts)
println(sum(parts))