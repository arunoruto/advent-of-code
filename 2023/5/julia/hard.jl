data = readlines(joinpath(@__DIR__, "../input1.txt"))
seeds = parse.(Int, split(data[1][8:end]))
data = join(data[3:end], "\n")
data = split(data, "\n\n")
data = map(x -> split(x, "\n"), data)

previous_mapping = []
for i in eachindex(data)
    line = data[i]

    transformations = line[2:end]
    transformations = map(x -> parse.(Int, split(x)), transformations)
    transformations = map(x -> [[x[1], x[1] + x[3] - 1], [x[2], x[2] + x[3] - 1]], transformations)
    max_number = 0
    for t in transformations
        for interval in t
            max_number = max(max_number, interval[2])
        end
    end

    mapping = collect(0:max_number)
    for t in transformations
        mapping[(t[2][1] + 1):(t[2][2]+1)] = t[1][1]:t[1][2]
    end
    
    global previous_mapping
    if length(previous_mapping) > length(mapping)
        println("here")
        append!(mapping, length(mapping):(length(previous_mapping)-1))
    end
    println(previous_mapping, mapping, length(previous_mapping), " ", length(mapping))
    if i == 1
        previous_mapping = mapping
    else
        previous_mapping = map(x -> mapping[x+1], previous_mapping)
    end

end
for m in maps
    println(m)
end

seed_mappings = map(x -> previous_mapping[x+1], seeds)
println(seed_mappings)


# println(elements)
# println(min(elements...))
